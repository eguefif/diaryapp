import 'package:diaryapp/models/diary_model.dart';
import 'package:diaryapp/views/widget/entries_view/row_button_entry.dart';
import 'package:flutter/material.dart';

class OneRowEntry extends StatelessWidget {
  const OneRowEntry({
    super.key,
    required this.entries,
    required this.deleteEntry,
    required this.index,
  });
  final List<Entry> entries;
  final int index;
  final void Function(Entry) deleteEntry;

  @override
  Widget build(BuildContext context) {
    return Dismissible(
      background: Container(color: Colors.red),
      key: ValueKey<Entry>(entries[index]),
      onDismissed: (DismissDirection direction) {
        deleteEntry(entries[index]);
      },
      child: RowButtonEntry(entry: entries[index]),
    );
  }
}
