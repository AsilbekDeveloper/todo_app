import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:todo_app/model/task_model.dart';

class TaskController extends ChangeNotifier {
  Box<TaskModel>? _taskBox;

  TaskController() {
    init();
  }

  Future<void> init() async {
    _taskBox = await Hive.openBox<TaskModel>('tasks');
    notifyListeners();
  }

  List<TaskModel> get tasks {
    if (_taskBox != null) {
      return _taskBox!.values.toList();
    } else {
      return [];
    }
  }

  Future<void> addTask(TaskModel task) async {
    await _taskBox?.put(task.taskId, task);
    notifyListeners();
  }

  Future<void> deleteTask(int taskId) async {
    await _taskBox?.delete(taskId);
    notifyListeners();
  }

  Future<void> toggleTaskStatus(int taskId) async {
    final task = _taskBox?.get(taskId);
    if(task != null) {
      task.isDone = !task.isDone;
      await _taskBox?.put(taskId, task);
      notifyListeners();
    }
  }

  List<TaskModel> get completedTasks {
    if(_taskBox != null) {
      return _taskBox!.values.where((task) => task.isDone).toList();
    } else {
      return [];
    }
  }
}