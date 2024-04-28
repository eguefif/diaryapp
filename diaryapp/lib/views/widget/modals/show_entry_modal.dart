import 'package:diaryapp/models/diary_model.dart';
import 'package:diaryapp/utils/date.dart';
import 'package:diaryapp/utils/svg.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

void showEntryModal(Entry entry, context) {
  showModalBottomSheet<void>(
    context: context,
    builder: (context) => Padding(
      padding: const EdgeInsets.all(15.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(entry.title,
                  style: Theme.of(context).textTheme.headlineMedium),
              Text(getDate(entry.date),
                  style: Theme.of(context).textTheme.headlineSmall),
              IconButton(
                icon: const Icon(Icons.close),
                onPressed: () => Navigator.pop(context),
              ),
            ],
          ),
          Center(child: getFeelingSvg(entry.feeling)),
          Expanded(
            flex: 1,
            child: SingleChildScrollView(
              scrollDirection: Axis.vertical,
              child: SizedBox(
                width: double.infinity,
                child: Text(entry.content),
              ),
            ),
          ),
        ],
      ),
    ),
  );
}
