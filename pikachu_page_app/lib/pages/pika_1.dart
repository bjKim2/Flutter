import 'package:flutter/material.dart';


class pika_1page extends StatelessWidget {
  const pika_1page({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('pika-1 page'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset('images/pikachu-1.jpg'),
            TextButton.icon(
              style: TextButton.styleFrom(
                minimumSize: const Size(200,100),
              ),
              onPressed: () => Navigator.pop(context), 
              icon: Icon(
                Icons.abc,
                size: 50,
              ), 
              label: const Text('Menu로 가기',
                style: TextStyle(
                  fontSize: 30,
                ),
                
              ))
          ],
        ),
      ),
    );
  }
}