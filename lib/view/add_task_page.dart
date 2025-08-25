import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';
import 'package:todo_app/controller/task_controller.dart';
import 'package:todo_app/core/app_colors.dart';
import 'package:todo_app/model/task_model.dart';

class AddTaskPage extends StatefulWidget {
  const AddTaskPage({super.key});

  @override
  State<AddTaskPage> createState() => _AddTaskPageState();
}

class _AddTaskPageState extends State<AddTaskPage> {
  final TextEditingController titleController = TextEditingController();
  final TextEditingController subTitleController = TextEditingController();

  @override
  void initState() {
    super.initState();
    titleController;
    subTitleController;
  }

  @override
  void dispose() {
    titleController.dispose();
    subTitleController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColors.primary,
        leading: IconButton(
          onPressed: () => Navigator.pop(context),
          icon: Icon(Icons.arrow_back_ios_new, color: AppColors.secondary),
        ),
        title: Text(
          "Add Task",
          style: TextStyle(
            fontSize: 24,
            fontWeight: FontWeight.w600,
            color: AppColors.secondary,
          ),
        ),
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 24.w, vertical: 20),
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
              controller: subTitleController,
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
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                minimumSize: Size(double.infinity, 65.h),
                backgroundColor: AppColors.primary,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(15),
                ),
              ),
              onPressed: () {
                final title = titleController.text.trim();
                final subTitle = subTitleController.text.trim();
                context.read<TaskController>().addTask(
                  TaskModel(
                    title: title,
                    subTitle: subTitle,
                    isDone: false,
                    taskId: DateTime.now().millisecondsSinceEpoch,
                  ),
                );
                Navigator.pop(context);
              },
              child: Text(
                "ADD",
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.w600,
                  color: AppColors.secondary,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
