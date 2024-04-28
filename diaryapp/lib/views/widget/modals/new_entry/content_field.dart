import 'package:flutter/material.dart';

class ContentField extends StatelessWidget {
  const ContentField({
    super.key,
    required this.contentController,
  });

  final TextEditingController contentController;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Container(
        width: double.infinity,
        decoration: BoxDecoration(
          border: Border.all(width: 1),
        ),
        child: Padding(
          padding: const EdgeInsets.all(8),
          child: TextField(
            controller: contentController,
            minLines: 1,
            maxLines: 10,
            keyboardType: TextInputType.multiline,
            decoration: const InputDecoration.collapsed(
              hintText: "What's in your mind ?",
              border: InputBorder.none,
            ),
          ),
        ),
      ),
    );
  }
}
