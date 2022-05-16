import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.red,
      ),
      home: const MyHomePage(),
      debugShowCheckedModeBanner: false,
    );
  }
}

class MyHomePage extends StatelessWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // backgroundColor: Colors.purple,
      appBar: AppBar(
        title: const Text(
          // const는 한번 들어가면 안바뀐다는말
          '대한민국',
        ),
        backgroundColor: Colors.amberAccent,
        foregroundColor: Colors.black,
      ),
      body:  Center(
        child:  Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: const [
            Text(
              '유비',
            ),
            SizedBox(
              height: 50,
            ),
            Text(
              '관우',
            ),
            SizedBox(
              height: 50,
            ),
            Text(
              '장비',
            ),
          ],
        ),
      ),
    );
  }
}