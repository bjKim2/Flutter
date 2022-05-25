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
  late bool _switch; // switch status
  late bool _sizeSwitch;
  late bool _colorSwitch;

  
  @override
  void initState() {
    super.initState();
    _lampImage = 'images/lamp_on.png';
    _lampWidth = 150;
    _lampHeight = 300;
    _switch = true;
    _sizeSwitch = false;
    _colorSwitch = false;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.lightBlue,
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
            SizedBox(
              height: 30,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Column(
                  children: [
                    Text('전구 색깔'),
                    Switch(
                      value: _colorSwitch, 
                      onChanged: (value){
                        setState(() {
                          _colorSwitch = value;
                          colorFunction();
                        });
                      }
                    )
                  ],
                ),
                SizedBox(
                  width: 20,
                ),
                Column(
                  children: [
                    Text('전구 확대'),
                    Switch(
                      value: _sizeSwitch, 
                      onChanged: (value){
                        setState(() {
                          _sizeSwitch = value;
                          sizeFunction();
                        });
                      }
                    )
                  ],
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
  colorFunction(){
    _lampImage = _switch && _colorSwitch ? 'images/lamp_red.png' : _switch && !_colorSwitch ? 'images/lamp_on.png' : _lampImage;
  }
  decisitionOnOff(){
    _lampImage = _switch ? 'images/lamp_on.png' : 'images/lamp_off.png';
  }
  sizeFunction(){
    if(_sizeSwitch){
        _lampWidth = 300;
        _lampHeight = 600;
    }else{
        _lampWidth = 150;
        _lampHeight = 300;
    }
  }
}