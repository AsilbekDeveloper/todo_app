import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:todo_app/core/app_colors.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
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
          itemCount: 5,
          itemBuilder: (context, index) {
            return Card(
              margin: EdgeInsets.only(bottom: 21.h),
              elevation: 4.w,
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 19.w, vertical: 10.h),
                child: ListTile(
                  contentPadding: EdgeInsets.zero,
                  title: Text(
                    "TODO TITLE",
                    style: TextStyle(
                      fontSize: 15.sp,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  subtitle: Text(
                    "TODO SUB TITLE",
                    style: TextStyle(
                      fontSize: 12.sp,
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                  trailing: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      IconButton(
                        onPressed: () {},
                        icon: Icon(
                          Icons.edit_outlined,
                          color: AppColors.primaryLight,
                        ),
                      ),
                      IconButton(
                        onPressed: () {
                          tasking.deleteTask(task.tasks[index].taskId);
                        },
                        icon: Icon(
                          CupertinoIcons.delete,
                          color: AppColors.primaryLight,
                        ),
                      ),
                      IconButton(
                        onPressed: () {},
                        icon: Icon(
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
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      floatingActionButton: SizedBox(
        width: 70.w,
        height: 70.h,
        child: FloatingActionButton(
          backgroundColor: AppColors.primary,
          shape: StadiumBorder(),
          onPressed: () {},
          child: Icon(CupertinoIcons.plus, color: AppColors.secondary),
        ),
      ),
      bottomNavigationBar: BottomAppBar(
        notchMargin: 8,
        shape: CircularNotchedRectangle(),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Expanded(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(Icons.menu, color: AppColors.primary),
                  Text(
                    "Menu",
                    style: TextStyle(fontSize: 12.sp, fontWeight: FontWeight.w500),
                  ),
                ],
              ),
            ),
            Expanded(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(CupertinoIcons.check_mark, color: AppColors.primary),
                  Text(
                    "Done",
                    style: TextStyle(fontSize: 12.sp, fontWeight: FontWeight.w500),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),

    );
  }
}
