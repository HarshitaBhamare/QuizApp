import 'package:flutter/material.dart';

class MyTextField extends StatelessWidget {
  final String hint;
  final bool show;
  final TextEditingController controller;
  MyTextField({
    super.key,
    required this.hint,
    required this.show,
    required this.controller,
  });

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: size.width / 10),
      child: TextField(
          obscureText: show,
          controller: controller,
          decoration: InputDecoration(
            // disabledBorder: InputBorder.none,
            label: Text(
              hint,
              style: TextStyle(color: Colors.black),
            ),
            enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10),
                borderSide: BorderSide(
                  color: Colors.deepPurple.shade500,
                  width: 3,
                )),
            focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10),
                borderSide: BorderSide(
                  color: Colors.deepPurple.shade500,
                  width: 2,
                )),
            fillColor: Colors.deepPurple.shade100,
            filled: true,
          )),
    );
  }
}
