// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'task_item_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

TaskItemModel _$TaskItemModelFromJson(Map<String, dynamic> json) =>
    TaskItemModel(
      id: json['id'] as String,
      listId: json['listId'] as String,
      name: json['name'] as String,
      description: json['description'] as String,
      status: json['status'] as bool,
    );

Map<String, dynamic> _$TaskItemModelToJson(TaskItemModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'listId': instance.listId,
      'name': instance.name,
      'description': instance.description,
      'status': instance.status,
    };
