import 'package:flutter/material.dart';
import 'package:mynewapp/ui/screens/splashscrenn.dart';

void main() {
  runApp(const amazingTask());
}
class amazingTask extends StatelessWidget {
  const amazingTask({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: SplashScrenn() ,
    );
  }
}

