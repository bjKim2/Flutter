import 'package:flutter/material.dart';
import 'package:login_tabbar_itegratioin_app/animal_item.dart';
import 'package:login_tabbar_itegratioin_app/first_page.dart';
import 'package:login_tabbar_itegratioin_app/second_page.dart';

class AnimalTabbar extends StatefulWidget {
  const AnimalTabbar({Key? key}) : super(key: key);
  @override
  State<AnimalTabbar> createState() => _AnimalTabbarState();
}

class _AnimalTabbarState extends State<AnimalTabbar> 
    with SingleTickerProviderStateMixin{
      // Property
      late TabController controller;
      List<Animal> animalList = [];

      late Color tab1col;
      late Color tab2col;
      
  @override
  void initState() {
    super.initState();
    controller = TabController(length: 2, vsync: this);

    tab1col = Colors.blue;
    tab2col = Colors.red;


    animalList.add(Animal(
      animalName:'벌' , 
      kind: '곤충' , 
      imagePath: 'images/bee.png', 
      flyExist: true));

    animalList.add(Animal(
      animalName:'고양이' , 
      kind: '포유류' , 
      imagePath: 'images/cat.png', 
      flyExist: false));

    animalList.add(Animal(
      animalName:'젖소' , 
      kind: '포유류' , 
      imagePath: 'images/cow.png', 
      flyExist: false));

    animalList.add(Animal(
      animalName:'강아지' , 
      kind: '포유류' , 
      imagePath: 'images/dog.png', 
      flyExist: false));

    animalList.add(Animal(
      animalName:'여우' , 
      kind: '포유류' , 
      imagePath: 'images/fox.png', 
      flyExist: false));

    animalList.add(Animal(
      animalName:'원숭이' , 
      kind: '포유류' , 
      imagePath: 'images/monkey.png', 
      flyExist: false));

    animalList.add(Animal(
      animalName:'돼지' , 
      kind: '포유류' , 
      imagePath: 'images/pig.png', 
      flyExist: false));

    animalList.add(Animal(
      animalName:'늑대' , 
      kind: '포유류' , 
      imagePath: 'images/wolf.png', 
      flyExist: false));

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
        title: const Text('ListView Test'),
      ),           
      body: TabBarView(
        controller: controller,
        children: [
          FirstPage(list: animalList),
          SecondPage(list: animalList),
        ]
      ),
      bottomNavigationBar: Container(
        color: Colors.purple,
        height: 70,
        child: TabBar(
          onTap: (value) {
            if (value == 0){
              setState(() {
                tab1col = Colors.blue;
                tab2col = Colors.red;
              });
            }else{
              setState(() {
                
                tab1col = Colors.red;
                tab2col = Colors.blue;
              });
            }
          },
          controller: controller,
          tabs:  [
            Tab(
              icon: Icon(
                Icons.looks_one,
                color: tab1col,
              ),
              text: 'List ',
            ),
            Tab(
              icon: Icon(
                Icons.looks_two,
                color: tab2col,
              ),
              text: 'merong',
            ),
          ]
        ),
      ),
    );
  }
}