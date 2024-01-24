import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:quiz_application/AuthPage/auth_gate.dart';
import 'package:quiz_application/Pages/quizPage.dart';
import 'package:quiz_application/components/barIncDec.dart';
import 'firebase_options.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(
    MyApp(),
  );
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
        // appBar: AppBar(title: Text(",hehdfbf")),
        // body: Container(
        //   width: 100,
        //   height: 100,
        //   color: Colors.amber,
        // ),
        // body: BarIncDec(),
        // body: AuthGate(),
        body: MainQuizPage(),
        // body: MainAuthPage(),
        // body: RegisterPage(),
      ),
    );
  }
}
