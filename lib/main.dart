import 'package:flutter/material.dart';

void main() {
  runApp(WaitingWithPiccolo());
}

class WaitingWithPiccolo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: Container(
            decoration: BoxDecoration(color: Color(0xFFd1bd86)),
            child: Row(mainAxisAlignment: MainAxisAlignment.center, children: [
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    color: Colors.white,
                    width: 300,
                    height: 100,
                    child: Center(
                        child: Text(
                      "기다려라,\n 그리고 희망을 가져라.",
                      style: TextStyle(fontSize: 16),
                    )),
                  ),
                  SizedBox(
                    height: 40,
                  ),
                  Image.asset(
                    "assets/piccolo.webp",
                    width: 200,
                  ),
                  SizedBox(
                    height: 40,
                  ),
                  CircularProgressIndicator(
                    valueColor: AlwaysStoppedAnimation(Colors.white),
                    // color: Colors.white,
                  )
                ],
              )
            ])),
      ),
    );
  }
}
