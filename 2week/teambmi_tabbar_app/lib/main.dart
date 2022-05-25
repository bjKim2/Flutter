import 'package:flutter/material.dart';
import 'package:teambmi_tabbar_app/ah/bmi_result.dart';
import 'package:teambmi_tabbar_app/ah/screen.dart';
import 'package:teambmi_tabbar_app/eon/bmiinsert.dart';
import 'package:teambmi_tabbar_app/eon/bmiresult.dart';
import 'package:teambmi_tabbar_app/eun%20/main.dart';
import 'package:teambmi_tabbar_app/home.dart';
import 'package:teambmi_tabbar_app/kweon/calPage.dart';
import 'package:teambmi_tabbar_app/kweon/resultPage.dart';
import 'package:teambmi_tabbar_app/kweon/startPage.dart';
import 'package:teambmi_tabbar_app/sung/first.dart';
import 'package:teambmi_tabbar_app/sung/second.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      routes: {
        //kte
        '/' :(context) => const Home(),
        'bmiinsert' :(context) => const BmiInsert(),
        'bmiresult' :(context) => const BmiResult(),
        //kw
        "startPage" :(context) => const StartPage(),
        "calPage" :(context) => const CalPage(),
        "resultPage" :(context) => const ResultPage(),
        //ah
        '/ah': (context) => const First(),
        '/second': (context) => const Secondah(),
        //sung
        '/sung' :(context) => const FirstPage(),
        '/2' :(context) => const SecondPage(),
        //eun
        '/eun' :(context) => const eun(),
                
      },
      initialRoute: '/',
    );
  }
}
