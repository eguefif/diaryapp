import 'package:diaryapp/models/diary_model.dart';
import 'package:diaryapp/views/widget/entries_view/row_button_entry.dart';
import 'package:flutter/material.dart';

class OneRowEntry extends StatelessWidget {
  const OneRowEntry({
    super.key,
    required this.controller,
    required this.index,
  });
  final DiaryModel controller;
  final int index;

  @override
  Widget build(BuildContext context) {
    return Dismissible(
      background: Container(color: Colors.red),
      key: ValueKey<Entry>(controller.entries[index]),
      onDismissed: (DismissDirection direction) {
        controller.deleteEntry(index);
      },
      child: RowButtonEntry(controller: controller, index: index),
    );
  }
}
