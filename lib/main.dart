import 'dart:io';
import 'package:flutter/material.dart';
import 'package:mynewapp/ui/screens/add_new_task_screen.dart';
import 'package:mynewapp/ui/screens/login.dart';
import 'package:mynewapp/ui/screens/main_bottom_navbar_item.dart';
import 'package:mynewapp/ui/screens/new_item.dart';
import 'package:mynewapp/ui/screens/splashscrenn.dart';
import 'package:mynewapp/ui/screens/update_profile_screen.dart';

class MyHttpOverrides extends HttpOverrides{
  @override
  HttpClient createHttpClient(SecurityContext? context){
    return super.createHttpClient(context)
      ..badCertificateCallback = (X509Certificate cert, String host, int port)=> true;
  }
}


void main() {
  HttpOverrides.global = MyHttpOverrides();
  runApp(const AmazingTask());
}
class AmazingTask extends StatelessWidget {
  const AmazingTask({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: SplashScrenn(),
    );
  }
}

