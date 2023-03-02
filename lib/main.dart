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
      title: 'To Do List',
      home: const ToDoList(),
    );
  }
}

class ToDoList extends StatefulWidget {
  const ToDoList({Key? key}) : super(key: key);

  @override
  State<ToDoList> createState() => _ToDoListState();
}

class _ToDoListState extends State<ToDoList> {
  List<String> todos = [];
  TextEditingController todoETController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('To DO List'),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          showModalBottomSheet(
              context: context,
              isDismissible: false,
              barrierColor: Colors.black87,
              backgroundColor: Colors.green,
              shape: const RoundedRectangleBorder(
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(20),
                  topRight: Radius.circular(20)
                )
              ),
              builder: (context) {
                return Column(
                  children: [
                    TextField(
                      controller: todoETController,
                    ),
                    ElevatedButton(onPressed: (){
                      todos.add(todoETController.text);
                      todoETController.clear();
                      setState(() {});
                      Navigator.pop(context);
                    }, child: Text('Add'))
                  ],
                );
              });
        },
        child: const Icon(Icons.add),
      ),
      body: ListView.builder(
          itemCount: todos.length,
          itemBuilder: (context, Index) {
            return ListTile(
              title: Text(todos[Index]),
            );
          }),
    );
  }
}
