import 'package:flutter/material.dart';


class pika_2page extends StatelessWidget {
  const pika_2page({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('pika-2 page'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset('images/pikachu-2.jpg'),
            OutlinedButton(
              onPressed:() => Navigator.pop(context), 
              child: const Text('menu로 가기')),
          ],
        ),
      ),
    );
  }
}