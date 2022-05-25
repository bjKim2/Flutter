import 'package:flutter/material.dart';
import 'package:prenetwork_navigator_lamp_app/modifyset.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(

        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final tec = TextEditingController();
  late String str;
  late bool on_Off;
  late String imagePath;


  @override
  void initState() {
    super.initState();
    imagePath = 'images/lamp_on.png';
    str = '';
    on_Off = true;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Main 화면'),
        actions: [
          IconButton(
            onPressed: () {
              Navigator.push(context,MaterialPageRoute(builder: (context) {
                return ModifySetting(str: tec.text, on_Off: on_Off);
              },)).then((value) => _changeSet(value));
            }, 
            icon: Icon(Icons.edit),)
        ],

      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          TextField(
            controller: tec,
            decoration: InputDecoration(
              labelText: '글자를 입력하세요',
            ),
          ),
          Image.asset(
            imagePath,
            width: 200,
            height: 300,
          ),

        ],
      ),
    );
  }

  _changeSet(List value){
    setState(() {
      tec.text = value[0];
      imagePath  =value[1] ? 'images/lamp_on.png' : 'images/lamp_off.png';
      str = value[0];
      on_Off = value[1];
    });
  }
}