import 'package:flutter/material.dart';
import 'package:mynewapp/ui/screens/login.dart';
import 'package:mynewapp/ui/screens/reset_password_screen.dart';
import 'package:pin_code_fields/pin_code_fields.dart';

import '../utils/textstyle.dart';
import '../widget/app_button_widget.dart';
import '../widget/screen_background_widget.dart';
import '../widget/signup_text_widget.dart';

class OtpVerificationScreen extends StatefulWidget {
  const OtpVerificationScreen({Key? key}) : super(key: key);

  @override
  State<OtpVerificationScreen> createState() => _OtpVerificationScreenState();
}

class _OtpVerificationScreenState extends State<OtpVerificationScreen> {
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
                'OTP Verification',
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
              PinCodeTextField(
                length: 6,
                obscureText: false,
                animationType: AnimationType.fade,
                pinTheme: PinTheme(
                  shape: PinCodeFieldShape.box,
                  borderRadius: BorderRadius.circular(5),
                  fieldHeight: 50,
                  fieldWidth: 40,
                  activeFillColor: Colors.white,
                  inactiveFillColor: Colors.deepOrange,
                  selectedFillColor: Colors.white,
                  selectedColor: Colors.deepOrange,
                  activeColor: Colors.deepOrange,
                ),
                animationDuration: Duration(milliseconds: 300),
                backgroundColor: Colors.transparent,
                enableActiveFill: true,
                onCompleted: (v) {
                  print("Completed");
                },
                onChanged: (value) {
                  print(value);
                  setState(() {
                  
                  });
                },
                beforeTextPaste: (text) {
                  print("Allowing to paste $text");
                  //if you return true then it will show the paste confirmation dialog. Otherwise if false, then nothing will happen.
                  //but you can show anything you want here, like your pop up saying wrong paste format or etc
                  return true;
                }, appContext: context,
              ),
              const SizedBox(
                height: 24,
              ),
              AppButtonWidget(child: const Text("Verify"), onTap: () {
                Navigator.push(context, MaterialPageRoute(builder: (context)=>ResetPasswordScreen()));
              }),
              const SizedBox(
                height: 24,
              ),
              SignupTextWidget(
                  text: const Text("Have Account?"),
                  child: const Text("Sign In"),
                  onTap: () {
                    Navigator.pushAndRemoveUntil(context, MaterialPageRoute(builder: (context)=> const LoginScreen()), (route) => false);
                  }),
            ],
          ),
        ),
      )),
    );
  }
}
