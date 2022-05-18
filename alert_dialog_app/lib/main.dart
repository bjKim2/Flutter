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
        '/' :(context) => const Home(),
        
      },
      initialRoute: '/',
    );
  }
}

class Home extends StatelessWidget {
  const Home({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Alert Dialog with Gesture'),
      ),
      body: Center(
        child: GestureDetector(
          onTap: () {
            return _showDialog(context);  
          },
          child: Text('Hello World'),

        ),
      ),
    );
  }

  // --- Functions

  _showDialog(BuildContext context){
    showDialog(
      context: context, 
      barrierDismissible: false, // user must tap button!
      builder: (BuildContext ctx){
        return AlertDialog(
          title: const Text('Alert Title'),
          content: const Text('Hello World를 Touch했습니다.'),
          actions: [
            Center(
              child: TextButton(
                onPressed: () {
                  Navigator.of(ctx).pop();
                }, 
                child:const Text('종료'),
              ),
            ),
          ],          
        );
      });
  }
} // End
