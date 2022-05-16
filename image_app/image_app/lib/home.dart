import 'package:flutter/material.dart';

class Home extends StatelessWidget {
  const Home({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.amberAccent,
      appBar: AppBar(
        title: const Text('Image Test'),
      ),
      body: Center(
        child: Image.asset(
          'images/smile.png',
          width: 200,
          height: 200,
        ),
      ),
    );
  }
}