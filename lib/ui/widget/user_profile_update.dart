import 'package:flutter/material.dart';
import 'package:mynewapp/ui/screens/update_profile_screen.dart';

class UserProfileUpdate extends StatelessWidget {
  const UserProfileUpdate({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return  ListTile(
      onTap: (){
        Navigator.push(context, MaterialPageRoute(builder: (context)=> UpdateProfileScreen()));
      },
      leading: const CircleAvatar(child: Icon(Icons.person)),
      contentPadding: const EdgeInsets.symmetric(horizontal: 16),
      tileColor: Colors.deepOrange,
      title: Text("Mehedi"),
      subtitle: Text("mehedi@gmail.com"),
      textColor: Colors.white,
    );
  }
}