import 'package:flutter/material.dart';
import 'package:mynewapp/ui/screens/cancel_task_item.dart';
import 'package:mynewapp/ui/screens/complete_task_item.dart';
import 'package:mynewapp/ui/screens/inprogress_task_item.dart';
import 'package:mynewapp/ui/screens/new_item.dart';
import 'package:mynewapp/ui/widget/screen_background_widget.dart';

import '../widget/user_profile_update.dart';

class MainBottomNavbar extends StatefulWidget {
  const MainBottomNavbar({Key? key}) : super(key: key);

  @override
  State<MainBottomNavbar> createState() => _MainBottomNavbarState();
}

class _MainBottomNavbarState extends State<MainBottomNavbar> {
  int _selectedScreen=0;
  final List<Widget>screens=const[
    NewTaskItem(),
    CompleteTaskItem(),
    CancelTaskItem(),
    InProgressTaskItem(),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body:Column(
          children: [
              const UserProfileUpdate(),
            Expanded(child: screens[_selectedScreen])
          ],
      ),
        bottomNavigationBar: BottomNavigationBar(
          backgroundColor: Colors.white,
          selectedItemColor: Colors.black87,
          unselectedItemColor: Colors.deepOrange,
          showUnselectedLabels: true,
          currentIndex: _selectedScreen,
          onTap: (index){
            setState(() {
              _selectedScreen=index;
            });
          },
          items: const [
            BottomNavigationBarItem(icon: Icon(Icons.new_label_outlined), label: "New"),
            BottomNavigationBarItem(icon: Icon(Icons.done), label: "Complete"),
            BottomNavigationBarItem(icon: Icon(Icons.close), label: "Cancel"),
            BottomNavigationBarItem(icon: Icon(Icons.ac_unit), label: "IN Progress"),

          ],
        ),
    );
  }
}


