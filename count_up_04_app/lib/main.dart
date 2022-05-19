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

class _MyHomePageState extends State<MyHomePage> {
  
  // ---
  late int count;
  late DateTime now;
  late Timer _timer;

  @override
  void initState() {

    count = 0;
    now = DateTime.now();
    super.initState();
  }
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Count Up'),
        
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text('현재 클릭수는 $count 입니다.\n 현재 시간은 $now'),
            const SizedBox(
              height: 50,
            ),
            // body 안의 플로팅 액션버튼은 스크롤하면 같이 움직임.
            // body 밖의 floatingactionibutton은 스크롤 해도 안움직임
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                FloatingActionButton(
                  onPressed: (){
                    setState(() {
                      count++;

                    });
                  },
                  child: const Icon(Icons.add),
                ),
                SizedBox(
                  width: 30,
                ),
                FloatingActionButton(
                  onPressed: (){
                    setState(() {
                      count = count > 0 ? count-1 : count;
                    });
                  },
                  backgroundColor: Colors.red,
                  child: const Icon(Icons.remove),
                ),              ],
            ),


          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          setState(() {
            count++;
            now = DateTime.now();
          });
        },
        child: const Icon(Icons.add),
      ),

    );
  }
}