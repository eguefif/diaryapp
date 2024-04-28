import 'package:diaryapp/models/diary_model.dart';
import 'package:diaryapp/utils/svg.dart';
import 'package:flutter/material.dart';

class FeelingSelection extends StatelessWidget {
  const FeelingSelection({
    super.key,
    required this.feelingController,
  });

  final TextEditingController feelingController;

  @override
  Widget build(BuildContext context) {
    return DropdownMenu<Feeling>(
      initialSelection: Feeling.neutral,
      leadingIcon: const Icon(Icons.search),
      inputDecorationTheme: const InputDecorationTheme(
        border: OutlineInputBorder(),
        contentPadding: EdgeInsets.all(5),
      ),
      controller: feelingController,
      requestFocusOnTap: true,
      label: const Text("Feeling"),
      dropdownMenuEntries: Feeling.values
          .map<DropdownMenuEntry<Feeling>>(
            (Feeling feeling) => DropdownMenuEntry<Feeling>(
              value: feeling,
              label: feeling.description,
              leadingIcon: getFeelingSvg(feeling.description),
            ),
          )
          .toList(),
    );
  }
}
