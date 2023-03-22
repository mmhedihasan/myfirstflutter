import 'package:flutter/material.dart';
import 'package:mynewapp/ui/screens/login.dart';
import 'package:mynewapp/ui/widget/app_button_widget.dart';
import 'package:mynewapp/ui/widget/app_text_field_widget.dart';
import 'package:mynewapp/ui/widget/screen_background_widget.dart';


import '../utils/textstyle.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({Key? key}) : super(key: key);

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
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
                "SignUP With US",
                style: screenTitleTextStyle,
              ),
              const SizedBox(
                height: 16,
              ),
              AppTextFieldWidget(
                  hintText: 'Email', controller: TextEditingController()),
              const SizedBox(
                height: 16,
              ),
              AppTextFieldWidget(
                  hintText: 'First Name', controller: TextEditingController()),
              const SizedBox(
                height: 16,
              ),
              AppTextFieldWidget(
                  hintText: 'Last Name', controller: TextEditingController()),
              const SizedBox(
                height: 16,
              ),
              AppTextFieldWidget(
                  hintText: 'Mobile', controller: TextEditingController()),
              const SizedBox(
                height: 16,
              ),
              AppTextFieldWidget(
                  hintText: 'Password', controller: TextEditingController()),
              const SizedBox(
                height: 16,
              ),
              AppButtonWidget(
                  child: const Icon(Icons.arrow_circle_right_outlined), onTap: () {}),
              const SizedBox(
                height: 24,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text("Have Account?"),
                  TextButton(
                      onPressed: (){
                        Navigator.push(context, MaterialPageRoute(builder: (context)=> const LoginScreen()));
                      },
                      child: const Text('Sign In'))
                ],
              )

            ],
          ),
        ),
      )),
    );
  }
}
