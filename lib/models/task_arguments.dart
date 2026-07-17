// lib/models/task_arguments.dart
class TaskInitializationModel {
  final String projectId;
  final String defaultAssignee;
  final DateTime createdAt;

  TaskInitializationModel({
    required this.projectId,
    required this.defaultAssignee,
    required this.createdAt,
  });
}