import 'dart:async';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:quiz_application/Providers/timeManger.dart';

class TimerClock extends StatefulWidget {
  const TimerClock({super.key});

  @override
  State<TimerClock> createState() => _TimerClockState();
}

class _TimerClockState extends State<TimerClock> {
  @override
  Widget build(BuildContext context) {
    int countPointer = context.watch<TimeManager>().pointCounter;
    Size size = MediaQuery.of(context).size;
    final timer = context.watch<TimeManager>().time;
    var fsize = size.height / 20;
    Color timercolor = Color.fromARGB(255, 34, 5, 84);
    if (timer <= 5) {
      timercolor = Colors.red;
      fsize = size.height / 18;
    } else {
      Color.fromARGB(255, 34, 5, 84);
    }

    return Row(
      children: [
        SizedBox(width: size.width / 2.5),
        Container(
          width: 70,
          // color: Colors.amber,
          child: Text(
            timer.toString(),
            style: TextStyle(
              color: timercolor,
              fontSize: fsize,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
        SizedBox(width: size.width / 20),
        SizedBox(
          height: size.height / 10,
          child: Container(
              width: 100,
              // color: Colors.amber,
              child: Column(
                children: [
                  Text(
                    "points:",
                    style: TextStyle(
                        color: Color.fromARGB(255, 34, 5, 84),
                        fontSize: size.height / 40),
                  ),
                  Text(
                    countPointer.toString(),
                    style: TextStyle(
                        color: Color.fromARGB(255, 34, 5, 84),
                        fontSize: size.height / 40),
                  ),
                ],
              )),
        )
      ],
    );
  }
}
