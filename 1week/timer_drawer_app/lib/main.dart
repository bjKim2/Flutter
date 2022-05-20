import 'dart:async';

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
  TextEditingController tec = TextEditingController();
  late String displayStr;
  late String str;
  late List strs;
  late int index;

  @override
  void initState() {
    displayStr = '';
    str = '';
    strs = [];
    index = -1;

    Timer.periodic(const Duration(milliseconds: 300), (timer) { 
      if (displayStr != '') {
        adStr();
      }
    });

    super.initState();
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('LED 광고'),
        
      ),
      body: Center(
        child: Text(
          str,
          style: TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),

      drawer: Drawer(
        child: Center(
          child: Column(
            children: [
              Container(
                width: 320,
                height: 200,
                decoration: const BoxDecoration(
                  color: Colors.red,
                  borderRadius: BorderRadius.only(
                    bottomLeft: Radius.circular(40),
                    bottomRight: Radius.circular(40),
                  )
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      '광고 문구를 입력하세요',
                      style: TextStyle(
                        fontSize: 20,
                        color: Colors.yellow,
                        fontWeight: FontWeight.bold,

                      ),
                    
                    ),
                  ],
                ),
              ),
            Padding(
              padding: const EdgeInsets.all(20.0),
              child: TextField(
                controller: tec,
                keyboardType: TextInputType.text,
                decoration: InputDecoration(
                  labelText: '글자를 입력하세요',
                ),
              ),
            ),
            OutlinedButton(
              onPressed: () {
                if(tec.text.trim().isEmpty){
                  snackbar(context);
                }else{
                  Navigator.pop(context);
                  setState(() {
                    displayStr = tec.text;
                    strs = displayStr.split('');

                    index = -1;
                    str = '';
                    tec.text = '';
                  });
                }
              }, 
              style: ButtonStyle(
                foregroundColor: MaterialStateProperty.all(Colors.black),
                side: MaterialStateProperty.all(BorderSide(
                  color: Colors.red,
                ))
              ),
              child: const Text('광고 문구 설정'))
            ],
          ),
        )
          // ListView(
          // padding: EdgeInsets.zero,
          // children: [
          //   Stack(
          //     children : [
          //       UserAccountsDrawerHeader(
          //         decoration: BoxDecoration(
          //           color: Colors.red,
          //           borderRadius: BorderRadius.only(
          //           bottomLeft: Radius.circular(40),
          //           bottomRight: Radius.circular(40),
          //       )
          //         ),
          //         accountName: Text(''),
          //         accountEmail: Text('')),
          //       Positioned(
          //         left: 50,
          //         top:  90,
          //         child: Text('광고 문구를 입력해주세요',
          //           style: TextStyle(
          //             color: Colors.yellow,
          //             fontSize: 20,
          //           ),
          //         ),
          //       ),
          //     ],
          //   ),
          //   Padding(
          //     padding: const EdgeInsets.all(20.0),
          //     child: TextField(
          //       controller: tec,
          //       keyboardType: TextInputType.text,
          //       decoration: InputDecoration(
          //         labelText: '글자를 입력하세요',
          //       ),
          //     ),
          //   ),
          //   OutlinedButton(
          //     onPressed: () {
          //       if(tec.text.trim().isEmpty){
          //         snackbar(context);
          //       }else{
          //         Navigator.pop(context);
          //         setState(() {
          //           displayStr = tec.text;
          //           strs = displayStr.split('');

          //           index = -1;
          //           str = '';
          //           tec.text = '';
          //         });
          //       }
          //     }, 
          //     // style: ButtonStyle(
          //     // ),
          //     child: const Text('광고 문구 설정'))
          // ],
        // ),
      
      
      ),


    );  
  }

  adStr(){
    setState(() {
      index++;
      str = index == displayStr.length ? '' : str;
      index = index == displayStr.length ? 0 : index;
      str += strs[index];
    });

  }

  snackbar(BuildContext context){
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(
        content: Text('글자를 입력하세요'),
        duration:  Duration(seconds: 2),
        backgroundColor: Colors.red,
      )
    );
  }
}