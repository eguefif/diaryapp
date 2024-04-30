import 'dart:convert';

import 'package:auth0_flutter/auth0_flutter.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

enum Feeling {
  smile("assets/smile.svg", "smile"),
  anger("assets/angry.svg", "anger"),
  neutral("assets/neutral.svg", "neutral"),
  sad("assets/sad.svg", "sad");

  const Feeling(this.asset, this.description);
  final String asset;
  final String description;
}

class DiaryModel extends ChangeNotifier {
  final List<Entry> _entries = <Entry>[];
  String? token;
  Credentials? _credentials;
  CollectionReference? entriesFirebase;
  String? email;
  String? name = "DiaryApp";

  Future<void> connectToFireBase(credentials) async {
    _credentials = credentials;
    await _getEntries();
  }

  void removeCredentials() {
    _credentials = null;
  }

  @override
  void dispose() {
    super.dispose();
    _entries.clear();
  }

  Future<void> _getEntries() async {
    if (_credentials == null) {
      return;
    }
    _entries.clear();
    String token = await _authApi(_credentials);
    email = _credentials!.user.email;
    name = _credentials!.user.name ?? "Diaryapp";
    try {
      await FirebaseAuth.instance.signInWithCustomToken(token);
      entriesFirebase = FirebaseFirestore.instance.collection('diary_entries');
      QuerySnapshot snapshot = await entriesFirebase!.get();
      List<QueryDocumentSnapshot> list = snapshot.docs;
      for (var entry in list) {
        if (entry.get("email") == email) {
          _entries.add(
            Entry(
              content: entry.get("content"),
              title: entry.get("title"),
              date: entry.get("date"),
              feeling: entry.get("feeling"),
              id: entry.id,
            ),
          );
        }
      }
      _entries.sort((a, b) => b.date - a.date);
    } catch (e) {
      debugPrint("FIREBASE ERROR $e");
    }
    notifyListeners();
  }

  void addEntry(Entry entry) async {
    _entries.add(entry);
    try {
      DocumentReference newEntry = await entriesFirebase!.add(
        {
          "title": entry.title,
          "content": entry.content,
          "date": entry.date,
          "feeling": entry.feeling,
          "email": email,
        },
      );
      _entries.last.id = newEntry.id;
    } catch (e) {
      debugPrint("ADD FIREBASE: $e");
    }
    _entries.sort((a, b) => b.date - a.date);
    notifyListeners();
  }

  void deleteEntry(Entry entry) async {
    await entriesFirebase!.doc(entry.id).delete();
    _entries.remove(entry);
    notifyListeners();
  }

  Entry getEntry(int index) {
    return _entries[index];
  }

  String getFeelingStat(String feeling) {
    final int total = _entries.length;
    if (total == 0) {
      return "0%";
    }
    int count = 0;
    for (final entry in _entries) {
      if (entry.feeling == feeling) {
        count++;
      }
    }
    return "${(count / total * 100).toInt()}%";
  }

  List<Entry> get entries => _entries;

  List<Entry> getEntries(DateTime? date) {
    if (date == null) {
      print("COUNT NULL)");
      return _entries;
    }
    List<Entry> retval = [];
    for (var entry in _entries) {
      print(
          "COUNT ${date.toString()} and ${DateTime.fromMillisecondsSinceEpoch(entry.date).toString()}");
      if (_isSameDay(date, DateTime.fromMillisecondsSinceEpoch(entry.date))) {
        retval.add(entry);
      }
    }
    print("COUNT $retval");
    return retval;
  }

  bool _isSameDay(DateTime d1, DateTime d2) {
    return (d1.year == d2.year && d1.month == d2.month && d1.day == d2.day);
  }
}

class Entry {
  final String title;
  final int date;
  final String feeling;
  final String content;
  String? id;

  Entry(
      {required this.title,
      required this.date,
      required this.feeling,
      required this.content,
      this.id});
}

Future<String> _authApi(credentials) async {
  const url = "http://192.168.0.45:8000";
  //const url = "http://c1r7p10.42quebec.com/";
  //const url = "http://10.0.2.2:8000/";
  if (credentials != null) {
    var retval = await http.get(Uri.parse(url), headers: {
      "authorization": "Bearer ${credentials!.idToken}",
      "name": "${credentials!.user.name}",
      "email": "${credentials!.user.email}",
    });
    var token = jsonDecode(retval.body)["token"];
    return token;
  }
  return "";
}
