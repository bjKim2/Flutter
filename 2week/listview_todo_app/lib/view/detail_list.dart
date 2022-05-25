import 'package:flutter/material.dart';
import 'package:listview_todo_app/model/message.dart';


class DetailList extends StatefulWidget {
  const DetailList({Key? key}) : super(key: key);

  @override
  State<DetailList> createState() => _DetailListState();
}

class _DetailListState extends State<DetailList> {
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      appBar: AppBar(
        title: Text(Message.workList),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Image.asset(Message.imagePath),
            ),
          ],
        )
      ),
    );
  }
}