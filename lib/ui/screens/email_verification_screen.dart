import 'package:flutter/material.dart';
import 'package:mynewapp/ui/widget/app_button_widget.dart';
import 'package:mynewapp/ui/widget/app_text_field_widget.dart';
import 'package:mynewapp/ui/widget/screen_background_widget.dart';
import 'package:mynewapp/ui/widget/signup_text_widget.dart';

import '../utils/textstyle.dart';

class EmailVerification extends StatefulWidget {
  const EmailVerification({Key? key}) : super(key: key);

  @override
  State<EmailVerification> createState() => _EmailVerificationState();
}

class _EmailVerificationState extends State<EmailVerification> {
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
                    'Your Email Address',
                    style: screenTitleTextStyle,
                  ),
                  SizedBox(height: 8,),
                  Text("A 6 Digit Verification Pin will sent to your email Address", style: TextStyle(
                    color: Colors.grey
                  ),),
                  SizedBox(height: 24,),
                  AppTextFieldWidget(hintText: "Email", controller: TextEditingController()),
                  SizedBox(height: 24,),
                  AppButtonWidget(child: Icon(Icons.arrow_circle_right_outlined), onTap: (){}),
                  SizedBox(height: 24,),
                  SignupTextWidget(text: Text("Have Account?"), child: Text("sign In"), onTap: (){
                    Navigator.pop(context);
                  }),
                ],
              ),
            ),
          )),
    );
  }
}
