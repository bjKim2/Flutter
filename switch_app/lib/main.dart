import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
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
  late bool switchValue;
  late Color buttonColor;
  
  @override
  void initState() {
    buttonColor = Colors.blue;
    switchValue = false;
    super.initState();
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title : const Text('Switch'),

      ),

      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
              onPressed: () {
                
              },

              style: ButtonStyle(
                backgroundColor: MaterialStateProperty.all(buttonColor)
              ), 
              child: const Text('flutter'),
            ),
            SizedBox(
              height: 50,
            ),
            Switch(
              value: switchValue, //보여지는 밸류
              onChanged: (value){ // 사용자가 움직이는 밸류
                setState(() {
                  switchValue = value;
                  buttonColor = switchValue == false ? Colors.blue : Colors.red;
                });
              }, 
            ),


          ],
        ),
      ),
    );
  }
}

