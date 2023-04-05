import 'package:shared_preferences/shared_preferences.dart';


class AuthUtils {
  static String? firstName, lastName, token, profilePic, mobile, email;

  static Future<void> saveUserData(
      String uFirstName, String uLastName, String uToken, String uProfilePic, String uMobile, String uEmail) async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    await sharedPreferences.setString('firstName', uFirstName);
    await sharedPreferences.setString('lastName', uLastName);
    await sharedPreferences.setString('token', uToken);
    await sharedPreferences.setString('mobile', uMobile);
    await sharedPreferences.setString('photo', uProfilePic);
    await sharedPreferences.setString('email', uEmail);
    firstName = uFirstName;
    lastName = uLastName;
    token = uToken;
    mobile = uMobile;
    profilePic = uProfilePic;
    email = uEmail;
  }

  static Future<bool> checkLoginState() async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    String? token = sharedPreferences.getString('token');
    if (token == null) {
      return false;
    } else {
      return true;
    }
  }

  static Future<void> getAuthData() async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    token = sharedPreferences.getString('token');
    firstName = sharedPreferences.getString('firstName');
    lastName = sharedPreferences.getString('lastName');
    mobile = sharedPreferences.getString('mobile');
    profilePic = sharedPreferences.getString('photo');
    email = sharedPreferences.getString('email');
  }
  static Future<void> clearData() async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    await sharedPreferences.clear();
  }
}
