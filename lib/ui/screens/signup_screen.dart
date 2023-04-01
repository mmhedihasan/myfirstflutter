import 'package:flutter/material.dart';
import 'package:mynewapp/data/network_utils.dart';
import 'package:mynewapp/data/urls.dart';
import 'package:mynewapp/ui/screens/login.dart';
import 'package:mynewapp/ui/utils/snackbar_message.dart';
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
  final TextEditingController emailTextETController = TextEditingController();
  final TextEditingController firstNameTextETController =
      TextEditingController();
  final TextEditingController lastNameTextETController =
      TextEditingController();
  final TextEditingController mobileTextETController = TextEditingController();
  final TextEditingController passwordTextETController =
      TextEditingController();

  final GlobalKey<FormState> _fromKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ScreenBackground(
          widget: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(24.0),
          child: Form(
            key: _fromKey,
            child: SingleChildScrollView(
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
                      hintText: 'Email',
                      controller: emailTextETController,
                      validator: (value) {
                        if (value?.isEmpty ?? true) {
                          return "Enter Your Email";
                        }
                        return null;
                      }),
                  const SizedBox(
                    height: 16,
                  ),
                  AppTextFieldWidget(
                      hintText: 'First Name',
                      controller: firstNameTextETController,
                      validator: (value) {
                        if (value?.isEmpty ?? true) {
                          return "Enter Your First Name";
                        }
                        return null;
                      }),
                  const SizedBox(
                    height: 16,
                  ),
                  AppTextFieldWidget(
                      hintText: 'Last Name',
                      controller: lastNameTextETController,
                      validator: (value) {
                        if (value?.isEmpty ?? true) {
                          return "Enter Your LastName";
                        }
                        return null;
                      }),
                  const SizedBox(
                    height: 16,
                  ),
                  AppTextFieldWidget(
                      hintText: 'Mobile',
                      controller: mobileTextETController,
                      validator: (value) {
                        if (value?.isEmpty ?? true) {
                          return "Enter Your Mobile";
                        }
                        return null;
                      }),
                  const SizedBox(
                    height: 16,
                  ),
                  AppTextFieldWidget(
                      hintText: 'Password',
                      controller: passwordTextETController,
                      validator: (value) {
                        if ((value?.isEmpty ?? true) &&
                            ((value?.length ?? 0) < 6)) {
                          return "Enter Your Password or minimum 6 latter";
                        }
                        return null;
                      }),
                  const SizedBox(
                    height: 16,
                  ),
                  AppButtonWidget(
                      child: const Icon(Icons.arrow_circle_right_outlined),
                      onTap: () async {
                        if (_fromKey.currentState!.validate()) {
                          final result = await NetworkUtils()
                              .postMethod(Urls.regUrl, body: {
                            "email": emailTextETController.text.trim(),
                            "mobile": mobileTextETController.text.trim(),
                            "password": passwordTextETController.text,
                            "firstName": firstNameTextETController.text.trim(),
                            "lastName": lastNameTextETController.text.trim(),
                          });
                          if (result != null && result['status'] == 'success') {
                            emailTextETController.clear();
                            mobileTextETController.clear();
                            firstNameTextETController.clear();
                            lastNameTextETController.clear();
                            passwordTextETController.clear();

                            showSnackBarMessage(
                                context, "Registration Success");
                          } else {
                            showSnackBarMessage(context,
                                "Registration Faild ! Try Again", true);
                          }
                        }
                      }),
                  const SizedBox(
                    height: 24,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Text("Have Account?"),
                      TextButton(
                          onPressed: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => const LoginScreen()));
                          },
                          child: const Text('Sign In'))
                    ],
                  )
                ],
              ),
            ),
          ),
        ),
      )),
    );
  }
}
