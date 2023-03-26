import 'package:flutter/material.dart';

import '../utils/textstyle.dart';
import '../widget/screen_background_widget.dart';
import '../widget/task_widget_item.dart';

class CompleteTaskItem extends StatefulWidget {
  const CompleteTaskItem({Key? key}) : super(key: key);

  @override
  State<CompleteTaskItem> createState() => _CompleteTaskItemState();
}

class _CompleteTaskItemState extends State<CompleteTaskItem> {
  @override
  Widget build(BuildContext context) {
    return ScreenBackground(widget: ListView.builder(
        itemCount: 12,
        itemBuilder: (context, index){
          return TaskWidgetItem(
            title: "This Is Title one",
            description: "This Is Title one Description",
            date: "12/12/2012",
            type: "Complete",
            onEditPress: (){},
            onDeletePress: (){}, BgColor: Colors.green,
          );

        }

    ),);
  }
}
