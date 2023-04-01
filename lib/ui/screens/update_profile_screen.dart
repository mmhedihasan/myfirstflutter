import 'package:flutter/material.dart';
import 'package:mynewapp/ui/widget/app_button_widget.dart';
import 'package:mynewapp/ui/widget/app_text_field_widget.dart';
import 'package:mynewapp/ui/widget/screen_background_widget.dart';
import 'package:mynewapp/ui/widget/user_profile_update.dart';

import '../utils/textstyle.dart';

class UpdateProfileScreen extends StatefulWidget {
  const UpdateProfileScreen({Key? key}) : super(key: key);

  @override
  State<UpdateProfileScreen> createState() => _UpdateProfileScreenState();
}

class _UpdateProfileScreenState extends State<UpdateProfileScreen> {
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
                      const SizedBox(
                        height: 20,
                      ),
                      Text(
                        "Update Profile",
                        style: screenTitleTextStyle,
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      InkWell(
                        onTap: () {},
                        child: Row(
                          children: [
                            Container(
                              padding: const EdgeInsets.all(16),
                              decoration: BoxDecoration(
                                color: Colors.grey,
                                borderRadius: BorderRadius.only(
                                  topLeft: Radius.circular(8),
                                  bottomLeft: Radius.circular(8),
                                ),
                              ),
                              child: Text("Photo"),
                            ),
                            Expanded(
                              child: Container(
                                padding: const EdgeInsets.all(16),
                                decoration: BoxDecoration(
                                  color: Colors.white,
                                  borderRadius: BorderRadius.only(
                                    topRight: Radius.circular(8),
                                    bottomRight: Radius.circular(8),
                                  ),
                                ),
                                child: Text(""),
                              ),
                            )
                          ],
                        ),
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      AppTextFieldWidget(
                          hintText: "Email",
                          controller: TextEditingController()),
                      const SizedBox(
                        height: 8,
                      ),
                      AppTextFieldWidget(
                          hintText: "First Name",
                          controller: TextEditingController()),
                      const SizedBox(
                        height: 8,
                      ),
                      AppTextFieldWidget(
                          hintText: "Last Name",
                          controller: TextEditingController()),
                      const SizedBox(
                        height: 8,
                      ),
                      AppTextFieldWidget(
                          hintText: "Mobile",
                          controller: TextEditingController()),
                      const SizedBox(
                        height: 8,
                      ),
                      AppTextFieldWidget(
                          hintText: "Password",
                          obscureText: true,
                          controller: TextEditingController()),
                      const SizedBox(
                        height: 24,
                      ),
                      AppButtonWidget(
                          child: Icon(Icons.arrow_circle_right_outlined),
                          onTap: () {}),
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
