import 'package:flutter/material.dart';
import 'package:mynewapp/data/auth_utils.dart';
import 'package:mynewapp/ui/screens/login.dart';
import 'package:mynewapp/ui/screens/update_profile_screen.dart';


class UserProfileUpdate extends StatelessWidget {
  const UserProfileUpdate({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return ListTile(
        onTap: () {
          Navigator.push(context,
              MaterialPageRoute(builder: (context) => UpdateProfileScreen()));
        },
        leading: const CircleAvatar(child: Icon(Icons.person)),
        contentPadding: const EdgeInsets.symmetric(horizontal: 16),
        tileColor: Colors.deepOrange,
        title: Text("${AuthUtils.firstName ?? ""} ${AuthUtils.lastName ?? ""}"),
        subtitle: Text(AuthUtils.email ?? "Unknown"),
        textColor: Colors.white,
        trailing: IconButton(
            onPressed: () async {
              await AuthUtils.clearData();
              Navigator.pushAndRemoveUntil(context, MaterialPageRoute(builder: (
                  context) => LoginScreen()), (route) => false);
            },
            icon: Icon(
              Icons.logout,
              color: Colors.white,
            )));
  }
}
