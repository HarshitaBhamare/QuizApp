import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:quiz_application/Pages/homePage.dart';
import 'package:quiz_application/Providers/optionsProvider.dart';
import 'package:quiz_application/Providers/timeManger.dart';
import 'package:quiz_application/components/incDecBar.dart';

class FinalPage extends StatelessWidget {
  const FinalPage({super.key});

  @override
  Widget build(BuildContext context) {
    final correctAnswers = context.watch<optionProvider>().correctAnswers;
    final pointcal = context.watch<TimeManager>().pointCounter;
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: Colors.deepPurple.shade200,
      appBar: AppBar(
        backgroundColor: Colors.deepPurple.shade200,
        automaticallyImplyLeading: false,
        // iconTheme: Colors.amber,
      ),
      body: Column(
        // mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SizedBox(height: size.height / 15),
          Container(
            alignment: Alignment.center,
            child: Text(
              "Score : ",
              style: TextStyle(
                  fontSize: size.height / 20,
                  fontWeight: FontWeight.bold,
                  color: Color.fromARGB(255, 27, 1, 60)),
            ),
          ),
          SizedBox(height: size.height / 40),
          BudgetSliderWidget(correctAnswers: correctAnswers),
          SizedBox(height: size.height / 10),
          Container(
            child: Text(
              "Points : $pointcal",
              style: TextStyle(
                  fontSize: size.height / 25,
                  fontWeight: FontWeight.bold,
                  color: Color.fromARGB(255, 27, 1, 60)),
            ),
          ),
          SizedBox(
            height: size.height / 9,
          ),
          InkWell(
            onTap: () async {
              Navigator.push(
                  context, MaterialPageRoute(builder: (context) => HomePage()));
            },
            child: Container(
              width: size.width / 1.7,
              height: size.height / 11,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                color: Colors.deepPurple.shade100,
                border: Border.all(
                  color: Colors.deepPurple.shade500,
                  width: 2.7,
                ),
              ),
              child: Center(
                  child: Text(
                "Home",
                style: TextStyle(
                    letterSpacing: 1,
                    fontSize: size.height / 30,
                    fontWeight: FontWeight.bold,
                    color: Color.fromARGB(255, 34, 5, 84)),
              )),
            ),
          )
        ],
      ),
    );
  }
}
