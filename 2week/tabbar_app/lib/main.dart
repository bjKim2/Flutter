import 'package:flutter/material.dart';
import 'package:tabbar_app/first_page.dart';
import 'package:tabbar_app/second_page.dart';

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

class _MyHomePageState extends State<MyHomePage>
    with SingleTickerProviderStateMixin{
  
  //Property
  late TabController controller;

  @override
  void initState() {
    super.initState();
    controller = TabController(length: 2, vsync: this); // length 탭 수 ,vsync 쓸 페이지 (main이라 this)
  }

  @override
  void dispose() { // 위젯이 정리될 떄 쓰는 함수
    controller.dispose();
    super.dispose();
  }
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: AppBar(
      //   title: const Text('Tab Bar Test'),
      // ),
      body: TabBarView(
        controller:  controller, 
        children: const [
          FirstPage(), SecondPage()
        ],
      ),
      bottomNavigationBar: Container(
        color: Colors.yellowAccent,
        height: 100,
        child: TabBar(
          controller: controller,
          labelColor: Colors.blueAccent,
          indicatorColor: Colors.red,
          tabs: const [
            Tab(
              icon: Icon(Icons.looks_one,
              color:  Colors.blue,
              ),
              text: 'One',
            ),
            Tab(
              icon: Icon(Icons.looks_two,
              color:  Colors.red,
              ),
              text: 'Two',
            ),
          ],
        ),
      )
    );   
  }
}
