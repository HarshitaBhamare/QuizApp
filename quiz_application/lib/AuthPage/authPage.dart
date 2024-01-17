import 'package:flutter/material.dart';
import 'package:animated_text_kit/animated_text_kit.dart';

class MainAuthPage extends StatefulWidget {
  const MainAuthPage({super.key});

  @override
  State<MainAuthPage> createState() => _MainAuthPageState();
}

class _MainAuthPageState extends State<MainAuthPage> {
  @override
  Widget build(BuildContext context) {
    double sheight = MediaQuery.of(context).size.height;
    double swidth = MediaQuery.of(context).size.width;
    return Scaffold(
      backgroundColor: Colors.deepPurple.shade200,
      body: SingleChildScrollView(
        child: Column(children: [
          SizedBox(
            height: sheight / 13,
          ),
          SizedBox(
            // width: 250.0,
            child: DefaultTextStyle(
              style: const TextStyle(
                fontSize: 30.0,
              ),
              child: AnimatedTextKit(
                repeatForever: true,
                isRepeatingAnimation: true,
                animatedTexts: [
                  TypewriterAnimatedText(
                    'Sign In To Your Account',
                    textStyle: TextStyle(
                      color: Colors.black,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
            ),
          ),
          SizedBox(
            height: sheight / 25,
          ),
          Center(
            child: Container(
              width: swidth / 1.3,
              height: sheight / 3,
              decoration: BoxDecoration(
                  color: Colors.white,
                  border: Border.all(
                    color: Colors.deepPurple.shade500,
                    width: 2.7,
                  ),
                  borderRadius: BorderRadius.circular(12)),
              child: Image.asset(
                'assets/images/logo.png',
                fit: BoxFit.fitHeight,
              ),
            ),
          ),
          SizedBox(
            height: sheight / 15,
          ),
          Container(
            width: swidth / 1.3,
            height: sheight / 15,
            decoration: BoxDecoration(
              border: Border.all(
                color: Colors.deepPurple.shade500,
                width: 2,
              ),
              borderRadius: BorderRadius.circular(13),
              color: Colors.deepPurple.shade100,
            ),
            child: TextField(
              decoration: InputDecoration(
                label: Text(
                  'E-mail',
                  style: TextStyle(color: Colors.black),
                ),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
              ),
            ),
          ),
          SizedBox(
            height: sheight / 30,
          ),
          Container(
            width: swidth / 1.3,
            height: sheight / 15,
            decoration: BoxDecoration(
              border: Border.all(
                color: Colors.deepPurple.shade500,
                width: 2,
              ),
              borderRadius: BorderRadius.circular(13),
              color: Colors.deepPurple.shade100,
            ),
            child: TextField(
              decoration: InputDecoration(
                label: Text(
                  'Password',
                  style: TextStyle(color: Colors.black),
                ),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
              ),
            ),
          ),
          SizedBox(
            height: sheight / 13,
          ),
          InkWell(
            onTap: () {
              print("Login button is touched");
            },
            child: Container(
              width: swidth / 1.7,
              height: sheight / 11,
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
                "Login",
                style: TextStyle(
                  letterSpacing: 1,
                  fontSize: sheight / 30,
                  fontWeight: FontWeight.bold,
                ),
              )),
            ),
          ),
          SizedBox(
            height: sheight / 40,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                "Don't you have account? ",
                style: TextStyle(
                  fontSize: sheight / 50,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(
                width: swidth / 45,
              ),
              InkWell(
                onTap: () {
                  print('Move to Register Page');
                },
                child: Text(
                  "Register",
                  style: TextStyle(
                    fontSize: sheight / 50,
                    fontWeight: FontWeight.bold,
                    color: Colors.red.shade900,
                  ),
                ),
              ),
            ],
          )
        ]),
      ),
    );
  }
}
