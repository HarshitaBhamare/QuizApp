import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:quiz_application/AuthPage/auth_service.dart';
import 'package:quiz_application/components/barIncDec.dart';
import 'package:quiz_application/components/option.dart';
// ignore: depend_on_referenced_packages
import 'package:cloud_firestore/cloud_firestore.dart';

Future<List<Map<String, dynamic>>> fetchQuestions() async {
  FirebaseFirestore firestore = FirebaseFirestore.instance;
  QuerySnapshot querySnapshot = await firestore.collection('questions').get();

  return querySnapshot.docs
      .map((doc) => doc.data() as Map<String, dynamic>)
      .toList();
}

class MainQuizPage extends StatefulWidget {
  const MainQuizPage({super.key});

  @override
  State<MainQuizPage> createState() => _MainQuizPageState();
}

class _MainQuizPageState extends State<MainQuizPage> {
  int? selectedOptionIndex; // Tracks the index of the selected option
  bool? isCorrect; // Tracks if the selected option is correct
  String? selectedOption; // Tracks the text of the selected option

  void selectOption(
      int index, String selectedOptionText, String correctAnswer) {
    setState(() {
      selectedOptionIndex = index;
      isCorrect = selectedOptionText == correctAnswer;
    });
  }

  void logout() {
    final auth = AuthService();
    auth.signOut();
  }

  @override
  Widget build(BuildContext context) {
    double progress = 0.0;

    Size size = MediaQuery.of(context).size;
    return Scaffold(
        backgroundColor: Colors.deepPurple.shade200,
        appBar: AppBar(
          backgroundColor: Colors.deepPurple.shade200,
          centerTitle: true,
          title: Text(
            "Quiz Page",
            style: TextStyle(
              // letterSpacing: 1,
              // color: Colors.white,
              fontWeight: FontWeight.w800,
              fontSize: size.height / 30,
            ),
          ),
          actions: [
            IconButton(
                onPressed: logout,
                icon: Icon(
                  Icons.logout,
                  color: Colors.black,
                ))
          ],
        ),
        body: FutureBuilder<List<Map<String, dynamic>>>(
          future: fetchQuestions(),
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return Center(child: CircularProgressIndicator());
            } else if (snapshot.hasError) {
              return Center(child: Text("Error: ${snapshot.error}"));
            } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
              // Check for null or empty data
              return Center(child: Text("No questions available"));
            } else {
              // Ensure we have non-null question and options
              Map<String, dynamic> currentQuestion = snapshot.data!.first;
              String questionText =
                  currentQuestion['questionText'] as String? ??
                      'Default Question'; // Handle potential null
              List<dynamic> options =
                  currentQuestion['options'] as List<dynamic>? ??
                      []; // Handle potential null
              String correctAnswer =
                  currentQuestion['correctAnswer'] as String? ??
                      ''; // Fetch and handle potential null for correctAnswer

              return buildQuizView(
                context,
                questionText,
                options,
                correctAnswer, // Pass the correct answer here
              );
            }
          },
        ));
  }

  Widget buildQuizView(BuildContext context, String questionText,
      List<dynamic> options, String correctAnswer) {
    int count = 1;
    Size size = MediaQuery.of(context).size;
    return Column(
      children: [
        Container(
          width: size.width / 1.1,
          height: size.height / 10,
          decoration: BoxDecoration(
              color: Colors.deepPurple.shade100,
              borderRadius: BorderRadius.circular(10)),
          child: BarIncDec(),
        ),
        SizedBox(
          height: size.height / 50,
        ),
        Center(
          child: Container(
            width: size.width / 1.1,
            height: size.height / 1.37,
            decoration: BoxDecoration(
                color: Colors.deepPurple.shade100,
                borderRadius: BorderRadius.circular(10)),
            child: Column(
              children: [
                SizedBox(
                  height: size.height / 25,
                ),
                Container(
                    width: size.width / 1.3,
                    height: size.height / 3.5,
                    decoration: BoxDecoration(
                        color: Colors.pink,
                        border: Border.fromBorderSide(BorderSide(
                          color: Color.fromARGB(255, 119, 3, 41),
                          width: 2,
                        )),
                        boxShadow: [
                          BoxShadow(
                            color: const Color.fromARGB(255, 119, 3, 41),
                            offset: Offset(0, 0),
                            spreadRadius: 4,
                          ),
                        ],
                        borderRadius: BorderRadius.circular(20)),
                    child: Container(
                      // color: Colors.amber,
                      child: Column(
                        // mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            "Q.$count",
                            style: TextStyle(
                                fontWeight: FontWeight.w600,
                                fontSize: size.height / 23,
                                color: Color.fromARGB(255, 27, 1, 60)),
                          ),
                          Padding(
                            padding: EdgeInsets.all(8.0),
                            // width: size.width / 1.4,
                            child: Text(
                              questionText,
                              style: TextStyle(
                                  fontWeight: FontWeight.w500,
                                  fontSize: size.height / 30,
                                  color: Color.fromARGB(255, 27, 1, 71)),
                            ),
                            // color: Colors.white,
                          ),
                        ],
                      ),
                    )),
                SizedBox(
                  height: size.height / 55,
                ),
                ...options.asMap().entries.map((entry) {
                  int idx = entry.key;
                  String opt = entry.value;
                  bool isSelected = selectedOptionIndex == idx;
                  bool optionIsCorrect = isSelected
                      ? isCorrect ?? false
                      : false; // Provide a default value of `false`

                  return Options(
                    text: opt,
                    isSelected: isSelected,
                    isCorrect: optionIsCorrect, // Pass non-nullable boolean
                    onTap: () => selectOption(idx, opt, correctAnswer),
                  );
                }).toList(),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
