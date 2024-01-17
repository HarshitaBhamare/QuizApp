import 'package:flutter/material.dart';

class MainQuizPage extends StatefulWidget {
  const MainQuizPage({super.key});

  @override
  State<MainQuizPage> createState() => _MainQuizPageState();
}

class _MainQuizPageState extends State<MainQuizPage> {
  @override
  Widget build(BuildContext context) {
    double sheight = MediaQuery.of(context).size.height;
    double swidth = MediaQuery.of(context).size.width;
    return Scaffold(
      backgroundColor: Colors.deepPurple.shade200,
      appBar: AppBar(
        backgroundColor: Colors.deepPurple.shade200,
        centerTitle: true,
        title: Text(
          "Quiz Page",
          style: TextStyle(
            letterSpacing: 1,
            // color: Colors.white,
            fontWeight: FontWeight.w800,
            fontSize: sheight / 30,
          ),
        ),
      ),
      body: Column(
        children: [
          Container(
            width: swidth / 1.1,
            height: sheight / 10,
            decoration: BoxDecoration(
                color: Colors.deepPurple.shade100,
                borderRadius: BorderRadius.circular(10)),
          ),
          SizedBox(
            height: sheight / 50,
          ),
          Center(
            child: Container(
              width: swidth / 1.1,
              height: sheight / 1.37,
              decoration: BoxDecoration(
                  color: Colors.deepPurple.shade100,
                  borderRadius: BorderRadius.circular(10)),
              child: Column(
                children: [
                  SizedBox(
                    height: sheight / 25,
                  ),
                  Container(
                    width: swidth / 1.3,
                    height: sheight / 3.5,
                    decoration: BoxDecoration(
                        color: Colors.pink,
                        boxShadow: [
                          BoxShadow(
                            color: Colors.black,
                            offset: Offset(0, 0),
                            spreadRadius: 4,
                          ),
                        ],
                        borderRadius: BorderRadius.circular(20)),
                    child: Center(
                      child: Container(
                        width: swidth / 1.4,
                        height: sheight / 6,
                        child: Text(
                          "Q. What is Flutter?",
                          style: TextStyle(fontSize: sheight / 30),
                        ),
                        // color: Colors.white,
                      ),
                    ),
                  ),
                  SizedBox(
                    height: sheight / 25,
                  ),
                  Container(
                    width: swidth / 1.3,
                    height: sheight / 15,
                    decoration: BoxDecoration(
                        color: Colors.amber,
                        boxShadow: [
                          BoxShadow(
                            color: Colors.black,
                            offset: Offset(0, 0),
                            spreadRadius: 4,
                          ),
                        ],
                        borderRadius: BorderRadius.circular(20)),
                    child: Row(
                      children: [
                        SizedBox(
                          width: swidth / 40,
                        ),
                        Text("A.",
                            style: TextStyle(
                                fontSize: sheight / 30,
                                fontWeight: FontWeight.bold)),
                      ],
                    ),
                  ),
                  SizedBox(
                    height: sheight / 50,
                  ),
                  Container(
                    width: swidth / 1.3,
                    height: sheight / 15,
                    decoration: BoxDecoration(
                        color: Colors.amber,
                        boxShadow: [
                          BoxShadow(
                            color: Colors.black,
                            offset: Offset(0, 0),
                            spreadRadius: 4,
                          ),
                        ],
                        borderRadius: BorderRadius.circular(15)),
                    child: Row(
                      children: [
                        SizedBox(
                          width: swidth / 40,
                        ),
                        Text("B.",
                            style: TextStyle(
                                fontSize: sheight / 30,
                                fontWeight: FontWeight.bold)),
                      ],
                    ),
                  ),
                  SizedBox(
                    height: sheight / 50,
                  ),
                  Container(
                    width: swidth / 1.3,
                    height: sheight / 15,
                    decoration: BoxDecoration(
                        color: Colors.amber,
                        boxShadow: [
                          BoxShadow(
                            color: Colors.black,
                            offset: Offset(0, 0),
                            spreadRadius: 4,
                          ),
                        ],
                        borderRadius: BorderRadius.circular(15)),
                    child: Row(
                      children: [
                        SizedBox(
                          width: swidth / 40,
                        ),
                        Text("C.",
                            style: TextStyle(
                                fontSize: sheight / 30,
                                fontWeight: FontWeight.bold)),
                      ],
                    ),
                  ),
                  SizedBox(
                    height: sheight / 50,
                  ),
                  Container(
                    width: swidth / 1.3,
                    height: sheight / 15,
                    decoration: BoxDecoration(
                        color: Colors.amber,
                        boxShadow: [
                          BoxShadow(
                            color: Colors.black,
                            offset: Offset(0, 0),
                            spreadRadius: 4,
                          ),
                        ],
                        borderRadius: BorderRadius.circular(15)),
                    child: Row(
                      children: [
                        SizedBox(
                          width: swidth / 40,
                        ),
                        Text("D.",
                            style: TextStyle(
                                fontSize: sheight / 30,
                                fontWeight: FontWeight.bold)),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
