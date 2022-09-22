import 'package:flutter/material.dart';
import 'package:todo_app/ui/pages/completed_task/completed_page.dart';
import 'package:todo_app/ui/pages/main_task/pending/pending_task_page.dart';
import 'package:todo_app/ui/tabs_screen/tabs_screen.dart';

class RouterGenerator {
  static Route onGenerateRoute(RouteSettings routeSettings) {
    switch (routeSettings.name) {
      case CompletedPage.idPage:
        return MaterialPageRoute(builder: (_) => CompletedPage());
      case TabsScreen.idPage:
        return MaterialPageRoute(builder: (_) => TabsScreen());
      default:
        return MaterialPageRoute(builder: (_) => PendingTaskPage());
    }
  }
}
