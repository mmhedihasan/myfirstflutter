import 'package:flutter/material.dart';

class AppTextFieldWidget extends StatelessWidget {
  const AppTextFieldWidget({
    super.key,
    required this.hintText,
    required this.controller,
    this.obscureText,
    this.maxLines, this.validator,
  });

  final String hintText;
  final TextEditingController controller;
  final bool? obscureText;
  final int? maxLines;
  final Function(String?)? validator;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      obscureText: obscureText ?? false,
      controller: controller,
      maxLines: maxLines ?? 1,
      validator: (value){
        if(validator != null){
          return validator!(value);
        }else{
          return null;
        }
      },
      decoration: InputDecoration(
          fillColor: Colors.white,
          hintText: hintText,
          filled: true,
          border: OutlineInputBorder(borderSide: BorderSide.none)),
    );
  }
}
