import 'package:diaryapp/models/diary_model.dart';
import 'package:diaryapp/views/widget/entries_view/one_row_entry.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class Entries extends StatelessWidget {
  const Entries({super.key, required this.forProfile, this.date});

  final bool forProfile;
  final DateTime? date;

  @override
  Widget build(BuildContext context) {
    return Consumer<DiaryModel>(
      builder: (context, controller, child) {
        List<Entry> entries = controller.getEntries(date);
        int itemCount = entries.length;
        if (forProfile) {
          itemCount = itemCount < 2 ? itemCount : 2;
        } 
        if (itemCount == 0 && !forProfile) {
          return const Center(
              child: Text("You don't have entries for this day"));
        }
        else if (itemCount == 0 && forProfile) {
          return const Center(
              child: Text("You don't yet, write your first diary entry!"));
        }
        return ListView.builder(
          itemCount: itemCount,
          itemBuilder: (ctx, index) {
            return OneRowEntry(
              entries: entries,
              deleteEntry: controller.deleteEntry,
              index: index,
            );
          },
        );
      },
    );
  }
}
