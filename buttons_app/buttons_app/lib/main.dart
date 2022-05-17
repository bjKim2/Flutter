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
      home: const Home(),
      debugShowCheckedModeBanner: false,
    );
  }
}

class Home extends StatelessWidget {
  const Home({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Buttons'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextButton(  // ()=> fat Arrow는 함수가 한줄로 끊날 떄 쓰는 것 보통 (){} 쓰자 
              onPressed: () {
                print('Text Button');
              },
              onLongPress: (){
                print("Long pressed text button"); // App store 넣을 때 프린트 쓰면 리젝트
              },
              style: TextButton.styleFrom(
                primary: Colors.red,
              ), 
              child: const Text(
                'Text Button',
                style: TextStyle(
                  fontSize: 20,
                  //color: Colors.blue,
                ),
              ),
            ),
            ElevatedButton(
              onPressed: (){

              }, 
              style: ElevatedButton.styleFrom(
                primary: Colors.orangeAccent,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20)
                )
              ),
              child: const Text(
                'Elevated button',
              ), 
            ),
            OutlinedButton(
              onPressed: (){

              },
              style: OutlinedButton.styleFrom(
                primary: Colors.greenAccent,
                side: const BorderSide(
                  color: Colors.black,
                  width: 5.0,
                )
              ), 
              child: const Text(
                'Outlined button',
                style: TextStyle(

                  fontSize: 20,
                  color: Colors.black38,
                ),
              )
            ),
            TextButton.icon(
              onPressed: (){

              },
              icon: const Icon(
                Icons.home,
                size: 30,
              ), 
              label: const Text('Go to home'),
              style: TextButton.styleFrom(
                primary: Colors.purple,
              ),
            ),
            ElevatedButton.icon(
              onPressed: (){

              }, 
              icon: const Icon(
                Icons.home,
                size: 20,
                color: Colors.pink,
              ), 
              label:const Text(
                'Go to home',
                style: TextStyle(
                  color: Colors.pink,
                ),

              ),
              style: ElevatedButton.styleFrom(
                primary: Colors.pink[100],
                minimumSize: const Size(200, 40),
              ),
            ),
            OutlinedButton.icon(
              onPressed: (){

              }, 
              icon: const Icon(
                Icons.home,
                color: Colors.red,
              ), 
              label: const Text('Go to home'),
              style: OutlinedButton.styleFrom(
                primary : Colors.black,
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: TextButton(
                    onPressed: (){
                    }, 
                    child: const Text('TextButton'),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: ElevatedButton(
                    onPressed: (){
                    }, 
                    child: const Text('ElevatedButton'),
                  ),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
