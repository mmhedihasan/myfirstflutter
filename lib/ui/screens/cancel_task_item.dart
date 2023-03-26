import 'package:flutter/material.dart';

import '../widget/screen_background_widget.dart';
import '../widget/task_widget_item.dart';

class CancelTaskItem extends StatefulWidget {
  const CancelTaskItem({Key? key}) : super(key: key);

  @override
  State<CancelTaskItem> createState() => _CancelTaskItemState();
}

class _CancelTaskItemState extends State<CancelTaskItem> {
  @override
  Widget build(BuildContext context) {
    return ScreenBackground(widget: ListView.builder(
        itemCount: 12,
        itemBuilder: (context, index){
          return TaskWidgetItem(
            title: "This Is Title one",
            description: "This Is Title one Description",
            date: "12/12/2012",
            type: "Cancel",
            onEditPress: (){},
            onDeletePress: (){},
          );
        }

    ),);
  }
}
