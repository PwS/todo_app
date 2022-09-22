import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:todo_app/models/main_task/main_task.dart';

part 'main_task_event.dart';

part 'main_task_state.dart';

class MainTaskBloc extends Bloc<MainTaskEvent, MainTaskState> {
  MainTaskBloc() : super(const MainTaskState()) {
    on<AddTaskEvent>(_onAddTaskEvent);
    on<UpdateTaskEvent>(_onUpdateTaskEvent);
    on<DeleteTaskEvent>(_onDeleteTaskEvent);
    on<RemoveTaskEvent>(_onRemoveTaskEvent);
  }

  FutureOr<void> _onAddTaskEvent(
      AddTaskEvent event, Emitter<MainTaskState> emit) {
    final state = this.state;
    emit(MainTaskState(
        pendingTask: List.from(state.pendingTask)..add(event.task),
        completedTask: state.completedTask,
        favoriteTask: state.favoriteTask,
        removedTasks: state.removedTasks));
  }

  FutureOr<void> _onUpdateTaskEvent(
      UpdateTaskEvent event, Emitter<MainTaskState> emit) {
    final state = this.state;
    final task = event.task;

    List<MainTask> pendingTasks = state.pendingTask;
    List<MainTask> completedTask = state.completedTask;

    task.isCompleted == false
        ? {
            pendingTasks = List.from(pendingTasks)..remove(task),
            completedTask = List.from(completedTask)
              ..insert(0, task.copyWith(isCompleted: true))
          }
        : {
            completedTask = List.from(completedTask)..remove(task),
            pendingTasks = List.from(pendingTasks)
              ..insert(0, task.copyWith(isCompleted: false))
          };
    emit(MainTaskState(
        pendingTask: pendingTasks,
        completedTask: completedTask,
        favoriteTask: state.favoriteTask,
        removedTasks: state.removedTasks));
  }

  FutureOr<void> _onDeleteTaskEvent(
      DeleteTaskEvent event, Emitter<MainTaskState> emit) {
    final state = this.state;

    emit(MainTaskState(
        pendingTask: state.pendingTask,
        completedTask: state.completedTask,
        favoriteTask: state.favoriteTask,
        removedTasks: List.from(state.removedTasks)..remove(event.task)));
  }

  FutureOr<void> _onRemoveTaskEvent(
      RemoveTaskEvent event, Emitter<MainTaskState> emit) {
    final state = this.state;

    emit(MainTaskState(
      pendingTask: List.from(state.pendingTask)..remove(event.task),
      completedTask: List.from(state.completedTask)..remove(event.task),
      favoriteTask: List.from(state.favoriteTask)..remove(event.task),
      removedTasks: List.from(state.removedTasks)
        ..add(event.task.copyWith(isDeleted: true)),
    ));
  }
}
