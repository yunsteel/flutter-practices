import 'package:flutter/material.dart';
import 'package:hello_world/screen/home_screen.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();

  runApp(MaterialApp(
      theme: ThemeData(
          fontFamily: 'Onglip', // 기본
          textTheme: TextTheme(
              headlineLarge: TextStyle(
                  color: Colors.white,
                  fontSize: 60,
                  fontWeight: FontWeight.w700,
                  fontFamily: 'LandryGothic'),
              headlineMedium: TextStyle(
                  color: Colors.white,
                  fontSize: 40,
                  fontWeight: FontWeight.w500,
                  fontFamily: 'LandryGothic'),
              bodyLarge: TextStyle(color: Colors.white, fontSize: 30))),
      home: HomeScreen()));
}
