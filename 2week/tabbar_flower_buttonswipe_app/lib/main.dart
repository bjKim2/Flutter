import 'package:flutter/material.dart';
import 'package:tabbar_flower_buttonswipe_app/buttontap.dart';
import 'package:tabbar_flower_buttonswipe_app/home.dart';
import 'package:tabbar_flower_buttonswipe_app/swipetap.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        primarySwatch: Colors.amber
      ),
      routes: {
        '/' : (context) => const Home(),
        'button' : (context) => const buttonTap(),
        'swipe' : (context) => const swipeTap(),
      },
      initialRoute: '/',
    
    );
  }
}
