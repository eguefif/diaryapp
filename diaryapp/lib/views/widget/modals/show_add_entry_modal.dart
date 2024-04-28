import 'package:diaryapp/models/diary_model.dart';
import 'package:diaryapp/views/widget/modals/new_entry/new_entry.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void openAddEntryModal(BuildContext context) {
  final DiaryModel diaryModel = Provider.of<DiaryModel>(context, listen: false);
  showModalBottomSheet(
    context: context,
    useSafeArea: true,
    isScrollControlled: true,
    builder: (ctx) {
      return ChangeNotifierProvider<DiaryModel>.value(
        value: diaryModel,
        child: const SizedBox(
          height: double.infinity,
          width: double.infinity,
          child: Padding(
            padding: EdgeInsets.fromLTRB(16, 16, 16, 16),
            child: NewEntry(),
          ),
        ),
      );
    },
  );
}
