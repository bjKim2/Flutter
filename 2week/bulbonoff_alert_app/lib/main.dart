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
  late bool _lampswitch;
  late String _lampImage;

  @override
  void initState() {
    _lampswitch = true;
    _lampImage = 'images/lamp_on.png';

    super.initState();
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title : const Text('Alert를 이용한 메세지 출력')
      ),

      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SizedBox(
              width: 300,
              height: 600,
              child: Column(
              children: [
                Image.asset(_lampImage),
              ],
            )),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ElevatedButton(
                  onPressed: () {
                      if(_lampswitch){
                         _showDialogSwitchOnatOn(context);
                      }else{
                        setState(() {
                          _lampImage = 'images/lamp_on.png';
                          _lampswitch = true;
                        });
                      }
                  }, 
                  child: Text('켜기'),

                ),
                SizedBox(
                  width: 0,
                  height: 0,
                  child: ElevatedButton(onPressed: () {
                    
                  },
                  child: const Text('data'),
                  ),
                ),

                SizedBox(
                  width: 20,
                ),

                ElevatedButton(
                  onPressed: () {
                      if(_lampswitch){
                        _showDialogSwitchOffatOn(context);
                      }else{
                        _showDialogSwitchOffatOff(context);
                      }
                  }, 
                  child: Text('끄기')
                ),



              ],
            )
          ],
        ),
      ),

    );
  }

  /// --- function
  
  _showDialogSwitchOnatOn(BuildContext context){
    showDialog(
      barrierDismissible: false,
      context: context, 
      builder: (BuildContext ctx){
        return AlertDialog(
          title: const Text('경고'),
          content: const Text('이미 켜져 있습니다.'),
          actions: [
            ElevatedButton(
              onPressed: (){
                Navigator.pop(context);
              },
              child: const Text('예 알겠습니다.'))
          ],
        );
      }
    );  
  }
  _showDialogSwitchOffatOn(BuildContext context){
    showDialog(
      barrierDismissible: false,
      context: context, 
      builder: (BuildContext ctx){
        return AlertDialog(
          title: const Text('램프 끄기'),
          content: const Text('램프를 끄시겠습니까?'),
          actions: [
            ElevatedButton(
              onPressed: (){
                setState(() {
                  _lampImage = 'images/lamp_off.png';
                  _lampswitch = false;
                  Navigator.pop(context);
                });
              },
              child: const Text('예')),
            ElevatedButton(
              onPressed: (){
                Navigator.pop(context);
              },
              child: const Text('아니오')),
          ],
        );
      }
    );  
  }
  _showDialogSwitchOffatOff(BuildContext context){
    showDialog(
      barrierDismissible: false,
      context: context, 
      builder: (BuildContext ctx){
        return AlertDialog(
          title: const Text('경고'),
          content: const Text('현재 램프가 꺼진 상태 입니다.'),
          actions: [
            ElevatedButton(
              onPressed: (){
                Navigator.pop(context);
              },
              child: const Text('예 알겠습니다.'))
          ],
        );
      }
    );  
  }
}

// Widget Test01 {
//   int num1 = 0;

//   Test01(int num1){
//     this.num1 = num1;
//   }

//   test02(){
//     if(num1 == 1){
//       return ElevatedButton(
//         onPressed: 
//         () {
          
//         },
//        child: const Text('test')
//        );
//     }
//   }
// }