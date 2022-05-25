import 'package:flutter/material.dart';
import 'package:tabbar_flower_buttonswipe_app/buttontap.dart';
import 'package:tabbar_flower_buttonswipe_app/swipetap.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home>
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
          buttonTap(), swipeTap()
        ],
      ),
      bottomNavigationBar: Container(
        color: Colors.white,
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
              text: 'Button',
            ),
            Tab(
              icon: Icon(Icons.looks_two,
              color:  Colors.red,
              
              ),
              text: 'Swipe',
            ),
          ],
        ),
      )
    );   
  }

}
