import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:todo_app/state_management/main_task/main_task_bloc.dart';
import 'package:todo_app/ui/pages/main_task/task_list_section.dart';

class CompletedTaskPage extends StatelessWidget {
  const CompletedTaskPage({Key? key}) : super(key: key);

  static const idPage = 'mainTaskPage';

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<MainTaskBloc, MainTaskState>(
      builder: (context, state) {
        return Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Center(
              child: Chip(
                label: Text(
                  '${state.completedTask.length} Tasks',
                ),
              ),
            ),
            TaskListSection(taskList: state.completedTask)
          ],
        );
      },
    );
  }
}
