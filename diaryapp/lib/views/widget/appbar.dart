import 'package:diaryapp/models/diary_model.dart';
import 'package:diaryapp/views/widget/buttons/get_button_style.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class DiaryAppBar extends StatelessWidget implements PreferredSizeWidget {
  const DiaryAppBar({super.key, required this.logout});

  final Function logout;

  @override
  Widget build(BuildContext context) {
    return Consumer<DiaryModel>(
      builder: (context, controller, child) => AppBar(
        title:
            Text(controller.name!, style: Theme.of(context).textTheme.displaySmall),
        actions: [
          IconButton(
            padding: const EdgeInsets.all(10),
            style: getButtonStyle(),
            icon: const Icon(Icons.logout),
            onPressed: () async {
              await logout();
            },
          ),
        ],
      ),
    );
  }
  
  @override
  Size get preferredSize => const Size.fromHeight(50);
}