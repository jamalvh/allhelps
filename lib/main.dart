import 'package:allhelps/alert.dart';
import 'package:allhelps/helps.dart';
import 'package:allhelps/home.dart';
import 'package:allhelps/my.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      // Change initialRoute to your team's page during development
      initialRoute: '/',
      // Update this theme to unify basic color palette/font across project
      theme: ThemeData(
        scaffoldBackgroundColor: Colors.white,
      ),
      routes: {
        '/': (context) => const MyHomePage(),
        '/helps': (context) => const HelpsPage(),
        '/alert': (context) => const AlertPage(),
        '/my': (context) => const MyPage(),
      },
    );
  }
}
