import 'dart:math';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:quiz_application/Pages/finalPage.dart';
import 'package:quiz_application/Providers/timeManger.dart';

class QuestionManager with ChangeNotifier {
  List<int> alreadyAnswered = [];
  List<Map<String, dynamic>> _questions = [];
  bool _isLoading = true;

  int maxQuestions = 10;
  int currentQuestionIndex = Random().nextInt(10);
  // int attempts = 0;

  // Add getters for questions and loading state
  List<Map<String, dynamic>> get questions => _questions;
  bool get isLoading => _isLoading;

  // Fetch questions from your data source
  Future<void> fetchQuestions(BuildContext context) async {
    _isLoading = true;
    // notifyListeners();

    // Replace this with your actual fetch logic
    // For example, you might fetch questions from a database or API
    // _questions = await fetchFromDatabaseOrAPI();
    _questions = await mainfetchQuestions(context);
    _isLoading = false;
    notifyListeners();
  }

  Future<List<Map<String, dynamic>>> mainfetchQuestions(
      BuildContext context) async {
    FirebaseFirestore firestore = FirebaseFirestore.instance;
    QuerySnapshot querySnapshot = await firestore.collection('questions').get();
    Provider.of<TimeManager>(context, listen: false).startTimer(context);

    return querySnapshot.docs
        .map((doc) => doc.data() as Map<String, dynamic>)
        .toList();
  }

  void selectRandomQuestion(BuildContext context) {
    if (_questions.isEmpty) {
      return; // Ensure we have questions before selecting one
    }

    int randomIndex = Random().nextInt(_questions.length);
    bool found = false;

    while (!found && alreadyAnswered.length < maxQuestions) {
      if (!alreadyAnswered.contains(randomIndex)) {
        currentQuestionIndex = randomIndex;
        alreadyAnswered.add(randomIndex);
        found = true;
        print("The number is not in List");
      } else {
        randomIndex = Random().nextInt(_questions.length);
        print("The number is Already in List");
      }
    }
    if (alreadyAnswered.length >= maxQuestions) {
      Navigator.push(
          context, MaterialPageRoute(builder: (context) => const FinalPage()));
    }
    notifyListeners();
  }

  // You can add other methods as needed, for example, to get the current question
  Map<String, dynamic> get currentQuestion =>
      _questions.isNotEmpty ? _questions[currentQuestionIndex] : {};
}






















// import 'dart:math';

// import 'package:flutter/material.dart';

// class QuestionManager with ChangeNotifier {
//   List<int> alreadyAnswered = [];
//   int currentQuestion = Random().nextInt(5);
//   int maxQuestions = 5;
//   void SeleteRandomQuestion() {
//     int random = Random().nextInt(5); // exculsive...
//     bool found = false;
//     while (found == false && alreadyAnswered.length < maxQuestions) {
//       if (!alreadyAnswered.contains(random)) {
//         currentQuestion = random;
//         alreadyAnswered.add(random);
//         found = true;
//         print("the number is not in List");
//       } else {
//         random = Random().nextInt(5);
//         print("the number is Already in List");
//       }
//     }
//     notifyListeners();
//   }
// }
