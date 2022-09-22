import 'package:flutter/material.dart';
import 'package:todo_app/ui/drawer/my_drawer.dart';
import 'package:todo_app/ui/pages/add_task/add_task.dart';
import 'package:todo_app/ui/pages/main_task/completed/completed_task_page.dart';
import 'package:todo_app/ui/pages/main_task/favorite/favorite_task_page.dart';
import 'package:todo_app/ui/pages/main_task/pending/pending_task_page.dart';

class TabsScreen extends StatefulWidget {
  const TabsScreen({Key? key}) : super(key: key);

  static const idPage = 'tabsScreen';

  @override
  State<TabsScreen> createState() => _TabsScreenState();
}

class _TabsScreenState extends State<TabsScreen> {
  final List<Map<String, dynamic>> _pageDetails = [
    {'pageName': const PendingTaskPage(), 'title': 'Pending Task'},
    {'pageName': const CompletedTaskPage(), 'title': 'Complete Task'},
    {'pageName': const FavoriteTaskPage(), 'title': 'Favorite Task'},
  ];

  void _addTask(BuildContext context) {
    showModalBottomSheet(
        context: context,
        builder: (context) => const SingleChildScrollView(
              child: AddTaskSection(),
            ));
  }

  var _selectedPageIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(_pageDetails[_selectedPageIndex]['title']),
        actions: [
          IconButton(
              onPressed: () => _addTask(context), icon: const Icon(Icons.add))
        ],
      ),
      drawer: const MyDrawer(),
      body: _pageDetails[_selectedPageIndex]['pageName'],
      floatingActionButton: _selectedPageIndex != 0
          ? null
          : FloatingActionButton(
              onPressed: () => _addTask(context),
              tooltip: 'Add Task',
              child: const Icon(Icons.add),
            ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _selectedPageIndex,
        onTap: (index) {
          setState(() {
            _selectedPageIndex = index;
          });
        },
        items: const [
          BottomNavigationBarItem(
              icon: Icon(Icons.incomplete_circle_sharp),
              label: 'Pending Tasks'),
          BottomNavigationBarItem(
              icon: Icon(Icons.done), label: 'Completed Tasks'),
          BottomNavigationBarItem(
              icon: Icon(Icons.favorite), label: 'Favorite Tasks'),
        ],
      ),
    );
  }
}
