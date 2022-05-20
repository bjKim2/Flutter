

import 'package:flutter/material.dart';

class Page2nd extends StatelessWidget {
  const Page2nd({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Second Page'),
        backgroundColor: Colors.red,
      ),
      body: const Center(
        child: Text('2번쨰 페이지 입니다.'),
      ),
    );   
  }
}

