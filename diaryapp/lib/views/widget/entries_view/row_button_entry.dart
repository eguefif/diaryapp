import 'package:diaryapp/models/diary_model.dart';
import 'package:diaryapp/views/widget/entries_view/entry_row.dart';
import 'package:diaryapp/views/widget/modals/show_entry_modal.dart';
import 'package:flutter/material.dart';

class RowButtonEntry extends StatelessWidget {
  const RowButtonEntry({
    super.key,
    required this.entry,
  });
  final Entry entry;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: () {
        showEntryModal(entry, context);
      },
      style: _styleRowButtonEntry(),
      child: EntryRow(
          date: entry.date,
          title: entry.title,
          feeling: entry.feeling),
    );
  }

  ButtonStyle _styleRowButtonEntry() {
    return ElevatedButton.styleFrom(
      elevation: 0,
      backgroundColor: Colors.white,
      shape: const RoundedRectangleBorder(
        side: BorderSide(
          width: 5,
          color: Colors.green,
        ),
        borderRadius: BorderRadius.zero,
      ),
    );
  }
}
