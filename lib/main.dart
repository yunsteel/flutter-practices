import 'package:flutter/material.dart';
import 'package:hello_world/screen/home_screen.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();

  runApp(MaterialApp(
    home: HomeScreen(),
  ));
}
