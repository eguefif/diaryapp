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
        int itemCount = controller.entries.length;
        if (forProfile){
          itemCount = itemCount < 2 ? itemCount : 2;
        }
        return ListView.builder(
          itemCount: itemCount,
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
