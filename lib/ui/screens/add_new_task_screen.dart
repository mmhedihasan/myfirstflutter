import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:mynewapp/ui/widget/app_button_widget.dart';
import 'package:mynewapp/ui/widget/app_text_field_widget.dart';
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
                child: SingleChildScrollView(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Center(
                        child: LottieBuilder.network(
                          "https://assets10.lottiefiles.com/packages/lf20_zavtox71.json", height: 300,width: 200,),
                      ),

                      Text(
                        "Add New Task",
                        style: screenTitleTextStyle,
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      AppTextFieldWidget(
                          hintText: "Subject",
                          controller: TextEditingController()),
                      const SizedBox(
                        height: 8,
                      ),
                      AppTextFieldWidget(
                          hintText: "Description",
                          maxLines: 8,
                          controller: TextEditingController()),
                      const SizedBox(
                        height: 24,
                      ),
                      AppButtonWidget(child: Icon(Icons.arrow_circle_right_outlined) , onTap: (){}),
                    ],
                  ),
                ),
              ),
            ))
          ],
        ),
      ),
    );
  }
}
