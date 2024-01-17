import 'package:flutter/material.dart';
import 'package:quiz_application/AuthPage/authPage.dart';
import 'package:quiz_application/Pages/quizPage.dart';
import 'package:quiz_application/Pages/registerPage.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        // body: MainQuizPage(),
        // body: MainAuthPage(),
        body: RegisterPage(),
      ),
    );
  }
}
