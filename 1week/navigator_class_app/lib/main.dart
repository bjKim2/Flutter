import 'package:flutter/material.dart';
import 'package:navigator_class_app/screen.dart';
import 'package:navigator_class_app/screen1st.dart';
import 'package:navigator_class_app/screen2nd.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      routes: {
        '/' : (context) => const Screen(),
        '/1st' :(context) => const Screen1st(),
        '/2nd' : (context) {
          return const Screen2nd();
        },
      },
      initialRoute: '/', // 초기화면 라우트 정보 
      debugShowCheckedModeBanner: false,
    ); //이런 것을 라우팅 테이블이라고 함.
  }
}
