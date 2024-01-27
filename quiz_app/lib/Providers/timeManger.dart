import 'dart:async';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:quiz_application/Providers/QuestionManagerCount.dart';
import 'package:quiz_application/Providers/optionsProvider.dart';

class TimeManager with ChangeNotifier {
  int pointCounter = 0;
  int time = 15;
  Timer? _timer;
  void startTimer(BuildContext context) {
    _timer = Timer.periodic(Duration(seconds: 1), (timer) {
      if (time > 0) {
        time--;
        notifyListeners();
      } else {
        // Stop the timer when it's no longer needed
        stopTimer();
        Provider.of<optionProvider>(context, listen: false).ResetFunc();
        Provider.of<TimeManager>(context, listen: false).ResetTime();
        Provider.of<QuestionManager>(context, listen: false)
            .selectRandomQuestion(context);
        Provider.of<TimeManager>(context, listen: false).startTimer(context);
      }
    });
  }

// Function to stop the timer
  void stopTimer() {
    if (_timer != null) {
      _timer!.cancel();
      _timer = null;
    }
  }

  void ResetTime() {
    time = 15;
    notifyListeners();
  }

  void CalculatePoint() {
    if (time >= 10) {
      pointCounter += 10;
    } else if (time >= 5) {
      pointCounter += 5;
    } else if (time >= 3) {
      pointCounter += 5;
    } else if (time >= 0 && time <= 2) {
      pointCounter += 2;
    } else {
      pointCounter -= 2;
    }
    notifyListeners();
  }
}
