import 'package:flutter/material.dart';

class UserProfileUpdate extends StatelessWidget {
  const UserProfileUpdate({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return const ListTile(
      leading: CircleAvatar(child: Icon(Icons.person)),
      contentPadding: EdgeInsets.symmetric(horizontal: 16),
      tileColor: Colors.deepOrange,
      title: Text("Mehedi"),
      subtitle: Text("mehedi@gmail.com"),
      textColor: Colors.white,
    );
  }
}