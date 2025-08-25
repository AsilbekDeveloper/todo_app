import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:todo_app/core/app_colors.dart';
import 'package:todo_app/view/home_page.dart';
import 'package:todo_app/view/completed_tasks_page.dart';

class BottomNavBar extends StatelessWidget {
  const BottomNavBar({super.key});

  @override
  Widget build(BuildContext context) {
    final ValueNotifier<int> currentIndexNotifier = ValueNotifier<int>(0);

    final List<Widget> pages = [
      const HomePage(),
      const CompletedTasksPage(),
    ];

    return Scaffold(
      body: ValueListenableBuilder<int>(
        valueListenable: currentIndexNotifier,
        builder: (context, currentIndex, child) {
          return pages[currentIndex];
        },
      ),
      bottomNavigationBar: BottomNavigationBar(
        selectedItemColor: AppColors.primary,
        unselectedItemColor: AppColors.unSelected,
        currentIndex: currentIndexNotifier.value,
        onTap: (index) {
          currentIndexNotifier.value = index;
        },
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.menu), label: "All"),
          BottomNavigationBarItem(
            icon: Icon(CupertinoIcons.check_mark),
            label: "Completed",
          ),
        ],
      ),
    );
  }
}