import 'package:flutter/material.dart';
import 'package:navigator_lamp_switch_app/vol1/message.dart';
import 'package:navigator_lamp_switch_app/vol1/modify_page.dart';

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
  late String imagePath;
  late bool lamp_color;
  late bool on_off;

  List<bool> set = [];

  @override
  void initState() {
    super.initState();
    imagePath = 'images/lamp_on.png';
    lamp_color = false;
    on_off = true;
    set.add(false);
    set.add(true);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Main 화면'),
        actions: [
          GestureDetector(
            onTap: () {
              Navigator.push(context, MaterialPageRoute(builder: (context)=>ModifySettings(set: set = [lamp_color,on_off],))
              ).then((value) => changeSetting(set)) ;
            },
            child: Icon(
              Icons.insert_chart,
      
            ),
          )
        ],
      ),
      body: Center(
        child: SizedBox(
          width: 300,
          height: 400,
          child: Image.asset(
            imagePath = on_off ? (lamp_color ? 'images/lamp_red.png' : 'images/lamp_on.png') : 'images/lamp_off.png',

          ),
        ),
      ),
    );
  }


  // --- function

  changeSetting(List<bool> set){
    setState(() {
      // lamp_color = set[2];
      // on_off = set[3];
      set = [lamp_color, on_off];

      lamp_color = switchSetting.lamp_color;
      on_off = switchSetting.on_off;
    });
  }

}