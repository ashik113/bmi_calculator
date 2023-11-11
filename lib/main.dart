import 'package:bmi_calculator/constants.dart';
import 'package:bmi_calculator/views/bmi_input_page.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData.dark().copyWith(
        appBarTheme: const AppBarTheme(
          color: kAppBarColor,
        ),
        primaryColor: const Color(0xFF0A0E21),
        scaffoldBackgroundColor: kScaffoldBackgroundColor,
      ),
      home: BMIInputPage(),
      debugShowCheckedModeBanner: false,
    );
  }
}
