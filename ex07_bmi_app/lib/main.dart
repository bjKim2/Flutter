import 'package:ex07_bmi_app/bmiresult.dart';
import 'package:ex07_bmi_app/home.dart';
import 'package:ex07_bmi_app/bmiinsert.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {

    return MaterialApp(
      routes: {
        '/' :(context) => const Home(),
        'bmiinsert' :(context) => const BmiInsert(),
        'bmiresult' :(context) => const BmiResult(),
      },
      debugShowCheckedModeBanner: false,
    );
  }
}
