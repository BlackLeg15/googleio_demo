// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';
part 'task_item_model.g.dart';

@JsonSerializable()
class TaskItemModel extends Equatable {
  const TaskItemModel({
    required this.id,
    required this.listId,
    required this.name,
    required this.description,
    required this.status,
  });

  final String id;
  final String listId;
  final String name;
  final String description;
  final bool status;

  factory TaskItemModel.fromJson(
    Map<String, dynamic> json,
  ) =>
      _$TaskItemModelFromJson(
        json,
      );

  Map<String, dynamic> toJson() => _$TaskItemModelToJson(this);

  TaskItemModel copyWith({
    String? id,
    String? listId,
    String? name,
    String? description,
    bool? status,
  }) {
    return TaskItemModel(
      id: id ?? this.id,
      listId: listId ?? this.listId,
      name: name ?? this.name,
      description: description ?? this.description,
      status: status ?? this.status,
    );
  }

  @override
  List<Object?> get props => [
        id,
        listId,
        name,
        description,
        status,
      ];
}
