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

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  // Property(Field)
  late String _buttonState;
  late String _buttonComment;
  late Color _buttonColor;

  @override
  void initState() {
    _buttonState = 'OFF';
    _buttonComment = '버튼을 누르세요';
    _buttonColor = Colors.red;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Flut ter Life Cycle'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
              onPressed: () {
                _onClick();
              }, 
              style: ButtonStyle(
                backgroundColor: MaterialStateProperty.all(_buttonColor)
              ),
              child: Text(_buttonComment),
            ),
            const SizedBox(
              height: 50,
            ),
            Text("버튼 상태 : $_buttonState"),
          ],
        ),
      ),
    );
  }

  // --- function
  _onClick(){
    setState(() {
      _buttonState = _buttonState == 'ON' ? 'OFF' : 'ON';
      _buttonComment = _buttonComment == '버튼을 누르세요' ? 'Press Button' : '버튼을 누르세요';
      _buttonColor = _buttonColor == Colors.red ? Colors.yellow : Colors.red;
    }); // build 에 바뀐 상태 알리는 함수 setState
  }
}