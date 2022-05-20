import 'dart:async';

import 'package:flutter/material.dart';
//import 'package:simple_gesture_detector/simple_gesture_detector.dart';



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
    debugShowCheckedModeBanner: false,
    );
  }
}




class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  // property
  late List imageName;
  late int currentImage;
  late String str2;
  late int  nextimg;

  @override
  void initState() {
    imageName = [
      'flower_01.png',
      'flower_02.png',
      'flower_03.png',
      'flower_04.png',
      'flower_05.png',
      'flower_06.png',
    ];
    currentImage = 0 ;
    nextimg = 1 ;

    List strs = [];
    for (int i = 1 ; i <= 6 ; i++ ){
      strs.add('flower_0'+ i.toString() + '.png');
    }
    imageName = strs;
    print(strs);

    Timer.periodic(const Duration(seconds: 2), (timer) { 
      changeImage();
    });

    super.initState();
  }
  


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blueGrey,
      appBar: AppBar(
        title: const Text('3초마다 이미지 무한 반복'),
      ),
      body: 
      // SimpleGestureDetector(
      //   onHorizontalSwipe: _onHorizontalSwipe,
      //   onVerticalSwipe: _onVerticalSwipe,
      //   child: 
        Center(
          child: Column(
            mainAxisAlignment:  MainAxisAlignment.center,
            children: [
              Text(
                imageName[currentImage],
                style: const TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 20,
                ),
              ),
              Row(
                children: [
                  TextButton.icon(
                    onPressed: () {
                      _pre();
                    },
                    icon: Icon(Icons.arrow_back_ios_outlined), 
                    style: ButtonStyle(
                      foregroundColor: MaterialStateProperty.all(Colors.black)
                    ),
                    label: const Text(''),
                  ),

                  Stack(
                    children :[
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Container(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            border: Border.all(
                              color: Colors.blueAccent,
                              width: 10,
                            )
                          ),
                          child: Image.asset(
                            'images/${imageName[currentImage]}',
                            width: 260,
                            height: 600,
                            fit:  BoxFit.fill,
                          ),
                        ),
                      ),

                      Positioned(
                        left: 170,
                        top: 16,
                        child: Container(
                          decoration: BoxDecoration(
                            border: Border.all(
                              color: Colors.amber,
                              width: 5,
                            )
                          ),
                          child: Image.asset(
                            stack2img(),
                            fit: BoxFit.fill,
                            width: 100,
                            height: 150,
                          ),
                        ),
                      )

                    ],
                  ),

                  TextButton.icon(
                    onPressed: () {
                      _post();
                    },
                    icon: Icon(Icons.arrow_forward_ios_outlined), 
                    style: ButtonStyle(
                      foregroundColor: MaterialStateProperty.all(Colors.black)
                    ),
                    label: const Text(''),
                  ),
                ],
              ),
             
            ],
          ),
        ),
      // ),
    );
  }
  // ---function

  changeImage(){
    setState(() {
      currentImage++;
      if(currentImage >= imageName.length){
        currentImage = 0;
      }
    });
  }

  String stack2img(){
    nextimg = currentImage +1  >= imageName.length ? 0 : currentImage +1;
    return 'images/${imageName[nextimg]}';
  }

  _pre(){
    setState(() {
      currentImage -= 1;
      if(currentImage < 0){
        currentImage = imageName.length - 1;
      }
    });
  }
  _post(){
    setState(() {
      currentImage += 1;
      if(currentImage >= imageName.length){
        currentImage = 0;
      }
    });
  }


  // _onHorizontalSwipe(SwipeDirection direction){
  //   setState(() {
  //     if(direction == SwipeDirection.left){
  //       currentImage += 1;
  //       if(currentImage >= imageName.length){
  //         currentImage = 0;
  //       }
  //     }else{
  //       currentImage -= 1;
  //       if(currentImage < 0){
  //         currentImage = imageName.length -1;
  //       }
  //     }
  //   });    
  // }

  // _onVerticalSwipe(SwipeDirection direction){
  //   setState(() {
  //     if(direction == SwipeDirection.down){
  //       currentImage += 1;
  //       if(currentImage >= imageName.length){
  //         currentImage = 0;
  //       }
  //     }else{
  //       currentImage -= 1;
  //       if(currentImage < 0){
  //         currentImage = imageName.length -1;
  //       }
  //     }      
  //   });
  // }
}

