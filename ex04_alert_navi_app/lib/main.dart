import 'package:ex04_alert_navi_app/page2nd.dart';
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
        '/' :(context) => const Main(),
        '2nd' :(context) => const Page2nd(),
      },
      initialRoute: '/', 
    );
  }
}

class Main extends StatelessWidget {
  const Main({Key? key}) : super(key: key);
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Alert and push"),
        centerTitle: false,
      ),
      body : Center(
        child: GestureDetector(
          onTap: () => _showDialog(context),
          child: Text('Move the 2nd page'),
          
        ),
      )
    );
  }

  //--- function
  _showDialog(BuildContext context){
    showDialog(
      barrierDismissible: false,
      context: context, 
      builder: (BuildContext ctx){
        return AlertDialog(
          title: const Text('Page 이동'),
          content: const Text('아래의 버튼을 누르면 페이지 이동을 합니다.'),
          actions: [
            ElevatedButton(
              onPressed: (){
                Navigator.of(ctx).pop();
                Navigator.pushNamed(context, '2nd');
              }, 
              child: const Text('Page 이동'))
          ],
        );
      }
    );
  }
}

