import 'dart:io';
import 'package:flutter/material.dart';
import 'package:mynewapp/ui/screens/splashscrenn.dart';


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
class AmazingTask extends StatefulWidget {
   const AmazingTask({Key? key}) : super(key: key);

  static GlobalKey<NavigatorState> globalKey = GlobalKey<NavigatorState>();

  @override
  State<AmazingTask> createState() => _AmazingTaskState();
}

class _AmazingTaskState extends State<AmazingTask> {
  @override
  Widget build(BuildContext context) {
    return  MaterialApp(
      debugShowCheckedModeBanner: false,
      navigatorKey: AmazingTask.globalKey,
      home: const SplashScrenn(),
    );
  }
}

