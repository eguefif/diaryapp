import 'package:diaryapp/models/diary_model.dart';
import 'package:diaryapp/utils/svg.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class SummaryView extends StatelessWidget {
  const SummaryView({super.key});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: LayoutBuilder(
        builder: (context, constraint) {
          final width = constraint.maxWidth;
          return (width < 600)
          ? const Column(
            children: [
              FeelingStatTitle(),
              FeelingStat(feeling: "smile"),
              FeelingStat(feeling: "anger"),
              FeelingStat(feeling: "neutral"),
              FeelingStat(feeling: "sad"),
            ],)
          : const Row(
                children: [
              FeelingStatTitle(),
                  FeelingStat(feeling: "smile"),
                  FeelingStat(feeling: "anger"),
                  FeelingStat(feeling: "neutral"),
                  FeelingStat(feeling: "sad"),
                ],
          );
        },
      ),
    );
  }
}

class FeelingStatTitle extends StatelessWidget {
  const FeelingStatTitle({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<DiaryModel>(builder: (context, controller, child) {
      final count = controller.entries.length;
      String entryText = "";
      if (count > 1) {
        entryText = "$count entries";
      } else if (count == 1) {
        entryText = "$count entry";
      }
      if (count == 1) {
        return Text(
          "Your stats for your entry",
          style: Theme.of(context).textTheme.headlineSmall,
        );
      }
      if (count > 1) {
        return Text(
          "Your stats for your $entryText",
          style: Theme.of(context).textTheme.headlineSmall,
        );
      }
      return Text(
        "You don't have any entry yet",
        style: Theme.of(context).textTheme.headlineSmall,
      );
    });
  }
}

class FeelingStat extends StatelessWidget {
  const FeelingStat({super.key, required this.feeling});

  final String feeling;

  @override
  Widget build(BuildContext context) {
    return Consumer<DiaryModel>(
      builder: (context, controller, child) {
        return Row(
          children: [
            getFeelingSvg(feeling),
            Text(
              controller.getFeelingStat(feeling),
            ),
          ],
        );
      },
    );
  }
}
