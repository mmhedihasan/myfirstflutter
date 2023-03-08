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
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int currentSelectedScreenIndex= 0;
  List<Widget> widgets =[
    Text('Dashboard'),
    Text('Product'),
    Text('Profile'),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Bottom Navifation Bar'),
        actions: [
          IconButton(onPressed: () async{
            final selectedTime= await showTimePicker(context: context, initialTime: TimeOfDay.now());
          }, icon: Icon(Icons.lock_clock))
        ],
      ),
      body: Center(
        child: widgets[currentSelectedScreenIndex],
      ),
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: Colors.blueGrey,
        selectedItemColor: Colors.black87,
        unselectedItemColor: Colors.black38,
        onTap: (value){
          currentSelectedScreenIndex = value;
          setState(() {});
        },
        currentIndex: currentSelectedScreenIndex,
        items: const[
          BottomNavigationBarItem(icon: Icon(Icons.dashboard), label: 'Dashboard'),
          BottomNavigationBarItem(icon: Icon(Icons.list), label: 'Product'),
          BottomNavigationBarItem(icon: Icon(Icons.person), label: 'Profile'),
        ],
      ),
    );
  }
}

