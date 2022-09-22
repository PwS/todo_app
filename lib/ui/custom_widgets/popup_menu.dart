import 'package:flutter/material.dart';
import 'package:todo_app/models/main_task/main_task.dart';

class PopUpMenu extends StatelessWidget {
  final MainTask task;
  final VoidCallback cancelOrDeleteCallBack;

  const PopUpMenu(
      {Key? key, required this.task, required this.cancelOrDeleteCallBack})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return PopupMenuButton(
        itemBuilder: task.isDeleted == false
            ? ((context) => [
                  PopupMenuItem(
                    child: TextButton.icon(
                        onPressed: null,
                        icon: const Icon(Icons.edit),
                        label: const Text('Edit')),
                    onTap: () {},
                  ),
                  PopupMenuItem(
                    child: TextButton.icon(
                        onPressed: null,
                        icon: const Icon(Icons.bookmark),
                        label: const Text('Add to Bookmarks')),
                    onTap: () {},
                  ),
                  PopupMenuItem(
                    onTap: cancelOrDeleteCallBack,
                    child: TextButton.icon(
                        onPressed: null,
                        icon: const Icon(Icons.delete),
                        label: const Text('Delete')),
                  )
                ])
            : (context) => [
                  PopupMenuItem(
                    child: TextButton.icon(
                        onPressed: null,
                        icon: const Icon(Icons.restore_from_trash),
                        label: const Text('Restore')),
                    onTap: () {},
                  ),
                  PopupMenuItem(
                    child: TextButton.icon(
                        onPressed: null,
                        icon: const Icon(Icons.delete_forever),
                        label: const Text('Delete Forever')),
                    onTap: () {},
                  )
                ]);
  }
}
