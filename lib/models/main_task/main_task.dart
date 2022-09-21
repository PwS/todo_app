import 'package:equatable/equatable.dart';

class MainTask extends Equatable {
  final String? idTask;
  final String titleTask;
  final bool isCompleted;
  final bool isDeleted;

  const MainTask({
    required this.idTask,
    required this.titleTask,
    this.isCompleted = false,
    this.isDeleted = false,
  });

  factory MainTask.fromJson(Map<String, dynamic> json) {
    return MainTask(
        idTask: json['idTask'],
        titleTask: json['titleTask'],
        isDeleted: json['isDeleted'],
        isCompleted: json['isCompleted']);
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['idTask'] = idTask;
    data['titleTask'] = titleTask;
    data['isDeleted'] = isDeleted;
    data['isCompleted'] = isCompleted;
    return data;
  }

  MainTask copyWith(
      {String? idTask, String? titleTask, bool? isDeleted, bool? isCompleted}) {
    return MainTask(
        idTask: idTask ?? this.idTask,
        titleTask: titleTask ?? this.titleTask,
        isDeleted: isDeleted ?? this.isDeleted,
        isCompleted: isCompleted ?? this.isCompleted);
  }

  @override
  String toString() {
    return '$titleTask - $isDeleted - $isCompleted';
  }

  @override
  List<Object?> get props => [idTask,titleTask, isDeleted, isCompleted];
}
