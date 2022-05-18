import 'package:ex02_navigator_appbar_app/menu.dart';
import 'package:ex02_navigator_appbar_app/page1st.dart';
import 'package:ex02_navigator_appbar_app/page2nd.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      routes: {
        'menu' :(context) => const Menu(),
        '1st' :(context) => const Page1st(),
        '2nd' :(context) => const Page2nd(),
      },
      initialRoute: 'menu',
      debugShowCheckedModeBanner: false,
    );
  }
}


