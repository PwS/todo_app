import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:todo_app/models/main_task/main_task.dart';
import 'package:todo_app/services/guid_gen.dart';
import 'package:todo_app/state_management/main_task/main_task_bloc.dart';

class AddTaskSection extends StatelessWidget {
  const AddTaskSection({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    TextEditingController addTaskTextEditingController =
        TextEditingController();
    return Container(
      padding:
          EdgeInsets.only(bottom: MediaQuery.of(context).viewInsets.bottom),
      child: Container(
        padding: const EdgeInsets.all(20),
        child: Column(
          children: [
            const Text(
              'Add Task',
              style: TextStyle(fontSize: 24),
            ),
            const SizedBox(
              height: 10,
            ),
            TextField(
              autofocus: true,
              controller: addTaskTextEditingController,
              decoration: const InputDecoration(
                  label: Text('Title'), border: OutlineInputBorder()),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                TextButton(
                    onPressed: () => Navigator.pop(context),
                    child: const Text('Cancel')),
                ElevatedButton(
                    onPressed: () {
                      var task = MainTask(
                          idTask: GUIDGen.generate(),
                          titleTask: addTaskTextEditingController.text);
                      context
                          .read<MainTaskBloc>()
                          .add(AddTaskEvent(task: task));
                      Navigator.pop(context);
                    },
                    child: const Text('Add'))
              ],
            )
          ],
        ),
      ),
    );
  }
}
