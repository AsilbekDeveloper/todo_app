import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';
import 'package:todo_app/controller/task_controller.dart';
import 'package:todo_app/core/app_colors.dart';
import 'package:todo_app/model/task_model.dart';

class EditTaskPage extends StatefulWidget {
  final TaskModel task;
  const EditTaskPage({super.key, required this.task});

  @override
  State<EditTaskPage> createState() => _EditTaskPageState();
}

class _EditTaskPageState extends State<EditTaskPage> {
  final TextEditingController titleController = TextEditingController();
  final TextEditingController subtitleController = TextEditingController();

  @override
  void initState() {
    super.initState();
    titleController.text = widget.task.title;
    subtitleController.text = widget.task.subTitle;
  }

  @override
  void dispose() {
    titleController.dispose();
    subtitleController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColors.primary,
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: Icon(Icons.arrow_back_ios_new, color: AppColors.secondary),
        ),
        title: Text(
          "Edit Task",
          style: TextStyle(
            fontSize: 24,
            fontWeight: FontWeight.w600,
            color: AppColors.secondary,
          ),
        ),
      ),
      body: Padding(
        padding: EdgeInsets.only(left: 24.w, right: 24.w, top: 20),
        child: Column(
          children: [
            TextField(
              controller: titleController,
              decoration: InputDecoration(
                label: Text("Title"),
                labelStyle: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w400,
                  color: AppColors.unSelected,
                ),
              ),
            ),
            SizedBox(height: 20),
            TextField(
              controller: subtitleController,
              decoration: InputDecoration(
                label: Text("Detail"),
                labelStyle: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w400,
                  color: AppColors.unSelected,
                ),
              ),
            ),
            SizedBox(height: 50),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    minimumSize: Size(170.w, 65.h),
                    backgroundColor: AppColors.primary,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(15),
                    ),
                  ),
                  onPressed: () {
                    String title = titleController.text.trim();
                    String subTitle = subtitleController.text.trim();
                    context.read<TaskController>().editTask(
                      TaskModel(
                        title: title,
                        subTitle: subTitle,
                        isDone: widget.task.isDone,
                        taskId: widget.task.taskId,
                      ),
                    );
                    Navigator.pop(context);
                  },
                  child: Text(
                    "Update",
                    style: TextStyle(
                      fontSize: 15,
                      fontWeight: FontWeight.w400,
                      color: AppColors.secondary,
                    ),
                  ),
                ),
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    minimumSize: Size(170.w, 65.h),
                    backgroundColor: AppColors.primary,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(15),
                    ),
                  ),
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  child: Text(
                    "Cancel",
                    style: TextStyle(
                      fontSize: 15,
                      fontWeight: FontWeight.w400,
                      color: AppColors.secondary,
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
