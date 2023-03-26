import 'package:flutter/material.dart';
import 'package:mynewapp/ui/screens/new_item.dart';

class TaskWidgetItem extends StatelessWidget {
  const TaskWidgetItem({
    super.key,
    required this.title,
    required this.description,
    required this.date,
    required this.type,
    required this.onEditPress,
    required this.onDeletePress, required this.BgColor,
  });

  final String title, description, date, type;
  final VoidCallback onEditPress, onDeletePress;
  final Color BgColor;

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: EdgeInsets.all(8),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              title,
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 16,
              ),
            ),
            SizedBox(
              height: 8,
            ),
            Text(description),
            SizedBox(
              height: 8,
            ),
            Text(date),
            SizedBox(
              height: 12,
            ),
            Row(
              children: [
                Chip(
                  label: Text(type),
                  backgroundColor: BgColor,
                ),
                Spacer(),
                IconButton(
                  onPressed: onEditPress,
                  icon: Icon(Icons.edit),
                ),
                IconButton(
                  onPressed: onDeletePress,
                  icon: Icon(Icons.delete),
                  color: Colors.red,
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}

