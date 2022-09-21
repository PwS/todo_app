part of 'main_task_bloc.dart';

class MainTaskState extends Equatable {
  final List<MainTask> allTask;
  final List<MainTask> removedTasks;

  const MainTaskState(
      {this.allTask = const <MainTask>[],
      this.removedTasks = const <MainTask>[]});

  @override
  List<Object?> get props => [allTask];

  MainTaskState copyWith({List<MainTask>? allTask}) {
    return MainTaskState(allTask: allTask ?? this.allTask);
  }

  Map<String, dynamic> toMap() {
    return {
      'allTask': allTask.map((x) => x.toJson()).toList(),
      'removedTasks': removedTasks.map((x) => x.toJson()).toList()
    };
  }

  factory MainTaskState.fromMap(Map<String, dynamic> map) {
    return MainTaskState(
        allTask: List<MainTask>.from(
            map['allTask']?.map((x) => MainTask.fromJson(x))),
        removedTasks: List<MainTask>.from(
            map['removedTasks']?.map((x) => MainTask.fromJson(x))));
  }
}
