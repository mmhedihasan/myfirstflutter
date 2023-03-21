import 'package:flutter/material.dart';

class AppTextFieldWidget extends StatelessWidget {
  const AppTextFieldWidget({
    super.key,
    required this.hintText,
    required this.controller,
    this.obscureText,
  });
  final String hintText;
  final TextEditingController controller;
  final bool? obscureText;
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      obscureText: obscureText ?? false,
      controller: controller,
      decoration: InputDecoration(
          fillColor: Colors.white,
          hintText: hintText,
          filled: true,
          border: OutlineInputBorder(borderSide: BorderSide.none)),
    );
  }
}