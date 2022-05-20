import 'dart:async';

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

        primarySwatch: Colors.grey,
      ),
      home: const MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  late String str;
  late List<String> strs;
  late String str2;
  late int str_index;

  @override
  void initState() {
    str = '대한민국';
    str2 = '';
    strs = str.split('');
    str_index = -1;
    Timer.periodic(const Duration(seconds: 1), (timer) {
      displayCharacters(str);
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('LED 광고') ,
        
      ),
      body: Center(
        child: Text(
          str2,
          style: const TextStyle(
            fontSize: 30,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    );
  }

  // --- fucntion
  String displayCharacters(String str){
    setState(() {
      
      str_index++;
      str_index = str_index >= str.length ? 0 : str_index;
      str2 = str_index == 0 ? '': str2;
      str2 += strs[str_index];
    });
    return str2;
  }

}

