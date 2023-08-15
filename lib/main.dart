import 'package:databasee/Functions/db_functions.dart';
import 'package:databasee/bottomNav.dart';
import 'package:flutter/material.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await initializeDataBase();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    getAllStudents();
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'DataBase',
      theme: ThemeData(
        primarySwatch: Colors.deepPurple,
      ),
      home: const HomeScreen(),
    );
  }
}
