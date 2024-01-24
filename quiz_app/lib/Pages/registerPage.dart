import 'package:flutter/material.dart';
import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:quiz_application/AuthPage/auth_service.dart';
import 'package:quiz_application/Pages/loginPage.dart';
import 'package:quiz_application/components/customTextField.dart';

class RegisterPage extends StatelessWidget {
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController confirmPassController = TextEditingController();

  RegisterPage({super.key});

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
                    'Register Yourself',
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
            height: size.height / 7,
          ),
          Center(
            child: MyTextField(
              hint: 'E-mail',
              show: false,
              controller: emailController,
            ),
          ),
          SizedBox(
            height: size.height / 17,
          ),
          Center(
            child: MyTextField(
              hint: 'Password',
              show: true,
              controller: passwordController,
            ),
          ),
          SizedBox(
            height: size.height / 17,
          ),
          Center(
            child: MyTextField(
              hint: 'Confirm Password',
              show: true,
              controller: confirmPassController,
            ),
          ),
          SizedBox(
            height: size.height / 8,
          ),
          InkWell(
            onTap: () {
              final auth = AuthService();
              if (passwordController == confirmPassController) {
                try {
                  auth.signUpWithEmailPassword(
                    emailController.text,
                    passwordController.text,
                  );
                } catch (e) {
                  showDialog(
                    context: context,
                    builder: (context) => AlertDialog(
                      title: Text(e.toString()),
                    ),
                  );
                }
              } else {
                print("register password : " + passwordController.toString());
                print("register confirmPassword : " +
                    confirmPassController.toString());
                showDialog(
                  context: context,
                  builder: (context) => AlertDialog(
                    title: Text("Password doesn't match"),
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
                "Register",
                style: TextStyle(
                  letterSpacing: 1,
                  fontSize: size.height / 30,
                  fontWeight: FontWeight.bold,
                ),
              )),
            ),
          ),
          SizedBox(
            height: size.height / 20,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                "Do you have account? ",
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
                  print('Move to Login Page');
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => MainAuthPage()));
                },
                child: Text(
                  "Login",
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
