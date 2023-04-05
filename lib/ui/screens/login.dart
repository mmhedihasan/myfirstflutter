import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:mynewapp/data/auth_utils.dart';
import 'package:mynewapp/data/network_utils.dart';
import 'package:mynewapp/data/urls.dart';
import 'package:mynewapp/ui/screens/main_bottom_navbar_item.dart';
import 'package:mynewapp/ui/screens/signup_screen.dart';
import 'package:mynewapp/ui/utils/snackbar_message.dart';
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
  final TextEditingController _emailETController = TextEditingController();
  final TextEditingController _passwordETController = TextEditingController();
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  bool _inProgress = false;

  // Future<void> login() async {
  //
  // }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GestureDetector(
        onTap: () {
          FocusScope.of(context).unfocus();
        },
        child: ScreenBackground(
            widget: Padding(
              padding: const EdgeInsets.all(24),
              child: Form(
                key: _formKey,
                child: SingleChildScrollView(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      // Center(
                      //   child: LottieBuilder.network(
                      //     "https://assets8.lottiefiles.com/packages/lf20_mjlh3hcy.json",
                      //     height: 300,
                      //     width: 200,
                      //   ),
                      // ),
                      Text("Get Started With", style: screenTitleTextStyle),
                      const SizedBox(height: 24),
                      AppTextFieldWidget(
                          controller: _emailETController,
                          hintText: "Email",
                          validator: (value) {
                            if (value?.isEmpty ?? true) {
                              return "Enter Your Valid Email";
                            }
                            return null;
                          }),
                      const SizedBox(height: 24),
                      AppTextFieldWidget(
                          obscureText: true,
                          hintText: "Password",
                          controller: _passwordETController,
                          validator: (value) {
                            if ((value?.isEmpty ?? true)) {
                              return "Enter Your valid Password ";
                            }
                            return null;
                          }),
                      const SizedBox(height: 24),
                      if (_inProgress)
                        const Center(
                          child: CircularProgressIndicator(),
                        ) else
                        AppButtonWidget(
                          child: const Icon(Icons.arrow_circle_right_outlined),
                          onTap: () async {
                            if (_formKey.currentState!.validate()) {
                              _inProgress = true;
                              setState(() {

                              });
                              final result =
                              await NetworkUtils().postMethod(Urls.loginUrl, body: {
                                "email": _emailETController.text.trim(),
                                "password": _passwordETController.text,
                              }, onUnAuthorize: () {
                                showSnackBarMessage(context, "Invalid Email or Password", true);
                              }
                              );
                              _inProgress = false;
                              setState(() {

                              });
                              if (result != null && result['status'] == 'success') {
                                await AuthUtils.saveUserData(
                                    result['data']['firstName'], result['data']['lastName'],
                                    result['token'], result['data']['picture'], result['data']['mobile'], result['data']['email']);
                                Navigator.pushAndRemoveUntil(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) => const MainBottomNavbar()),
                                        (route) => false);
                              }
                            }
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
                                        builder: (context) =>
                                        const EmailVerification()));
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
                ),
              ),
            )),
      ),
    );
  }
}
