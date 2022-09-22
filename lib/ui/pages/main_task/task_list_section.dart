import 'package:flutter/material.dart';
import 'package:todo_app/models/main_task/main_task.dart';
import 'package:todo_app/ui/custom_widgets/list_task_card.dart';

class TaskListSection extends StatelessWidget {
  final List<MainTask> taskList;

  const TaskListSection({Key? key, required this.taskList}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: SingleChildScrollView(
        child: ExpansionPanelList.radio(
          children: taskList
              .map((task) => ExpansionPanelRadio(
                  value: task.idTask,
                  headerBuilder: (context, isOpen) => ListTaskCard(task: task),
                  body: ListTile(
                    title: SelectableText.rich(TextSpan(children: [
                      const TextSpan(
                          text: 'Text\n',
                          style: TextStyle(fontWeight: FontWeight.bold)),
                      TextSpan(text: task.titleTask),
                      const TextSpan(
                          text: '\n\nDescription\n',
                          style: TextStyle(fontWeight: FontWeight.bold)),
                      TextSpan(text: task.descriptionTask),
                    ])),
                  )))
              .toList(),
        ),
      ),
    );
  }
}

/*
Expanded(
child: ListView.builder(
itemCount: taskList.length,
itemBuilder: (context, index) {
var task = taskList[index];
return ListTaskCard(task: task);
}),
);*/
