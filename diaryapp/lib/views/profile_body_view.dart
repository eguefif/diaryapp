import 'package:diaryapp/views/widget/entries_view/entries.dart';
import 'package:diaryapp/views/widget/summary_view.dart';
import 'package:flutter/material.dart';

class ProfileBodyView extends StatelessWidget {
  const ProfileBodyView({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          const Divider(
              height: 25,
              thickness: 5,
              color: Colors.black,
              indent: 25,
              endIndent: 25),
          Text("Your last two entries", style: Theme.of(context).textTheme.headlineMedium),
          const SizedBox(
            height: 150,
            child: Entries(forProfile: true),
          ),
          const SummaryView(),
        ],
      ),
    );
  }
}
