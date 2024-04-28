import 'package:diaryapp/views/widget/modals/new_entry/new_entry_horizontal.dart';
import 'package:diaryapp/views/widget/modals/new_entry/new_entry_vertical.dart';
import 'package:flutter/material.dart';

class NewEntry extends StatelessWidget {
  const NewEntry({super.key});

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (ctx, constraints) {
        final width = constraints.maxWidth;
        if (width > 600) {
          return const NewEntryHorizontal();
        } else {
          return const NewEntryVertical();
        }
      },
    );
  }
}
