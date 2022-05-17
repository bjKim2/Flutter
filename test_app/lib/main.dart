import 'package:flutter/material.dart';
import 'dart:math';

void main() {
  runApp(const MyApp());
}

showAlertDialog(BuildContext context) {
  // set up the button
  Widget okButton = TextButton(
    child: const Text("그래"),
    onPressed: () {
      Navigator.pop(context);
    },
  );

  // set up the AlertDialog
  AlertDialog alert = AlertDialog(
    title: const Text("틀렸습니다"),
    content: const Text("시력이 안 좋군요"),
    actions: [
      okButton,
    ],
  );

  // show the dialog
  showDialog(
    context: context,
    builder: (BuildContext context) {
      return alert;
    },
  );
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _answer = Random().nextInt(25);

  int _r = Random().nextInt(215) + 20;
  int _g = Random().nextInt(215) + 20;
  int _b = Random().nextInt(215) + 20;

  int _level = 1;

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    void _newGame() {
      setState(() {
        _level++;

        _r = Random().nextInt(215) + 20;
        _g = Random().nextInt(215) + 20;
        _b = Random().nextInt(215) + 20;

        _answer = Random().nextInt(25);
      });
    }

    void _tapbtn(int idx) {
      if (idx == _answer) {
        _newGame();
      } else {
        showAlertDialog(context);
      }
    }

    return Scaffold(
      appBar: AppBar(
        title: Text('절대색감 $_level/25 레벨'),
        backgroundColor: Colors.black,
      ),
      body: GridView.count(
        crossAxisCount: 5,
        children: List.generate(25, (index) {
          return Center(
            child: InkWell(
                onTap: () => _tapbtn(index),
                child: SizedBox(
                  width: 95.0,
                  height: 95.0,
                  child: DecoratedBox(
                    decoration: _answer == index
                        ? BoxDecoration(color: Color.fromRGBO(_r, _g, _b, 10))
                        : BoxDecoration(
                            color: Color.fromRGBO(_r + 26 - _level,
                                _g + 26 - _level, _b + 26 - _level, 10)),
                  ),
                )),
          );
        }),
      ),
    );
  }
}