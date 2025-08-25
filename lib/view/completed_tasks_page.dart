import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';
import 'package:todo_app/controller/task_controller.dart';
import 'package:todo_app/core/app_colors.dart';
import 'package:todo_app/view/edit_task_page.dart';

class CompletedTasksPage extends StatelessWidget {
  const CompletedTasksPage({super.key});

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
          style: TextStyle(fontSize: 20.sp, fontWeight: FontWeight.w500, color: AppColors.secondary),
        ),
      )
          : ListView.builder(
        padding: EdgeInsets.only(left: 7.w, right: 7.w, top: 22.h),
        itemCount: completedTasks.length,
        itemBuilder: (context, index) {
          final task = completedTasks[index];
          return Card(
            margin: EdgeInsets.only(bottom: 21.h),
            elevation: 4.w,
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 19.w, vertical: 10.h),
              child: ListTile(
                contentPadding: EdgeInsets.zero,
                title: Text(
                  task.title,
                  style: TextStyle(fontSize: 15.sp, fontWeight: FontWeight.w600),
                ),
                subtitle: Text(
                  task.subTitle,
                  style: TextStyle(fontSize: 12.sp, fontWeight: FontWeight.w400),
                ),
                trailing: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    IconButton(
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (_) => EditTaskPage(task: task)),
                        );
                      },
                      icon: const Icon(Icons.edit_outlined, color: AppColors.primaryLight),
                    ),
                    IconButton(
                      onPressed: () {
                        taskController.deleteTask(task.taskId.toString());
                      },
                      icon: const Icon(CupertinoIcons.delete, color: AppColors.primaryLight),
                    ),
                    IconButton(
                      onPressed: () {
                        taskController.toggleTaskStatus(task.taskId.toString());
                      },
                      icon: const Icon(CupertinoIcons.check_mark_circled, color: AppColors.primaryLight),
                    ),
                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}