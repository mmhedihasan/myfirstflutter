import 'package:flutter/material.dart';
import 'package:mynewapp/ui/widget/screen_background_widget.dart';

import '../utils/textstyle.dart';
import '../widget/app_button_widget.dart';
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
                const SizedBox(height: 24),
                AppTextFieldWidget(
                  controller: TextEditingController(),
                  hintText: "Email",
                ),
                const SizedBox(height: 24),
                AppTextFieldWidget(
                    obscureText: true,
                    hintText: "Password",
                    controller: TextEditingController()),
                const SizedBox(height: 24),
                AppButtonWidget(
                  child: const Icon(Icons.arrow_circle_right_outlined),
                  onTap: () {},
                ),
                const SizedBox(height: 24),
                TextButton(
                    onPressed: () {},
                    child: const Text(
                      "Forgot Password?",
                      style: TextStyle(color: Colors.grey),
                    )),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Text("Don't Have an Account?"),
                    TextButton(onPressed: (){}, child: const Text("Sign Up", style: TextStyle(color: Colors.deepOrange),)),
                  ],
                )
              ],
            )
          ],
        ),
      )),
    );
  }
}
