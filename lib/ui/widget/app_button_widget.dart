import 'package:flutter/material.dart';

class AppButtonWidget extends StatelessWidget {
  const AppButtonWidget({
    super.key, required this.child, required this.onTap,
  });
  final Widget child;
  final VoidCallback onTap;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
        width: double.infinity,
        child: ElevatedButton(
            style: ElevatedButton.styleFrom(
                backgroundColor: Colors.deepOrange,
                padding: const EdgeInsets.all(12)),
            onPressed: onTap,
            child: child));
  }
}