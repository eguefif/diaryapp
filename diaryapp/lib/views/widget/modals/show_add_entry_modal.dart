import 'package:diaryapp/models/diary_model.dart';
import 'package:diaryapp/views/widget/modals/new_entry/new_entry_horizontal.dart';
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
        child: const NewEntry(),
      );
    },
  );
}
