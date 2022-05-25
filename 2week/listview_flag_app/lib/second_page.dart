import 'package:flutter/material.dart';
import 'package:listview_flag_app/nation.dart';

class SecondPage extends StatefulWidget {
  final List<Nation> list;

  const SecondPage({Key? key,required this.list}) : super(key: key);

  @override
  State<SecondPage> createState() => _SecondPageState();
}

class _SecondPageState extends State<SecondPage> {
  final tec1 = TextEditingController();
  final tec2 = TextEditingController();
  String nationName = '';
  String imagePath = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          TextField(
            controller: tec1,
            keyboardType: TextInputType.text,
            decoration: InputDecoration(
              labelText: '문제를 입력하세요'
            ),
          ),
          TextField(
            controller: tec1,
            keyboardType: TextInputType.text,
            decoration: InputDecoration(
              labelText: '정답을 입력하세요'
            ),
          ),
          Container(
            height: 70,
            child: ListView(
              scrollDirection: Axis.horizontal,
              children: [
                GestureDetector(
                  onTap: () {
                    setState(() {
                      nationName = '대한민국';
                      imagePath = 'images/korea.png';
                    });
                  },
                  child: Image.asset('images/korea.png')
                ),
                GestureDetector(
                  onTap: () {
                    setState(() {
                      nationName = '중국';
                      imagePath = 'images/china.png';
                    });
                  },
                  child: Image.asset('images/china.png')
                ),
                GestureDetector(
                  onTap: () {
                    setState(() {
                      nationName = '뉴질랜드';
                      imagePath = 'images/newzealand.png';
                    });
                  },
                  child: Image.asset('images/newzealand.png')
                ),
                GestureDetector(
                  onTap: () {
                    setState(() {
                      nationName = '칠레';
                      imagePath = 'images/chile.png';
                    });
                  },
                  child: Image.asset('images/chile.png')
                ),
                GestureDetector(
                  onTap: () {
                    setState(() {
                      nationName = '스페인';
                      imagePath = 'images/spain.png';
                    });
                  },
                  child: Image.asset('images/spain.png')
                ),
              ],
              
            ),
            
          ),
          Text(nationName),
          ElevatedButton(
            onPressed: (){
              _checkAdd(context,nationName);
            }, 
            child: const Text('국가 추가하기')
          )

        ],
      ),      
    );
  }
  _checkAdd(BuildContext context,String nationName){
    showDialog(
      context: context, 
      builder: (BuildContext context){
        return AlertDialog(
          title: const Text('국가별'),
          content: Text('이 국가는 $nationName 입니다.'),
          actions: [
            TextButton(
              onPressed: () {
                widget.list.add(Nation(imagePath: imagePath, nation: nationName));
                Navigator.of(context).pop();
              }, 
              child: const Text('예')
            ),
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              }, 
              child: const Text(
                '아니오',
                style: TextStyle(
                  color: Colors.red
                ),
              )
            ),
          ],
        );

      }
    );

  }
}