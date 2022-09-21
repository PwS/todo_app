import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:todo_app/state_management/main_task/main_task_bloc.dart';
import 'package:todo_app/ui/pages/completed_task/completed_page.dart';
import 'package:todo_app/ui/pages/main_task/main_task_page.dart';

class MyDrawer extends StatelessWidget {
  const MyDrawer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Drawer(
        child: Column(
          children: [
            Container(
              width: double.infinity,
              padding: const EdgeInsets.symmetric(vertical: 14, horizontal: 20),
              color: Colors.grey,
              child: Text('Task Drawer',
                  style: Theme.of(context).textTheme.headline5),
            ),
            BlocBuilder<MainTaskBloc, MainTaskState>(
              builder: (context, state) {
                return GestureDetector(
                  onTap: () =>
                      Navigator.of(context).pushNamed(MainTaskPage.idPage),
                  child: ListTile(
                    leading: const Icon(Icons.folder_special),
                    title: const Text('My Tasks'),
                    trailing: Text('${state.allTask.length}'),
                  ),
                );
              },
            ),
            const Divider(),
            BlocBuilder<MainTaskBloc, MainTaskState>(
              builder: (context, state) {
                return GestureDetector(
                  onTap: () =>
                      Navigator.of(context).pushNamed(CompletedPage.idPage),
                  child: ListTile(
                    leading: const Icon(Icons.folder_special),
                    title: const Text('Tasks Completed'),
                    trailing: Text('${state.removedTasks.length}'),
                  ),
                );
              },
            )
          ],
        ),
      ),
    );
  }
}
