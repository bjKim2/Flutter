import 'dart:async';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';
import 'package:webview_tabbar_app/first.dart';

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
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> with SingleTickerProviderStateMixin{
  late TabController controller;
  late String siteName1;
  late String siteName2;
  late String siteName3;



  
  @override
  void initState() {
    super.initState();
    controller = TabController(length: 3, vsync: this);

    siteName1 = 'www.naver.com';
    siteName1 = 'www.google.com';
    siteName1 = 'www.daum.net';

  }


  @override
  Widget build(BuildContext context) {


    return Scaffold(
      appBar: AppBar(
        title: const Text('WebView - Tabbar'),
      ),
      body: TabBarView(
        controller: controller,
        children: const [
          FirstPage(siteName: 'm.naver.com'),
          FirstPage(siteName: 'www.google.com'),
          FirstPage(siteName: 'www.daum.net'),
        ],
      ),
      bottomNavigationBar: Container(
        color: Colors.white,
        child: TabBar(
          labelColor: Colors.blueAccent,
          
          controller: controller,
          tabs: [
            // 실패한 방법
            // Tab(
            //   icon: FittedBox(
            //     fit: BoxFit.contain,
            //     alignment: Alignment.center,
            //     child: ImageIcon(
            //       AssetImage('images/naverlogo.png'),
            //       ),
            //   ),
            //   text: 'naver',
            // ),
            Tab(
              icon: Image.asset('images/naverlogo.png',
                width: 40,
                height: 40,
              ),
              text: 'naver',
            ),
            Tab(
              icon: Image.asset('images/googlelogo.jpeg',
                width: 40,
                height: 40,
              ),
              text: 'google',
            ),
            Tab(
              icon: Image.asset('images/daumlogo.jpeg',
                width: 40,
                height: 40,
              ),
              text: 'daum',
            ),
          ]
        ),
      ),
    );   
  }
}
