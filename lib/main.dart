import 'package:flutter/material.dart';
import 'package:hello_world/screen/home_screen/home_screen.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await dotenv.load();
  await Supabase.initialize(
      url: dotenv.env["SUPABASE_URL"]!,
      anonKey: dotenv.env['SUPABASE_ANON_KEY']!);

  runApp(MainApp());
}

class MainApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(home: HomeScreen());
  }
}
