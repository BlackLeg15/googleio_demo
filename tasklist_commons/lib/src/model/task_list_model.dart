// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';
part 'task_list_model.g.dart';

@JsonSerializable()
class TaskListModel extends Equatable {
  const TaskListModel({
    required this.id,
    required this.name,
  });

  final String id;
  final String name;

  factory TaskListModel.fromJson(
    Map<String, dynamic> json,
  ) =>
      _$TaskListModelFromJson(
        json,
      );

  Map<String, dynamic> toJson() => _$TaskListModelToJson(this);

  TaskListModel copyWith({
    String? id,
    String? name,
  }) {
    return TaskListModel(
      id: id ?? this.id,
      name: name ?? this.name,
    );
  }

  @override
  List<Object?> get props => [
        id,
        name,
      ];
}
