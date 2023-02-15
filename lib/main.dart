import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Appbar Branch',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
        home: AppBar(),
    );
  }
}
class Appbar extends StatelessWidget {
  const Appbar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Appbar'),
      ),
    );
  }
}




