import 'package:diaryapp/models/diary_model.dart';
import 'package:flutter/material.dart';

class SubmitButton extends StatelessWidget {
  const SubmitButton({
    super.key,
    required this.controller,
    required this.titleController,
    required this.contentController,
    required this.feelingController,
  });

  final DiaryModel controller;
  final TextEditingController titleController;
  final TextEditingController contentController;
  final TextEditingController feelingController;

  bool _checkEntry(Entry entry) {
    if (entry.title.isEmpty || entry.content.isEmpty) {
      return false;
    }
    return true;
  }

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: () {
        Entry entry = Entry(
          title: titleController.text,
          content: contentController.text,
          date: DateTime.now().millisecondsSinceEpoch,
          feeling: feelingController.text,
        );
        if (_checkEntry(entry)) {
          controller.addEntry(entry);
          Navigator.pop(context);
        } else {
          showDialog(
            context: context,
            builder: (ctx) => AlertDialog.adaptive(
              title: const Text("Invalid input"),
              content: const Text(
                  "Make sure you wrote something for title and content"),
              actions: [
                TextButton(
                  onPressed: () {
                    Navigator.pop(ctx);
                  },
                  child: const Text("Okey"),
                ),
              ],
            ),
          );
        }
      },
      child: const Text("Add entry"),
    );
  }
}
