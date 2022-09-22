part of 'main_task_bloc.dart';

class MainTaskState extends Equatable {
  final List<MainTask> pendingTask;
  final List<MainTask> completedTask;
  final List<MainTask> favoriteTask;
  final List<MainTask> removedTasks;

  const MainTaskState(
      {this.pendingTask = const <MainTask>[],
      this.completedTask = const <MainTask>[],
      this.favoriteTask = const <MainTask>[],
      this.removedTasks = const <MainTask>[]});

  @override
  List<Object?> get props =>
      [pendingTask, completedTask, favoriteTask, removedTasks];

  Map<String, dynamic> toMap() {
    return {
      'pendingTask': pendingTask.map((x) => x.toJson()).toList(),
      'completedTask': completedTask.map((x) => x.toJson()).toList(),
      'favoriteTask': favoriteTask.map((x) => x.toJson()).toList(),
      'removedTasks': removedTasks.map((x) => x.toJson()).toList()
    };
  }

  factory MainTaskState.fromMap(Map<String, dynamic> map) {
    return MainTaskState(
        pendingTask: List<MainTask>.from(
            map['pendingTask']?.map((x) => MainTask.fromJson(x))),
        completedTask: List<MainTask>.from(
            map['completedTask']?.map((x) => MainTask.fromJson(x))),
        favoriteTask: List<MainTask>.from(
            map['favoriteTask']?.map((x) => MainTask.fromJson(x))),
        removedTasks: List<MainTask>.from(
            map['removedTasks']?.map((x) => MainTask.fromJson(x))));
  }
}
