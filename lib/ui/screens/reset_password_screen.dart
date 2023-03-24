import 'package:flutter/material.dart';
import 'package:mynewapp/ui/screens/login.dart';
import 'package:mynewapp/ui/widget/app_text_field_widget.dart';

import '../utils/textstyle.dart';
import '../widget/app_button_widget.dart';
import '../widget/screen_background_widget.dart';
import '../widget/signup_text_widget.dart';

class ResetPasswordScreen extends StatefulWidget {
  const ResetPasswordScreen({Key? key}) : super(key: key);

  @override
  State<ResetPasswordScreen> createState() => _ResetPasswordScreenState();
}

class _ResetPasswordScreenState extends State<ResetPasswordScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ScreenBackground(
          widget: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(24.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Set Password',
                style: screenTitleTextStyle,
              ),
              const SizedBox(
                height: 8,
              ),
              Text(
                "A 6 Digit Verification Pin will sent to your email Address",
                style: screenSubTitleTextStyle,
              ),
              const SizedBox(
                height: 24,
              ),
              const SizedBox(
                height: 24,
              ),
              AppTextFieldWidget(
                  obscureText: true,
                  hintText: 'Password', controller: TextEditingController()),
              const SizedBox(
                height: 24,
              ),
              AppTextFieldWidget(
                  obscureText: true,
                  hintText: 'Confirm Password',
                  controller: TextEditingController()),
              const SizedBox(
                height: 24,
              ),
              AppButtonWidget(
                  child: const Text("Confirm"),
                  onTap: () {
                    Navigator.pushAndRemoveUntil(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const LoginScreen()),
                        (route) => false);
                  }),
              const SizedBox(
                height: 24,
              ),
              SignupTextWidget(
                  text: const Text("Have Account?"),
                  child: const Text("Sign In"),
                  onTap: () {
                    Navigator.pushAndRemoveUntil(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const LoginScreen()),
                        (route) => false);
                  }),
            ],
          ),
        ),
      )),
    );
  }
}
