import 'package:flutter/material.dart';
import 'package:todo_app/app.dart';
import 'package:provider/provider.dart';
import 'package:todo_app/controller/task_controller.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(
    MultiProvider(
      providers: [ChangeNotifierProvider(create: (_) => TaskController())],
      child: const MyApp(),
    ),
  );
}
