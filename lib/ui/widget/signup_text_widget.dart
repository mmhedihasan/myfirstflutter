import 'package:flutter/material.dart';

class SignupTextWidget extends StatelessWidget {
  const SignupTextWidget({
    super.key, required this.text, required this.child, required this.onTap,
  });
  final Widget text;
  final Widget child;
  final VoidCallback onTap;
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        text,
        TextButton(
            onPressed: onTap,
            child: child),
      ],
    );
  }
}


