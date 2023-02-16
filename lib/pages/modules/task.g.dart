// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'task.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ITask _$ITaskFromJson(Map<String, dynamic> json) => ITask(
      id: json['id'] as String?,
      title: json['title'] as String?,
      description: json['description'] as String?,
      checked: json['checked'] as bool?,
      email: json['email'] as String?,
      date:
          json['date'] == null ? null : DateTime.parse(json['date'] as String),
      difficulty: json['difficulty'] as String?,
    );

Map<String, dynamic> _$ITaskToJson(ITask instance) => <String, dynamic>{
      'id': instance.id,
      'title': instance.title,
      'description': instance.description,
      'email': instance.email,
      'difficulty': instance.difficulty,
      'date': instance.date?.toIso8601String(),
      'checked': instance.checked,
    };
