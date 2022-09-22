import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';
import 'package:todo_app/models/main_task/main_task.dart';
import 'package:todo_app/state_management/main_task/main_task_bloc.dart';
import 'package:todo_app/ui/custom_widgets/popup_menu.dart';

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
    return Padding(
      padding: const EdgeInsets.only(left: 10),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Expanded(
            child: Row(children: [
              const Icon(Icons.star_outline),
              const SizedBox(
                width: 10,
              ),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(task.titleTask,
                        overflow: TextOverflow.ellipsis,
                        style: TextStyle(
                            decoration: task.isCompleted
                                ? TextDecoration.lineThrough
                                : null)),
                    Text(DateFormat()
                        .add_yMMMd()
                        .add_Hms()
                        .format(DateTime.parse(task.date))),
                  ],
                ),
              ),
            ]),
          ),
          Row(
            children: [
              Checkbox(
                value: task.isCompleted,
                onChanged: task.isDeleted
                    ? null
                    : (value) {
                        context
                            .read<MainTaskBloc>()
                            .add(UpdateTaskEvent(task: task));
                      },
              ),
              PopUpMenu(
                task: task,
                cancelOrDeleteCallBack: () =>
                    _removeOrDeleteTask(context, task),
              )
            ],
          ),
        ],
      ),
    );
  }
}
