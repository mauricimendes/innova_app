// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'task.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ITask _$ITaskFromJson(Map<String, dynamic> json) => ITask(
      title: json['title'] as String,
      description: json['description'] as String,
      email: json['email'] as String,
      date: DateTime.parse(json['date'] as String),
      difficulty: json['difficulty'] as String,
    );

Map<String, dynamic> _$ITaskToJson(ITask instance) => <String, dynamic>{
      'title': instance.title,
      'description': instance.description,
      'email': instance.email,
      'difficulty': instance.difficulty,
      'date': instance.date.toIso8601String(),
    };
