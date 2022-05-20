

import 'package:flutter/material.dart';
import 'package:pikachu_page_app/pages/pika_1.dart';
import 'package:pikachu_page_app/pages/pika_2.dart';

class Menu extends StatelessWidget {
  const Menu({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('menu page'),
        elevation: 10,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
              onPressed: (){
                Navigator.push(context, MaterialPageRoute(builder: (context) => const pika_1page(),));
              }, 
              child: const Text('pika-1 page')),
            ElevatedButton(
              onPressed: (){
                Navigator.push(context, MaterialPageRoute(builder: (context) => const pika_2page(),));
              }, 
              child: const Text('pika-2 page')),
          ],
        ),
      ),
    );
  }
}