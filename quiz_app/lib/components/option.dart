import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:quiz_application/Pages/quizPage.dart';
import 'package:quiz_application/Providers/optionsProvider.dart';
import 'package:quiz_application/Providers/timeManger.dart';
import 'package:provider/provider.dart';

class Options extends StatelessWidget {
  final int index;
  final String text;
  final VoidCallback onTap;
  bool isSelected;
  bool isCorrect;

  Options(
      {super.key,
      required this.text,
      required this.onTap,
      required this.isSelected,
      required this.isCorrect,
      required this.index});

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    final selectedIndex = context.watch<optionProvider>().selectedIndex;
    if (selectedIndex >= 0 &&
        context.watch<optionProvider>().myOptions[selectedIndex].index ==
            index) {
      isSelected =
          context.watch<optionProvider>().myOptions[selectedIndex].isSelected;
      // context.watch<TimeManager>().CalculatePoint();
    } else {
      isSelected = false;
    }
    final int correctIndex = context.watch<optionProvider>().correctIndx;
    Color bgColor = Colors.amber;
    // print(
    // "Index : ${index} isSelected : $isSelected CorrectIndex : ${correctIndex}");
    bgColor = isSelected
        ? (index == correctIndex ? Colors.green : Colors.red)
        : Colors.amber;

    // isCorrect = context.watch<optionProvider>().

    return GestureDetector(
      onTap: onTap,
      child: Column(
        children: [
          SizedBox(
            height: size.height / 50,
          ),
          Container(
            width: size.width / 1.3,
            height: size.height / 15,
            decoration: BoxDecoration(
              color: bgColor,
              boxShadow: const [
                BoxShadow(
                  color: Color.fromARGB(255, 110, 85, 8),
                  offset: Offset(0, 0),
                  spreadRadius: 4,
                ),
              ],
              borderRadius: BorderRadius.circular(12),
            ),
            child: Center(
              child: Text(
                text,
                style: TextStyle(
                  fontSize: size.height / 30,
                  fontWeight: FontWeight.bold,
                  color: const Color.fromRGBO(87, 47, 10, 1),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
