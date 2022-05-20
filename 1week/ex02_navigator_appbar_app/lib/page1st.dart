import 'package:flutter/material.dart';

class Page1st extends StatelessWidget {
  const Page1st({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Send Mail') ,
        backgroundColor: Colors.green,
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: const [
          SizedBox(
            height: 30,
          ),
          Text('유비에게 보낸 메일'),
          Text('관우에게 보낸 메일'),
          Text('장비에게 보낸 메일'),

        ],
      ),
    );
  }
}