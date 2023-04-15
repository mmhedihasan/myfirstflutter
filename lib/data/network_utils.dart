import 'dart:convert';
import 'dart:developer';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:mynewapp/data/auth_utils.dart';
import 'package:mynewapp/main.dart';
import 'package:mynewapp/ui/screens/login.dart';

class NetworkUtils {
  Future<dynamic> getMethod(String url, {VoidCallback? onUnAuthorize}) async {
    try {
      final http.Response response = await http.get(Uri.parse(url));
      log(response.body);
      if (response.statusCode == 200) {
        return jsonDecode(response.body);
      } else if (response.statusCode == 401) {
        if (onUnAuthorize != null) {
          moveToLogin();
        }
      } else {
        log("Something Went Wrong" );
      }
    } catch (e) {
      log('Error $e');
    }
  }

  Future<dynamic> postMethod(String url,
      {Map<String, String>? body,
      VoidCallback? onUnAuthorize,
      String? token}) async {
    try {
      final http.Response response = await http.post(Uri.parse(url),
          headers: {"Content-Type": "application/json", 'token': token ?? ''},
          body: jsonEncode(body));
      log(response.body);
      if (response.statusCode == 200) {
        return jsonDecode(response.body);
      } else if (response.statusCode == 401) {
        if (onUnAuthorize != null) {
          onUnAuthorize();
        } else {
          moveToLogin();
        }
      } else {
        log("Something Went Wrong ${response.statusCode}");
      }
    } catch (e) {
      log('Error $e');
    }
  }

  void moveToLogin() async{
    await AuthUtils.clearData();
    Navigator.pushAndRemoveUntil(
        AmazingTask.globalKey.currentContext!,
        MaterialPageRoute(builder: (context) => const LoginScreen()),
        (route) => false);
  }
}
