import 'package:flutter/material.dart';

class CardWidgetItem extends StatelessWidget {
  const CardWidgetItem({
    super.key,
    required this.textOfScreen,
    required this.typeOfScreen,
  });

  final int textOfScreen;
  final String typeOfScreen;

  @override
  Widget build(BuildContext context) {
    return Card(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            children: [
              Text(
                textOfScreen.toString(),
                style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
              ),
              SizedBox(
                height: 8,
              ),
              FittedBox(child: Text(typeOfScreen)),
            ],
          ),
        ));
  }
}