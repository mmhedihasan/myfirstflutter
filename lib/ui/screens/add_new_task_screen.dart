import 'package:flutter/material.dart';
import 'package:mynewapp/ui/widget/screen_background_widget.dart';
import 'package:mynewapp/ui/widget/user_profile_update.dart';

import '../utils/textstyle.dart';

class AddNewTask extends StatefulWidget {
  const AddNewTask({Key? key}) : super(key: key);

  @override
  State<AddNewTask> createState() => _AddNewTaskState();
}

class _AddNewTaskState extends State<AddNewTask> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            const UserProfileUpdate(),
            Expanded(
                child: ScreenBackground(
              widget: Padding(
                padding: const EdgeInsets.all(24.0),
                child: Column(
                  children: [
                    const SizedBox(
                      height: 20,
                    ),
                    Text(
                      "Add New Task",
                      style: screenTitleTextStyle,
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                  ],
                ),
              ),
            ))
          ],
        ),
      ),
    );
  }
}
