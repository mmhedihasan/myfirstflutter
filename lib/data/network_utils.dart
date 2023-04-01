import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:http/http.dart' as http;

class NetworkUtils {
  Future<dynamic> getMethod(String url) async {
    try {
      final http.Response response = await http.get(Uri.parse(url));
      if (response.statusCode == 200) {
        return jsonDecode(response.body);
      } else if (response.statusCode == 401) {
        print("Unauthorized Login");
      } else {
        print("Something Went Wrong");
      }
    } catch (e) {
      print(e);
    }
  }

  Future<dynamic> postMethod(String url, {Map<String, String>? body, VoidCallback? onUnAuthorize}) async {
    try {
      final http.Response response = await http.post(
        Uri.parse(url),
        headers: {"Content-Type": "application/json"},
        body: jsonEncode(body));
      if (response.statusCode == 200) {
        return jsonDecode(response.body);
      } else if (response.statusCode == 401) {
        if(onUnAuthorize != null){
          onUnAuthorize();
        }
      } else {
        print("Something Went Wrong ${response.statusCode}");
      }
    } catch (e) {
      print(e);
    }
  }
}
