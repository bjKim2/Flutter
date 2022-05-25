import 'package:flutter/material.dart';

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

        primarySwatch: Colors.red,
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
  
  late String _lampImage; // Image Name
  late double _lampWidth; // Image Width
  late double _lampHeight; // Image Heigh
  late String _buttonName; // button Name
  late bool _switch; // switch status
  late String _lampSizeStatus; // Image Size Status
  
  @override
  void initState() {
    super.initState();

    _lampImage = 'images/lamp_on.png';
    _lampWidth = 150;
    _lampHeight = 300;
    _buttonName = "Image 확대";
    _switch = true;
    _lampSizeStatus = 'small';
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.transparent,
      appBar : AppBar(
        title: const Text('image zoom'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              color: Colors.indigo,
              width: 350,
              height: 650,
              // child 특성이 외동이면 부모의 특성이나 권한을 다줌
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Image.asset(
                    _lampImage,
                    width: _lampWidth,
                    height: _lampHeight,
                  ),
                ],
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                TextButton(
                  onPressed: () {
                    decisionLampSize();
                  }, 
                  child: Text(_buttonName),
                ),
                SizedBox(
                  width: 20,
                ),
                Column(
                  children: [
                    Text(
                      '전구 스위치'
                    ),
                    Switch(
                      value: _switch, 
                      onChanged: (value){
                        setState(() {
                          _switch = value;
                          decisitionOnOff();
                        });
                      })
                  ],
                )
              ],
            )
          ],
        ),
      ),
    );  
  }

  // -- function

  decisitionOnOff(){
    _lampImage = _switch ? 'images/lamp_on.png' : 'images/lamp_off.png';
  }

  
  decisionLampSize(){
    setState(() {
      if(_lampSizeStatus == 'small'){
        _lampWidth = 300;
        _lampHeight = 600;
        _lampSizeStatus = 'large';
        _buttonName = 'Image 축소';

      }else{
        _lampWidth = 150;
        _lampHeight = 300;
        _lampSizeStatus = 'small';
        _buttonName = 'Image 확대';
      }
    });
  }
}