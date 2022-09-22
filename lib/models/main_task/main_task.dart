import 'package:equatable/equatable.dart';
import 'package:todo_app/utils/constant/constant_value.dart';

class MainTask extends Equatable {
  final String idTask;
  final String titleTask;
  final String descriptionTask;
  final String date;
  final bool isCompleted;
  final bool isDeleted;
  final bool isFavorite;

  const MainTask(
      {required this.idTask,
      required this.titleTask,
      required this.descriptionTask,
      required this.date,
      this.isCompleted = false,
      this.isDeleted = false,
      this.isFavorite = false});

  factory MainTask.fromJson(Map<String, dynamic> json) {
    return MainTask(
        idTask: json['idTask'],
        titleTask: json['titleTask'],
        descriptionTask: json['descriptionTask'],
        date: json['date'],
        isDeleted: json['isDeleted'],
        isCompleted: json['isCompleted'],
        isFavorite: json['isFavorite']);
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['idTask'] = idTask;
    data['titleTask'] = titleTask;
    data['descriptionTask'] = descriptionTask;
    data['date'] = date;
    data['isDeleted'] = isDeleted;
    data['isCompleted'] = isCompleted;
    data['isFavorite'] = isFavorite;
    return data;
  }

  MainTask copyWith(
      {String? idTask,
      String? titleTask,
      String? descriptionTask,
      String? date,
      bool? isDeleted,
      bool? isCompleted,
      bool? isFavorite}) {
    return MainTask(
        idTask: idTask ?? this.idTask,
        titleTask: titleTask ?? this.titleTask,
        descriptionTask: descriptionTask ?? this.descriptionTask,
        date: date ?? this.date,
        isDeleted: isDeleted ?? this.isDeleted,
        isCompleted: isCompleted ?? this.isCompleted,
        isFavorite: isFavorite ?? this.isFavorite);
  }

  @override
  String toString() {
    return '$titleTask - $descriptionTask - $date -  $isDeleted - $isCompleted - $isFavorite';
  }

  @override
  List<Object?> get props => [
        idTask,
        titleTask,
        descriptionTask,
        date,
        isDeleted,
        isCompleted,
        isFavorite
      ];
}
