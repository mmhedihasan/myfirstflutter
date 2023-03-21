import 'dart:html';

import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:mynewapp/ui/widget/screen_background_widget.dart';

import '../utils/textstyle.dart';
import '../widget/app_text_field_widget.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ScreenBackground(
          widget: Padding(
        padding: const EdgeInsets.all(10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Column(
              children: [
                Text("Get Started With", style: ScreenTitleTextStyle),
                SizedBox(height: 24),
                AppTextFieldWidget(
                  controller: TextEditingController(),
                  hintText: "Email",
                ),
                SizedBox(height: 24),
                AppTextFieldWidget(
                    obscureText: true,
                    hintText: "Password",
                    controller: TextEditingController()),
                SizedBox(height: 24),
                SizedBox(
                    width: double.infinity,
                    child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.deepOrange,
                            padding: const EdgeInsets.all(12)),
                        onPressed: () {},
                        child: Icon(Icons.arrow_circle_right_outlined))),
              ],
            )
          ],
        ),
      )),
    );
  }
}
