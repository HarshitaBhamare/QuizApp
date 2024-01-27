import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:quiz_application/AuthPage/auth_gate.dart';
import 'package:quiz_application/Providers/QuestionManagerCount.dart';
import 'package:quiz_application/Providers/optionsProvider.dart';
import 'package:quiz_application/Providers/timeManger.dart';
import 'firebase_options.dart';
// ignore: depend_on_referenced_packages
import 'package:provider/provider.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(MultiProvider(
    providers: [
      ChangeNotifierProvider<optionProvider>(
        create: (context) => optionProvider(),
      ),
      ChangeNotifierProvider<QuestionManager>(
        create: (context) => QuestionManager(),
      ),
      ChangeNotifierProvider<TimeManager>(
        create: (context) => TimeManager(),
      ),
    ],
    child: const MyApp(),
  ));
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: Scaffold(
        body: AuthGate(),
      ),
    );
  }
}
