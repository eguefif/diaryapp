import 'package:diaryapp/utils/date.dart';
import 'package:diaryapp/utils/svg.dart';
import 'package:flutter/material.dart';

class EntryRow extends StatelessWidget {
  const EntryRow({
    super.key,
    required this.date,
    required this.title,
    required this.feeling,
  });
  final int date;
  final String feeling;
  final String title;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Text(getDate(date)),
            const SizedBox(width: 20),
            getFeelingSvg(feeling),
          ],
        ),
        const SizedBox(width: 25),
        Expanded(
          child: Text(title,
              style: Theme.of(context).textTheme.headlineLarge),
        ),
      ],
    );
  }
}
