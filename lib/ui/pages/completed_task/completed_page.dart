import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:todo_app/state_management/main_task/main_task_bloc.dart';
import 'package:todo_app/ui/drawer/my_drawer.dart';
import 'package:todo_app/ui/pages/main_task/task_list_section.dart';

class CompletedPage extends StatelessWidget {
  const CompletedPage({Key? key}) : super(key: key);

  static const idPage = 'completedTaskPage';

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<MainTaskBloc, MainTaskState>(
      builder: (context, state) {
        return Scaffold(
          appBar: AppBar(
            title: const Text('Completed Task'),
          ),
          drawer: const MyDrawer(),
          body: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Center(
                child: Chip(
                  label: Text(
                    '${state.removedTasks.length} Tasks',
                  ),
                ),
              ),
              TaskListSection(taskList: state.removedTasks)
            ],
          ),
        );
      },
    );
  }
}
