import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';
import 'package:todo_app/controller/task_controller.dart';
import 'package:todo_app/core/app_colors.dart';
import 'package:todo_app/model/task_model.dart';
import 'package:todo_app/view/edit_task_page.dart';
import 'package:todo_app/view/widget/task_item.dart';

class CompletedTasksPage extends StatelessWidget {
  const CompletedTasksPage({super.key});

  void _onEditTask(BuildContext context, TaskModel task) {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (_) => EditTaskPage(task: task)),
    );
  }

  @override
  Widget build(BuildContext context) {
    final taskController = context.watch<TaskController>();
    final completedTasks = taskController.completedTasks;

    return Scaffold(
      backgroundColor: AppColors.primaryLight,
      appBar: AppBar(
        backgroundColor: AppColors.primary,
        title: Text(
          "Completed Tasks",
          style: TextStyle(
            fontSize: 24.sp,
            fontWeight: FontWeight.w600,
            color: AppColors.secondary,
          ),
        ),
      ),
      body: completedTasks.isEmpty
          ? Center(
        child: Text(
          "No completed tasks",
          style: TextStyle(
            fontSize: 20.sp,
            fontWeight: FontWeight.w500,
            color: AppColors.secondary,
          ),
        ),
      )
          : Padding(
        padding: EdgeInsets.symmetric(horizontal: 7.w, vertical: 22.h),
        child: ListView.builder(
          itemCount: completedTasks.length,
          itemBuilder: (context, index) {
            final task = completedTasks[index];
            return TaskItem(
              key: ValueKey(task.taskId),
              task: task,
              onEdit: () => _onEditTask(context, task),
              onDelete: () => taskController.deleteTask(task.taskId.toString()),
              onToggle: () => taskController.toggleTaskStatus(task.taskId.toString()),
            );
          },
        ),
      ),
    );
  }
}