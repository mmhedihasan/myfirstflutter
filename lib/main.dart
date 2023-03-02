import 'package:flutter/material.dart';

void main(){
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: CounterScreen(),
    );
  }
}
class CounterScreen extends StatefulWidget {
  const CounterScreen({Key? key}) : super(key: key);
  @override
  State<CounterScreen> createState() => _CounterScreenState();
}

class _CounterScreenState extends State<CounterScreen> {
  int count=0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('CounterApp'),
      ),
      drawer: Drawer(),
      floatingActionButton: Row(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          FloatingActionButton(
            onPressed: (){
              count++;
              setState(() {});
            },child: Icon(Icons.add),
          ),
          FloatingActionButton(
            onPressed: (){
              count--;
              setState(() {});
            },child: Icon(Icons.minimize),
          ),
        ],
      ),
      body: Center(
        child: Text(count.toString(), style: TextStyle(fontSize: 40, fontWeight: FontWeight.bold),),
      ),
      bottomNavigationBar: BottomNavigationBar(
       currentIndex: 1,
       items: [
         BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
         BottomNavigationBarItem(icon: Icon(Icons.contact_mail), label: 'Contac'),
         BottomNavigationBarItem(icon: Icon(Icons.person), label: 'Profile'),

       ],
      ),
    );
  }
}
