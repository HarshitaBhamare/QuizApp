import 'package:flutter/material.dart';

class BarIncDec extends StatefulWidget {
  const BarIncDec({super.key});

  @override
  State<BarIncDec> createState() => _BarIncDecState();
}

class _BarIncDecState extends State<BarIncDec> {
  double progress = 0.0;

  void updateProgress(bool isCorrect) {
    setState(() {
      if (isCorrect) {
        progress += 0.1; // Increment for correct answer
      } else {
        progress -= 0.1; // Decrement for wrong answer
      }
      if (progress < 0) progress = 0; // Ensure progress doesn't go negative
      if (progress > 1) progress = 1; // Ensure progress doesn't exceed 100%
    });
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Container(
          height: size.height / 23,
          width: size.width / 1.2,
          decoration: BoxDecoration(borderRadius: BorderRadius.circular(50)),
          child: LinearProgressIndicator(
            value: progress,
            backgroundColor: Color.fromRGBO(28, 36, 40, 0.809),
            // valueColor: AlwaysStoppedAnimation<Color>(Colors.green),
            borderRadius: BorderRadius.circular(50),
          ),
        ),
      ],
    );
  }
}
