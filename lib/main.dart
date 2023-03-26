import 'package:flutter/material.dart';
import 'package:mynewapp/ui/screens/login.dart';
import 'package:mynewapp/ui/screens/main_bottom_navbar_item.dart';



void main() {
  runApp(const AmazingTask());
}
class AmazingTask extends StatelessWidget {
  const AmazingTask({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: LoginScreen() ,
    );
  }
}

