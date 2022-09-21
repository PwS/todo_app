import 'package:flutter/material.dart';
import 'package:todo_app/ui/pages/completed_task/completed_page.dart';
import 'package:todo_app/ui/pages/main_task/main_task_page.dart';

class RouterGenerator {
  static Route onGenerateRoute(RouteSettings routeSettings) {
    switch (routeSettings.name) {
      case CompletedPage.idPage:
        return MaterialPageRoute(builder: (_) => CompletedPage());
      case MainTaskPage.idPage:
        return MaterialPageRoute(builder: (_) => MainTaskPage());
      default:
        return MaterialPageRoute(builder: (_) => MainTaskPage());
    }
  }
}
