import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:todo_app/view/bottom_nav_bar.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: Size(414, 896),
      minTextAdapt: true,
      splitScreenMode: true,
      child: MaterialApp(
        title: "Todo App",
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          fontFamily: 'Jost',
        ),
        home: BottomNavBar(),
      ),
    );
  }
}