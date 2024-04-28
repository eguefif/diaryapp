import 'package:diaryapp/models/diary_model.dart';
import 'package:diaryapp/views/widget/entries_view/one_row_entry.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class Entries extends StatelessWidget {
  const Entries({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<DiaryModel>(
      builder: (context, controller, child) {
        return ListView.builder(
          itemCount: controller.entries.length,
          itemBuilder: (ctx, index) {
            return OneRowEntry(
              controller: controller,
              index: index,
            );
          },
        );
      },
    );
  }
}
