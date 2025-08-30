import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todo_app/core/app_colors.dart';
import 'package:todo_app/view/completed_tasks_page.dart';
import 'package:todo_app/view/home_page.dart';
import 'package:todo_app/controller/bottom_nav_controller.dart';

class BottomNavBar extends StatelessWidget {
  const BottomNavBar({super.key});

  @override
  Widget build(BuildContext context) {
    final List<Widget> pages = [
      const HomePage(),
      const CompletedTasksPage(),
    ];

    return Consumer<BottomNavController>(
      builder: (context, controller, _) {
        return Scaffold(
          body: pages[controller.currentIndex],
          bottomNavigationBar: BottomNavigationBar(
            currentIndex: controller.currentIndex,
            selectedItemColor: AppColors.primary,
            unselectedItemColor: AppColors.unSelected,
            onTap: controller.changeIndex,
            items: const [
              BottomNavigationBarItem(
                icon: Icon(Icons.menu),
                label: "All",
              ),
              BottomNavigationBarItem(
                icon: Icon(CupertinoIcons.check_mark),
                label: "Completed",
              ),
            ],
          ),
        );
      },
    );
  }
}
