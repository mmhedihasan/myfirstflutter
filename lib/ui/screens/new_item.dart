import 'package:flutter/material.dart';
import 'package:mynewapp/ui/widget/screen_background_widget.dart';

import '../widget/card_widget_item.dart';
import '../widget/task_widget_item.dart';

class NewTaskItem extends StatefulWidget {
  const NewTaskItem({Key? key}) : super(key: key);

  @override
  State<NewTaskItem> createState() => _NewTaskItemState();
}

class _NewTaskItemState extends State<NewTaskItem> {
  @override
  Widget build(BuildContext context) {
    return ScreenBackground(
        widget: Column(
      children: [
        Row(
          children: const [
            Expanded(
              child: CardWidgetItem(
                textOfScreen: 12,
                typeOfScreen: "New",
              ),
            ),
            Expanded(
              child: CardWidgetItem(
                textOfScreen: 23,
                typeOfScreen: "Complete",
              ),
            ),
            Expanded(
              child: CardWidgetItem(
                textOfScreen: 12,
                typeOfScreen: "Cancel",
              ),
            ),
            Expanded(
              child: CardWidgetItem(
                textOfScreen: 12,
                typeOfScreen: "In Progress",
              ),
            ),
          ],
        ),
        Expanded(
            child: ListView.builder(
                itemCount: 12,
                itemBuilder: (context, index){
                  return TaskWidgetItem(
                    title: "This Is Title one",
                    description: "This Is Title one Description",
                    date: "12/12/2012",
                    type: "New",
                    onEditPress: (){},
                    onDeletePress: (){}, BgColor: Colors.blueAccent,
                  );
                }

            ))
      ],
    ));
  }
}


