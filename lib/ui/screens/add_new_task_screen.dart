import 'package:flutter/material.dart';
import 'package:mynewapp/data/auth_utils.dart';
import 'package:mynewapp/data/network_utils.dart';
import 'package:mynewapp/data/urls.dart';
import 'package:mynewapp/ui/utils/snackbar_message.dart';
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
  final TextEditingController subjectETController = TextEditingController();
  final TextEditingController descriptionETController = TextEditingController();
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  bool _inProgress = false;

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
                  child: Form(
                    key: _formKey,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        // Center(
                        //   child: LottieBuilder.network(
                        //     "https://assets10.lottiefiles.com/packages/lf20_zavtox71.json", height: 300,width: 200,),
                        // ),

                        Text(
                          "Add New Task",
                          style: screenTitleTextStyle,
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                        AppTextFieldWidget(
                          hintText: "Subject",
                          controller: subjectETController,
                          validator: (value) {
                            if (value?.isEmpty ?? true) {
                              return "Enter Your Subject";
                            }
                            return null;
                          },
                        ),

                        const SizedBox(
                          height: 8,
                        ),
                        AppTextFieldWidget(
                          hintText: "Description",
                          maxLines: 8,
                          controller: descriptionETController,
                          validator: (value) {
                            if (value?.isEmpty ?? true) {
                              return "Enter Your Description";
                            }
                            return null;
                          },
                        ),

                        const SizedBox(
                          height: 24,
                        ),
                        if(_inProgress)
                          const Center(
                            child: CircularProgressIndicator(
                              color: Colors.deepOrange,
                            ),
                          )else
                        AppButtonWidget(
                          child: const Icon(Icons.arrow_circle_right_outlined),
                          onTap: () async {
                            if (_formKey.currentState!.validate()) {
                              _inProgress = true;
                              setState(() {});
                              final result = await NetworkUtils()
                                  .postMethod(
                                  Urls.createTask,
                                  token: AuthUtils.token,
                                  body: {
                                "title": subjectETController.text.trim(),
                                "description": descriptionETController.text.trim(),
                                "status": "New"
                              });
                              _inProgress = false;
                              setState(() {

                              });
                              if (result != null &&
                                  result['status'] == 'success') {
                                  subjectETController.clear();
                                  descriptionETController.clear();
                                showSnackBarMessage(context, "New Task Added");
                              } else {
                                showSnackBarMessage(context,
                                    "New Task Added Faild! Try Again", true);
                              }
                            }
                          },
                        ),
                      ],
                    ),
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
