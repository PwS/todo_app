import 'package:equatable/equatable.dart';
import 'package:todo_app/utils/constant/constant_value.dart';

class MainTask extends Equatable {
  final String idTask;
  final String titleTask;
  final String descriptionTask;
  final bool isCompleted;
  final bool isDeleted;

  const MainTask({
    required this.idTask,
    required this.titleTask,
    required this.descriptionTask,
    this.isCompleted = false,
    this.isDeleted = false,
  });

  factory MainTask.fromJson(Map<String, dynamic> json) {
    return MainTask(
        idTask: json['idTask'],
        titleTask: json['titleTask'],
        descriptionTask: json['descriptionTask'],
        isDeleted: json['isDeleted'],
        isCompleted: json['isCompleted']);
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['idTask'] = idTask;
    data['titleTask'] = titleTask;
    data['descriptionTask'] = descriptionTask;
    data['isDeleted'] = isDeleted;
    data['isCompleted'] = isCompleted;
    return data;
  }

  MainTask copyWith(
      {String? idTask,
      String? titleTask,
      String? descriptionTask,
      bool? isDeleted,
      bool? isCompleted}) {
    return MainTask(
        idTask: idTask ?? this.idTask,
        titleTask: titleTask ?? this.titleTask,
        descriptionTask: descriptionTask ?? this.descriptionTask,
        isDeleted: isDeleted ?? this.isDeleted,
        isCompleted: isCompleted ?? this.isCompleted);
  }

  @override
  String toString() {
    return '$titleTask - $descriptionTask - $isDeleted - $isCompleted';
  }

  @override
  List<Object?> get props =>
      [idTask, titleTask, descriptionTask, isDeleted, isCompleted];
}
