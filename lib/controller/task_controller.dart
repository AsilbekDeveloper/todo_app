import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:todo_app/model/task_model.dart';

class TaskController extends ChangeNotifier {
  Box<TaskModel>? _taskBox;

  TaskController() {
    _init();
  }

  Future<void> _init() async {
    _taskBox = await Hive.openBox<TaskModel>('tasks');
    notifyListeners();
  }

  List<TaskModel> get tasks => _taskBox?.values.toList() ?? [];

  List<TaskModel> get completedTasks =>
      _taskBox?.values.where((t) => t.isDone).toList() ?? [];

  Future<void> addTask(TaskModel task) async {
    await _taskBox?.put(task.taskId.toString(), task);
    notifyListeners();
  }

  Future<void> editTask(TaskModel task) async {
    if (_taskBox?.containsKey(task.taskId.toString()) ?? false) {
      await _taskBox?.put(task.taskId.toString(), task);
      notifyListeners();
    }
  }

  Future<void> deleteTask(String taskId) async {
    await _taskBox?.delete(taskId);
    notifyListeners();
  }

  Future<void> toggleTaskStatus(String taskId) async {
    final task = _taskBox?.get(taskId);
    if (task != null) {
      task.isDone = !task.isDone;
      await _taskBox?.put(taskId, task);
      notifyListeners();
    }
  }
}
