import 'package:hive/hive.dart';

part 'task_model.g.dart';

@HiveType(typeId: 0)
class TaskModel {
  @HiveField(0)
  int taskId;

  @HiveField(1)
  String title;

  @HiveField(2)
  String subTitle;

  @HiveField(3)
  bool isDone;

  TaskModel({required this.title, required this.subTitle, required this.isDone, required this.taskId});
}