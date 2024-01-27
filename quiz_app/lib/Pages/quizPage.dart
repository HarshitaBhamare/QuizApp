import 'package:flutter/material.dart';
import 'package:quiz_application/AuthPage/auth_service.dart';
import 'package:quiz_application/Providers/QuestionManagerCount.dart';
import 'package:quiz_application/Providers/optionsProvider.dart';
import 'package:quiz_application/Providers/timeManger.dart';
// import 'package:quiz_application/components/.dart';
import 'package:quiz_application/components/option.dart';
import 'package:provider/provider.dart';
import 'package:quiz_application/components/timerFile.dart';

class MainQuizPage extends StatefulWidget {
  const MainQuizPage({super.key});

  @override
  State<MainQuizPage> createState() => _MainQuizPageState();
}

class _MainQuizPageState extends State<MainQuizPage> {
  int? selectedOptionIndex;
  bool? isCorrect;
  String? selectedOption;

  @override
  void initState() {
    super.initState();
    Provider.of<QuestionManager>(context, listen: false)
        .fetchQuestions(context);
  }

  Future<void> selectOption(int index, String selectedOptionText,
      String correctAnswer, BuildContext context) async {
    // setState(() {
    // selectedOptionIndex = index;
    //   isCorrect = selectedOptionText == correctAnswer;
    // });
    final bool isAnswered = context.read<optionProvider>().isAnswered;
    if (isAnswered) {
      return;
    }
    selectedOptionIndex = index;
    optionProvider.isSelected = selectedOptionText;
    Provider.of<optionProvider>(context, listen: false).CheckAnswer(context);
    Provider.of<TimeManager>(context, listen: false).stopTimer();
    // Provider.of<TimeManager>(context, listen: false).CalculatePoint();
    // isCorrect = selectedOptionText == correctAnswer;
    await Future.delayed(Duration(seconds: 1));
    Provider.of<optionProvider>(context, listen: false).ResetFunc();
    Provider.of<TimeManager>(context, listen: false).ResetTime();
    Provider.of<QuestionManager>(context, listen: false)
        .selectRandomQuestion(context);
    Provider.of<TimeManager>(context, listen: false).startTimer(context);
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
        backgroundColor: Colors.deepPurple.shade200,
        appBar: AppBar(
          automaticallyImplyLeading: false,
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
        ),
        body: Consumer<QuestionManager>(
          builder: (context, questionManager, child) {
            if (questionManager.isLoading) {
              return Center(child: CircularProgressIndicator());
            } else if (questionManager.questions.isEmpty) {
              return Center(child: Text("No questions available"));
            } else {
              Map<String, dynamic> currentQuestion =
                  questionManager.currentQuestion;
              String questionText =
                  currentQuestion['questionText'] as String? ??
                      'Default Question';
              List<dynamic> options =
                  currentQuestion['options'] as List<dynamic>? ?? [];
              String correctAnswer =
                  currentQuestion['correctAns'] as String? ?? '';

              // Assuming optionProvider is your state management for options
              Provider.of<optionProvider>(context, listen: false)
                  .myOptions
                  .clear();

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
    final count = context.watch<QuestionManager>().alreadyAnswered.length + 1;
    Size size = MediaQuery.of(context).size;
    return Column(
      children: [
        Container(
          width: size.width / 1.1,
          height: size.height / 10,
          decoration: BoxDecoration(
              color: Colors.deepPurple.shade100,
              borderRadius: BorderRadius.circular(10)),
          child: TimerClock(),
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
                  // print(
                  // "Correct Answer : ${correctAnswer} SelectedOption : ${opt}");
                  Provider.of<optionProvider>(context, listen: false)
                      .AddOptions(
                          Options(
                            text: opt,
                            onTap: () =>
                                selectOption(idx, opt, correctAnswer, context),
                            isSelected: isSelected,
                            isCorrect: correctAnswer == opt,
                            index: idx,
                          ),
                          idx);

                  return Options(
                    text: opt,
                    isSelected: isSelected,
                    isCorrect: optionIsCorrect, // Pass non-nullable boolean
                    onTap: () => selectOption(idx, opt, correctAnswer, context),
                    index: idx,
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
