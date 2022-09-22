import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:todo_app/models/main_task/main_task.dart';
import 'package:todo_app/state_management/main_task/main_task_bloc.dart';

class ListTaskCard extends StatelessWidget {
  final MainTask task;

  const ListTaskCard({Key? key, required this.task}) : super(key: key);

  void _removeOrDeleteTask(BuildContext ctx, MainTask task) {
    task.isDeleted
        ? ctx.read<MainTaskBloc>().add(DeleteTaskEvent(task: task))
        : ctx.read<MainTaskBloc>().add(RemoveTaskEvent(task: task));
  }

  @override
  Widget build(BuildContext context) {
    return ListTile(
        title: Text(task.titleTask,
            overflow: TextOverflow.ellipsis,
            style: TextStyle(
                decoration:
                    task.isCompleted ? TextDecoration.lineThrough : null)),
        trailing: Checkbox(
          value: task.isCompleted,
          onChanged: task.isDeleted
              ? null
              : (value) {
                  context.read<MainTaskBloc>().add(UpdateTaskEvent(task: task));
                },
        ),
        onLongPress: () => _removeOrDeleteTask(context, task));
  }
}
