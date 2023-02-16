import 'package:json_annotation/json_annotation.dart';

part 'task.g.dart';

@JsonSerializable()
class ITask {
  final String? id, title, description, email, difficulty;
  final DateTime? date;
  final bool? checked;

  ITask(
      {this.id,
      this.title,
      this.description,
      this.checked,
      this.email,
      this.date,
      this.difficulty});

  factory ITask.fromJson(Map<String, dynamic> json) => _$ITaskFromJson(json);

  Map<String, dynamic> toJson() => _$ITaskToJson(this);
}
