import 'package:flutter/material.dart';
import 'package:quiz_application/Providers/timeManger.dart';
// import 'package:provider/provider.dart';
import 'package:quiz_application/components/option.dart';
import 'package:provider/provider.dart';

class optionProvider with ChangeNotifier {
  List<Options> myOptions = []; // defined....
  int correctIndx = -1; // defined....
  int selectedIndex = -1; // undefined...
  static String? isSelected; // Paris...defined
  int correctAnswers = 0;
  bool isAnswered = false;
  void AddOptions(Options options, int index) {
    if (options.isCorrect) {
      // print("i found the correct Index : " + index.toString());
      correctIndx = index;
    }
    myOptions.add(options);
    // print("Added Element to the myOptions : " +
    //     myOptions.length.toString() +
    //     " Correct Index : " +
    //     correctIndx.toString());
  }

  void CheckAnswer(BuildContext context) {
    if (correctIndx < 0) {
      print("correctIndex not Set yet");
      return;
    }
    if (isAnswered) {
      print("I have Already Answered");
      return;
    }
    print("Checking the Correct Answer");
    for (var element in myOptions) {
      if (element.text == isSelected) {
        selectedIndex = element.index;
        element.isSelected = true;
      }
    }
    if (myOptions[correctIndx].text == isSelected) {
      correctAnswers++;
      myOptions[correctIndx].isCorrect = true;
      Provider.of<TimeManager>(context, listen: false).CalculatePoint();
    } else {
      for (var element in myOptions) {
        if (element.text == isSelected) {
          element.isCorrect = false;
        }
        print("isSelected : ${element.isSelected}");
      }
    }
    isAnswered = true;
    notifyListeners();
  }

  void ResetFunc() {
    for (var element in myOptions) {
      element.isSelected = false;
    }
    myOptions.clear();
    correctIndx = -1;
    selectedIndex = -1;
    isSelected = null;
    isAnswered = false;
    notifyListeners();
  }

  // int getCorrectIndex() {
  //   // notifyListeners();
  //   return correctIndx;
  // }
}
