import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';
import 'package:todo_app/controller/task_controller.dart';
import 'package:todo_app/core/app_colors.dart';
import 'package:todo_app/model/task_model.dart';
import 'package:todo_app/view/add_task_page.dart';
import 'package:todo_app/view/edit_task_page.dart';
import 'package:todo_app/view/widget/task_item.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  void _onEditTask(TaskModel task) {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => EditTaskPage(task: task)),
    );
  }

  void _onDeleteTask(TaskModel task) {
    context.read<TaskController>().deleteTask(task.taskId.toString());
  }

  void _onToggleTask(TaskModel task) {
    context.read<TaskController>().toggleTaskStatus(task.taskId.toString());
  }

  @override
  Widget build(BuildContext context) {
    final taskController = context.watch<TaskController>();
    return Scaffold(
      backgroundColor: AppColors.primaryLight,
      appBar: AppBar(
        backgroundColor: AppColors.primary,
        title: Text(
          "TODO APP",
          style: TextStyle(
            fontSize: 24.sp,
            fontWeight: FontWeight.w600,
            color: AppColors.secondary,
          ),
        ),
      ),
      body: taskController.tasks.isEmpty
          ? Center(
              child: Text(
                "No tasks",
                style: TextStyle(fontSize: 20.sp, color: AppColors.secondary),
              ),
            )
          : Padding(
              padding: EdgeInsets.only(left: 7.w, right: 7.w, top: 22.h),
              child: ListView.builder(
                itemCount: taskController.tasks.length,
                itemBuilder: (context, index) {
                  return Selector<TaskController, TaskModel>(
                    selector: (_, controller) => controller.tasks[index],
                    builder: (_, currentTask, _) => TaskItem(
                      key: ValueKey(currentTask.taskId),
                      task: currentTask,
                      onEdit: () => _onEditTask(currentTask),
                      onDelete: () => _onDeleteTask(currentTask),
                      onToggle: () => _onToggleTask(currentTask),
                    ),
                  );
                },
              ),
            ),
      floatingActionButton: SizedBox(
        width: 70.w,
        height: 70.h,
        child: FloatingActionButton(
          backgroundColor: AppColors.primary,
          shape: const StadiumBorder(),
          onPressed: () => Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => const AddTaskPage()),
          ),
          child: const Icon(CupertinoIcons.plus, color: AppColors.secondary),
        ),
      ),
    );
  }
}
