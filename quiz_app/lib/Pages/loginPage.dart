import 'package:flutter/material.dart';
import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:quiz_application/AuthPage/auth_service.dart';
import 'package:quiz_application/Pages/registerPage.dart';
import 'package:quiz_application/components/customTextField.dart';

class MainAuthPage extends StatelessWidget {
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  MainAuthPage({super.key});

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: Colors.deepPurple.shade200,
      body: SingleChildScrollView(
        child: Column(children: [
          SizedBox(
            height: size.height / 13,
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
            height: size.height / 25,
          ),
          Center(
            child: Container(
              width: size.width / 1.3,
              height: size.height / 3,
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
            height: size.height / 15,
          ),
          MyTextField(
            hint: 'E-mail',
            show: false,
            controller: emailController,
          ),
          SizedBox(
            height: size.height / 30,
          ),
          MyTextField(
            hint: 'Password',
            show: true,
            controller: passwordController,
          ),
          SizedBox(
            height: size.height / 13,
          ),
          InkWell(
            onTap: () async {
              final authService = AuthService();
              try {
                await authService.signInWithEmailPassword(
                  emailController.text,
                  passwordController.text,
                );
              } catch (e) {
                print("login email: " + emailController.toString());
                print("login oassword : " + passwordController.toString());
                showDialog(
                  context: context,
                  builder: (context) => AlertDialog(
                    title: Text(e.toString()),
                  ),
                );
              }
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
                "Login",
                style: TextStyle(
                  letterSpacing: 1,
                  fontSize: size.height / 30,
                  fontWeight: FontWeight.bold,
                ),
              )),
            ),
          ),
          SizedBox(
            height: size.height / 40,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                "Don't you have account? ",
                style: TextStyle(
                  fontSize: size.height / 50,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(
                width: size.width / 45,
              ),
              InkWell(
                onTap: () {
                  print('Move to Register Page');
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => RegisterPage()));
                  // Navigator.of(context).
                },
                child: Text(
                  "Register",
                  style: TextStyle(
                    fontSize: size.height / 50,
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
