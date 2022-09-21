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
    emit(MainTaskState(allTask: List.from(state.allTask)..add(event.task)));
  }

  FutureOr<void> _onUpdateTaskEvent(
      UpdateTaskEvent event, Emitter<MainTaskState> emit) {
    final state = this.state;
    final task = event.task;

    List<MainTask> allTask = List.from(state.allTask)..remove(task);

    if (task.isCompleted) {
      allTask.add(task.copyWith(isCompleted: false));
    } else {
      allTask.add(task.copyWith(isCompleted: true));
    }

    emit(MainTaskState(allTask: allTask));
  }

  FutureOr<void> _onDeleteTaskEvent(
      DeleteTaskEvent event, Emitter<MainTaskState> emit) {
    final state = this.state;

    emit(MainTaskState(allTask: List.from(state.allTask)..remove(event.task)));
  }

  FutureOr<void> _onRemoveTaskEvent(
      RemoveTaskEvent event, Emitter<MainTaskState> emit) {
    final state = this.state;

    emit(MainTaskState(
        allTask: List.from(state.allTask)..remove(event.task),
        removedTasks: List.from(state.removedTasks)
          ..add(event.task.copyWith(isDeleted: true))));
  }
}
