import 'package:flutter/material.dart';
import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:quiz_application/AuthPage/auth_service.dart';
import 'package:quiz_application/Pages/quizPage.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  bool showQuiz = false;
  bool showGame = false;
  bool showFinal = false; // New flag for showing the final state
  void logout() {
    final auth = AuthService();
    auth.signOut();
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    double fontSize = size.width / 5; // Adjust font size based on screen width
    Duration animationSpeed = Duration(milliseconds: 700);
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.deepPurple.shade200,
        automaticallyImplyLeading: false,
        actions: [
          IconButton(
              onPressed: logout,
              icon: Icon(
                Icons.logout,
                color: Colors.black,
              ))
        ],
      ),
      backgroundColor: Colors.deepPurple.shade200,
      body: Column(
        children: [
          Container(
            alignment: Alignment.center,
            // color: Colors.black,
            height: size.height / 1.8,
            child: Column(
              // mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SizedBox(
                    // height: size.height / 10,
                    ),
                if (!showFinal) // Hide this part when showing the final state
                  AnimatedTextKit(
                    animatedTexts: [
                      ScaleAnimatedText(
                        'THE',
                        textStyle: GoogleFonts.merriweather(
                          color: Color.fromARGB(255, 34, 5, 84),
                          fontSize: fontSize,
                          fontWeight: FontWeight.w700,
                        ),
                        duration: animationSpeed,
                      ),
                    ],
                    isRepeatingAnimation: false,
                    onFinished: () => setState(() => showQuiz = true),
                  ),
                if (showQuiz && !showFinal)
                  AnimatedTextKit(
                    animatedTexts: [
                      ScaleAnimatedText(
                        'QUIZ',
                        textStyle: GoogleFonts.merriweather(
                          color: Color.fromARGB(255, 34, 5, 84),
                          fontSize: fontSize,
                          fontWeight: FontWeight.w700,
                        ),
                        duration: animationSpeed,
                      ),
                    ],
                    isRepeatingAnimation: false,
                    onFinished: () => setState(() => showGame = true),
                  ),
                if (showGame && !showFinal)
                  AnimatedTextKit(
                    animatedTexts: [
                      ScaleAnimatedText(
                        'GAME',
                        textStyle: GoogleFonts.merriweather(
                          color: Color.fromARGB(255, 34, 5, 84),
                          fontSize: fontSize,
                          fontWeight: FontWeight.w700,
                        ),
                        duration: animationSpeed,
                      ),
                    ],
                    isRepeatingAnimation: false,
                    onFinished: () => setState(() => showFinal = true),
                  ),
                if (showFinal) // New section to show all words at the end
                  Column(
                    children: [
                      Text(
                        'THE',
                        style: GoogleFonts.merriweather(
                          color: Color.fromARGB(255, 34, 5, 84),
                          fontSize: fontSize,
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                      Text(
                        'QUIZ',
                        style: GoogleFonts.merriweather(
                          color: Color.fromARGB(255, 34, 5, 84),
                          fontSize: fontSize,
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                      Text(
                        'GAME',
                        style: GoogleFonts.merriweather(
                          color: Color.fromARGB(255, 34, 5, 84),
                          fontSize: fontSize,
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                    ],
                  ),
              ],
            ),
          ),
          SizedBox(
            height: size.height / 7,
          ),
          Container(
            child: Text(
              "Let's Play a Game",
              style: TextStyle(
                color: Color.fromARGB(255, 34, 5, 84),
                fontSize: fontSize / 4,
                fontWeight: FontWeight.w700,
              ),
            ),
          ),
          InkWell(
            onTap: () {
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => MainQuizPage()));
            },
            child: Container(
              width: size.width / 1.7,
              height: size.height / 11,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                color: Colors.deepPurple.shade100,
                border: Border.all(
                  // width: .7,
                  color: Colors.deepPurple.shade500,
                  width: 2.7,
                ),
              ),
              child: Center(
                  child: Text(
                "Start",
                style: TextStyle(
                  letterSpacing: 1,
                  fontSize: size.height / 30,
                  fontWeight: FontWeight.bold,
                  color: Color.fromARGB(255, 34, 5, 84),
                ),
              )),
            ),
          ),
        ],
      ),
    );
  }
}
