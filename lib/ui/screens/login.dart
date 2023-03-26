import 'package:flutter/material.dart';
import 'package:mynewapp/ui/screens/main_bottom_navbar_item.dart';
import 'package:mynewapp/ui/screens/signup_screen.dart';
import 'package:mynewapp/ui/widget/screen_background_widget.dart';
import '../utils/textstyle.dart';
import '../widget/app_button_widget.dart';
import '../widget/app_text_field_widget.dart';
import '../widget/signup_text_widget.dart';
import 'email_verification_screen.dart';

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
        padding: const EdgeInsets.all(24),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text("Get Started With", style: screenTitleTextStyle),
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
              onTap: () {
                Navigator.pushAndRemoveUntil(
                    context,
                    MaterialPageRoute(builder: (context) => const MainBottomNavbar()),
                    (route) => false);
              },
            ),
            const SizedBox(height: 24),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                TextButton(
                    onPressed: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const EmailVerification()));
                    },
                    child: const Text(
                      "Forgot Password?",
                      style: TextStyle(color: Colors.grey),
                    )),
              ],
            ),
            SignupTextWidget(
              text: const Text("Don't Have an Account?"),
              child: const Text(
                'SignUp',
                style: TextStyle(
                  color: Colors.deepOrange,
                ),
              ),
              onTap: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const SignUpScreen()));
              },
            )
          ],
        ),
      )),
    );
  }
}
