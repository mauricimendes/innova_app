// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

import 'package:innova_app/modules/tasks/domain/entities/task.dart';

class GetTaskModel extends Task {
  final String title;
  final String description;
  final String email;
  final DateTime date;
  final String difficulty;

  GetTaskModel(
      {required this.title,
      required this.description,
      required this.email,
      required this.date,
      required this.difficulty})
      : super(
            title: '',
            description: '',
            email: '',
            date: DateTime.now(),
            difficulty: '');

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'title': title,
      'description': description,
      'email': email,
      'date': date.millisecondsSinceEpoch,
      'difficulty': difficulty,
    };
  }

  factory GetTaskModel.fromMap(Map<String, dynamic> map) {
    return GetTaskModel(
      title: map['title'] as String,
      description: map['description'] as String,
      email: map['email'] as String,
      date: DateTime.fromMillisecondsSinceEpoch(map['date'] as int),
      difficulty: map['difficulty'] as String,
    );
  }

  String toJson() => json.encode(toMap());

  factory GetTaskModel.fromJson(String source) =>
      GetTaskModel.fromMap(json.decode(source) as Map<String, dynamic>);
}
