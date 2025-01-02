import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:hello_world/const/colors.dart';

class HomeScreen extends StatelessWidget {
  final int number;

  const HomeScreen({Key? key, required this.number}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Center(
          child: SizedBox(
              width: MediaQuery.of(context).size.width / 2,
              child: Image.asset("assets/img/$number.png")),
        ),
        SizedBox(
          height: 32,
        ),
        Text(
          "행운의 숫자",
          style: TextStyle(
              color: secondaryColor, fontSize: 20, fontWeight: FontWeight.w700),
        ),
        SizedBox(
          height: 12,
        ),
        Text(
          number.toString(),
          style: TextStyle(
              color: primaryColor, fontSize: 60, fontWeight: FontWeight.w200),
        )
      ],
    );
  }
}
