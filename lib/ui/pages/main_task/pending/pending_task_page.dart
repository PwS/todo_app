import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:todo_app/state_management/main_task/main_task_bloc.dart';
import 'package:todo_app/ui/pages/main_task/task_list_section.dart';

class PendingTaskPage extends StatelessWidget {
  const PendingTaskPage({Key? key}) : super(key: key);

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
                  '${state.pendingTask.length} Pending | ${state.completedTask.length} Completed',
                ),
              ),
            ),
            TaskListSection(taskList: state.pendingTask)
          ],
        );
      },
    );
  }
}
