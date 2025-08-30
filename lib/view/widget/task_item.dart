import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:todo_app/core/app_colors.dart';
import 'package:todo_app/model/task_model.dart';

class TaskItem extends StatelessWidget {
  final TaskModel task;
  final VoidCallback onEdit;
  final VoidCallback onDelete;
  final VoidCallback onToggle;

  const TaskItem({
    super.key,
    required this.task,
    required this.onEdit,
    required this.onDelete,
    required this.onToggle,
  });

  @override
  Widget build(BuildContext context) {
    final cardColor = task.isDone ? Colors.grey.shade300 : Colors.white;

    return Card(
      color: cardColor,
      margin: EdgeInsets.only(bottom: 21.h),
      elevation: 4.w,
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 19.w, vertical: 10.h),
        child: ListTile(
          contentPadding: EdgeInsets.zero,
          title: Text(
            task.title,
            style: TextStyle(
              fontSize: 15.sp,
              fontWeight: FontWeight.w600,
              decoration: task.isDone ? TextDecoration.lineThrough : null,
            ),
          ),
          subtitle: Text(
            task.subTitle,
            style: TextStyle(
              fontSize: 12.sp,
              fontWeight: FontWeight.w400,
              decoration: task.isDone ? TextDecoration.lineThrough : null,
            ),
          ),
          trailing: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              IconButton(
                onPressed: onEdit,
                icon: const Icon(
                  Icons.edit_outlined,
                  color: AppColors.primaryLight,
                ),
              ),
              IconButton(
                onPressed: onDelete,
                icon: const Icon(
                  CupertinoIcons.delete,
                  color: AppColors.primaryLight,
                ),
              ),
              IconButton(
                onPressed: onToggle,
                icon: Icon(
                  task.isDone
                      ? CupertinoIcons
                            .check_mark_circled_solid // filled icon
                      : CupertinoIcons.check_mark_circled,
                  color: AppColors.primaryLight,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
