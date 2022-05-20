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

        primarySwatch: Colors.blue,
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
      appBar: AppBar(
        
        title: Text('Text Exercise 01'),
        centerTitle: false,
        backgroundColor: Colors.green[400],
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: const [
            Divider(
              height: 30,
              color: Colors.grey,
              thickness: 2,
            ),
            Text(
              '유비\n관우\n장비',
            ),
            Divider(
              height: 30,
              color: Colors.grey,
              thickness: 2,
            ),
            Text(
              '조조\n여포\n동탁',
              style: TextStyle(
                color: Colors.blue,
                fontSize: 28,
                fontWeight: FontWeight.bold,
                letterSpacing: 5,
              ),
            ),
            Divider(
              height: 30,
              color: Colors.grey,
              thickness: 2,
            ),
          ]
        )
      ,),

    );
  }
}