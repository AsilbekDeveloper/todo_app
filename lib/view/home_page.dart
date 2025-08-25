import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';
import 'package:todo_app/controller/task_controller.dart';
import 'package:todo_app/core/app_colors.dart';
import 'package:todo_app/view/add_task_page.dart';
import 'package:todo_app/view/edit_task_page.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    final task = context.watch<TaskController>();
    final tasking = context.read<TaskController>();
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
      body: Padding(
        padding: EdgeInsets.only(left: 7.w, right: 7.w, top: 22.h),
        child: ListView.builder(
          itemCount: task.tasks.length,
          itemBuilder: (context, index) {
            return Card(
              margin: EdgeInsets.only(bottom: 21.h),
              elevation: 4.w,
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 19.w, vertical: 10.h),
                child: ListTile(
                  contentPadding: EdgeInsets.zero,
                  title: Text(
                    task.tasks[index].title,
                    style: TextStyle(
                      fontSize: 15.sp,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  subtitle: Text(
                    task.tasks[index].subTitle,
                    style: TextStyle(
                      fontSize: 12.sp,
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                  trailing: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      IconButton(
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => EditTaskPage(task: task.tasks[index]),
                            ),
                          );
                        },
                        icon: const Icon(
                          Icons.edit_outlined,
                          color: AppColors.primaryLight,
                        ),
                      ),
                      IconButton(
                        onPressed: () {
                          tasking.deleteTask(task.tasks[index].taskId.toString());
                        },
                        icon: const Icon(
                          CupertinoIcons.delete,
                          color: AppColors.primaryLight,
                        ),
                      ),
                      IconButton(
                        onPressed: () {
                          tasking.toggleTaskStatus(task.tasks[index].taskId.toString());
                        },
                        icon: const Icon(
                          CupertinoIcons.check_mark_circled,
                          color: AppColors.primaryLight,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            );
          },
        ),
      ),
      // floatingActionButtonLocation: FloatingActionButtonLocation.,
      floatingActionButton: SizedBox(
        width: 70.w,
        height: 70.h,
        child: FloatingActionButton(
          backgroundColor: AppColors.primary,
          shape: const StadiumBorder(),
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => const AddTaskPage()),
            );
          },
          child: const Icon(CupertinoIcons.plus, color: AppColors.secondary),
        ),
      ),
    );
  }
}