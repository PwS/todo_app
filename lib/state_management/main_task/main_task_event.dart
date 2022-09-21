part of 'main_task_bloc.dart';

abstract class MainTaskEvent extends Equatable {
  const MainTaskEvent();

  @override
  List<Object> get props => [];
}

class AddTaskEvent extends MainTaskEvent {
  final MainTask task;

  const AddTaskEvent({required this.task});

  @override
  List<Object> get props => [task];
}

class UpdateTaskEvent extends MainTaskEvent {
  final MainTask task;

  const UpdateTaskEvent({required this.task});

  @override
  List<Object> get props => [task];
}

class RemoveTaskEvent extends MainTaskEvent {
  final MainTask task;

  const RemoveTaskEvent({required this.task});

  @override
  List<Object> get props => [task];
}

class DeleteTaskEvent extends MainTaskEvent {
  final MainTask task;

  const DeleteTaskEvent({required this.task});

  @override
  List<Object> get props => [task];
}
