import 'package:json_annotation/json_annotation.dart';

part 'task.g.dart';

@JsonSerializable()
class ITask {
  final String title, description, email, difficulty;
  final DateTime date;

  ITask(
      {required this.title,
      required this.description,
      required this.email,
      required this.date,
      required this.difficulty});

  factory ITask.fromJson(Map<String, dynamic> json) => _$ITaskFromJson(json);

  Map<String, dynamic> toJson() => _$ITaskToJson(this);
}
