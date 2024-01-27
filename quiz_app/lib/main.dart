import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:quiz_application/AuthPage/auth_gate.dart';
import 'package:quiz_application/Pages/finalPage.dart';
import 'package:quiz_application/Pages/quizPage.dart';
import 'package:quiz_application/Providers/QuestionManagerCount.dart';
import 'package:quiz_application/Providers/optionsProvider.dart';
import 'package:quiz_application/Providers/timeManger.dart';
import 'package:quiz_application/components/incDecBar.dart';
// import 'package:quiz_application/components/.dart';
import 'package:quiz_application/components/timerFile.dart';
import 'firebase_options.dart';
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
    child: MyApp(),
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
        // body: TimerClock(),
        // body: MainQuizPage(),
        body: FinalPage(),
        // body: BudgetSliderWidget(),
        // body: MainAuthPage(),
        // body: RegisterPage(),
      ),
    );
  }
}
