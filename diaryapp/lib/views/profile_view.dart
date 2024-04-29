import 'package:diaryapp/views/calendar_view.dart';
import 'package:diaryapp/views/profile_body_view.dart';
import 'package:diaryapp/views/widget/appbar.dart';
import 'package:diaryapp/views/widget/buttons/add_entry_button.dart';
import 'package:flutter/material.dart';

class ProfileView extends StatelessWidget {
  const ProfileView({super.key, required this.logout});

  final Function logout;

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      initialIndex: 0,
      length: 2,
      child: Scaffold(
        appBar: DiaryAppBar(logout: logout),
        body: const TabBarView(
          children: <Widget>[
            ProfileBodyView(),
            CalendarView(),
          ],
        ),
        floatingActionButton: const AddEntryButton(),
        bottomNavigationBar: const TabBar(tabs: <Widget>[
          Tab(
            icon: Icon(Icons.person_outlined),
          ),
          Tab(
            icon: Icon(Icons.calendar_today_outlined),
          ),
        ]),
      ),
    );
  }
}