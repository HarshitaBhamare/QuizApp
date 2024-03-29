import 'package:flutter/material.dart';
import 'package:quiz_application/Pages/homePage.dart';
import 'package:quiz_application/Pages/loginPage.dart';
import 'package:quiz_application/Pages/registerPage.dart';

class LoginOrRegister extends StatefulWidget {
  const LoginOrRegister({super.key});

  @override
  State<LoginOrRegister> createState() => _LoginOrRegisterState();
}

class _LoginOrRegisterState extends State<LoginOrRegister> {
  bool showLoginPage = true;
  void togglePages() {
    setState(() {
      showLoginPage = !showLoginPage;
    });
  }

  @override
  Widget build(BuildContext context) {
    if (showLoginPage) {
      return HomePage();
    } else {
      return RegisterPage();
    }
  }
}
