import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:todo_app/state_management/main_task/main_task_bloc.dart';
import 'package:todo_app/ui/drawer/my_drawer.dart';
import 'package:todo_app/ui/pages/add_task/add_task.dart';
import 'package:todo_app/ui/pages/main_task/task_list_section.dart';

class MainTaskPage extends StatefulWidget {
  const MainTaskPage({Key? key}) : super(key: key);

  static const idPage = 'mainTaskPage';

  @override
  State<MainTaskPage> createState() => _MainTaskPageState();
}

class _MainTaskPageState extends State<MainTaskPage> {
  void _addTask(BuildContext context) {
    showModalBottomSheet(
        context: context,
        builder: (context) => const SingleChildScrollView(
              child: AddTaskSection(),
            ));
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<MainTaskBloc, MainTaskState>(
      builder: (context, state) {
        return Scaffold(
          appBar: AppBar(
            title: const Text('Tasks App'),
            actions: [
              IconButton(
                onPressed: () {},
                icon: const Icon(Icons.add),
              )
            ],
          ),
          drawer: const MyDrawer(),
          body: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
               Center(
                child: Chip(
                  label: Text(
                    '${state.allTask.length} Tasks',
                  ),
                ),
              ),
              TaskListSection(taskList: state.allTask)
            ],
          ),
          floatingActionButton: FloatingActionButton(
            onPressed: () => _addTask(context),
            tooltip: 'Add Task',
            child: const Icon(Icons.add),
          ),
        );
      },
    );
  }
}
