import 'package:flutter/material.dart';
import 'package:hello_world/const/colors.dart';
import 'package:hello_world/screen/root_screen.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();

  runApp(MaterialApp(
      theme: ThemeData(
          scaffoldBackgroundColor: backgroundColor,
          bottomNavigationBarTheme: BottomNavigationBarThemeData(
              backgroundColor: backgroundColor,
              selectedItemColor: primaryColor,
              unselectedItemColor: secondaryColor),
          fontFamily: 'Onglip', // 기본
          textTheme: TextTheme(
              headlineLarge: TextStyle(
                  color: Colors.white,
                  fontSize: 50,
                  fontWeight: FontWeight.w700,
                  fontFamily: 'LandryGothic'),
              headlineMedium: TextStyle(
                  color: Colors.white,
                  fontSize: 35,
                  fontWeight: FontWeight.w500,
                  fontFamily: 'LandryGothic'),
              bodyLarge: TextStyle(color: Colors.white, fontSize: 30))),
      home: RootScreen()));
}
