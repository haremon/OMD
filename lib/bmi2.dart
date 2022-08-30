import 'package:flutter/material.dart';
import 'main4.dart';
import 'main5.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class BMICalculator2 extends StatelessWidget {
  final String mail;
  BMICalculator2({required this.mail});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData.dark().copyWith(
        // primaryColor: Color(0xFF6722AF),
        scaffoldBackgroundColor: Color(0xFF0A0E21),
        appBarTheme: AppBarTheme(
          color: Color(0xFF0A0E21),
        ),
      ),
      home: InputPage2(mail: mail),
    );
  }
}
