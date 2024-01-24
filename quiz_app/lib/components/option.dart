import 'package:flutter/material.dart';

class Options extends StatelessWidget {
  final String text;
  final VoidCallback onTap;
  final bool isSelected;
  final bool isCorrect;

  const Options({
    super.key,
    required this.text,
    required this.onTap,
    required this.isSelected,
    required this.isCorrect,
  });

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    // Define the default color
    Color bgColor = Colors.amber;
    // If the option is selected, determine the color based on correctness
    if (isSelected) {
      bgColor = isCorrect ? Colors.green : Colors.red;
    }

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
              boxShadow: [
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
                  color: Color.fromRGBO(87, 47, 10, 1),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
