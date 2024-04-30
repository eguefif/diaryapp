import 'package:diaryapp/views/widget/buttons/get_button_style.dart';
import 'package:diaryapp/views/widget/modals/show_add_entry_modal.dart';
import 'package:flutter/material.dart';

class AddEntryButton extends StatelessWidget {
  const AddEntryButton({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return IconButton(
      padding: const EdgeInsets.all(10),
      iconSize: 55,
      style: getButtonStyle(),
      icon: const Icon(Icons.add),
      onPressed: () {
        openAddEntryModal(context);
      },
    );
  }
}
