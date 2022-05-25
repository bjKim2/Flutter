import 'package:flutter/material.dart';
import 'package:listview_flag_app/first_page.dart';
import 'package:listview_flag_app/nation.dart';
import 'package:listview_flag_app/second_page.dart';

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

class _MyHomePageState extends State<MyHomePage> 
  with SingleTickerProviderStateMixin{
    late TabController controller;
    List<Nation> nationList = [];

    List nationImgPath = [
      'images/austria.png',
      'images/belgium.png',
      'images/estonia.png',
      'images/france.png',
      'images/germany.png',
      'images/hungary.png',
      'images/italy.png',
      'images/latvia.png',
      'images/lithuania.png',
      'images/luxemburg.png',
      'images/netherland.png',
      'images/romania.png',
      'images/korea.png',
      'images/china.png',
      'images/newzealand.png',
      'images/chile.png',
      'images/spain.png',

    ];
    List<String> nationName = [
      '오스트리아',
      '벨기에',
      '에스토니아',
      '프랑스',
      '독일',
      '헝가리',
      '이탈리아',
      '라트비아',
      '리투아니아',
      '룩셈부르크',
      '네덜란드',
      '루마니아',
      '한국',
      '중국',
      '뉴질랜드',
      '칠레',
      '스페인'
    ];


  @override
  void initState() {
    super.initState();
    controller = TabController(length: 2, vsync: this);
    for (int i = 0 ; i < nationName.length ;i++  ){
      nationList.add(Nation(imagePath: nationImgPath[i], nation: nationName[i].substring(0,1)+'_ '*(nationName[i].length-1) ));
    }
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }
  

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Nation flag'),
      ),
      body: TabBarView(
        controller: controller,
        children: [
          FirstPage(list : nationList),
          SecondPage(list: nationList),
        ]

      ),
      bottomNavigationBar: TabBar(
        controller: controller,
        tabs: const [
          Tab(
            icon: Icon(
              Icons.looks_one,
              color: Colors.blue,
            ),
            text: 'flag',
          ),
          Tab(
            icon: Icon(
              Icons.looks_two,
              color: Colors.red,
            ),
            text: 'something',
          ),
        ]
      ),

    );
  }
}