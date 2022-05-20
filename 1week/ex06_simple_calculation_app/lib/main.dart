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
  TextEditingController tec1 = TextEditingController();
  TextEditingController tec2 = TextEditingController();
  TextEditingController tec3 = TextEditingController();
  TextEditingController tec4 = TextEditingController();
  TextEditingController tec5 = TextEditingController();
  TextEditingController tec6 = TextEditingController();

  late bool add;
  late bool sub;
  late bool mul;
  late bool div;
  late String str1;
  late String str2;
  late String str3;
  late String str4;


  @override
  void initState() {
    // TODO: implement initState
    add = false;
    sub = false;
    mul = false;
    div = false;
    str1 = '';
    str2 = '';
    str3 = '';
    str4 = '';
    super.initState();
  }


  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        FocusScope.of(context).unfocus();
      },
      child: Scaffold(
        appBar: AppBar(
          title: const Text('간단한 계산기'),
        ),
        body: SingleChildScrollView(
          child: Column(
              children: [
                TextField(
                  controller: tec1,
                  keyboardType: TextInputType.number,
                  decoration: const InputDecoration(
                    labelText: '첫번쨰 숫자를 입력하세요',
                  ),
                ),
                TextField(
                  controller: tec2,
                  keyboardType: TextInputType.number,
                  decoration: const InputDecoration(
                    labelText: '두번쨰 숫자를 입력하세요',
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      ElevatedButton(
                        onPressed: (){
                          if(tec1.text.trim().isEmpty || tec2.text.trim().isEmpty){
                            textEmptySnackBar(context);
                          }else{
                            calculation();
                          }
                      }, 
                      child: const Text('계산하기'),
                      ),
                      SizedBox(
                        height: 300,
                        width: 30,
                      ),
        
                      ElevatedButton(
                        onPressed: (){
                          eraseAll();
          
                      }, 
                      child: const Text('지우기'),
                      style: ButtonStyle(
                        backgroundColor: MaterialStateProperty.all(Colors.red)
                      ),
          
                      ),
                    ],
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text('덧셈'),
                    Switch(
                      value: add, 
                      onChanged: (value){
                        setState(() {
                          if(add == true){
                            str1 = tec3.text;
                            tec3.text = '';
                          }else{
                            tec3.text = str1;
                          }
                          add = value;
                        });
                      }
                    ),
                    Text('뺄셈'),
                    Switch(
                      value: sub, 
                      onChanged: (value){
                        setState(() {
                          if(sub == true){
                            str2 = tec4.text;
                            tec4.text = '';
                          }else{
                            tec4.text = str2;
                          }
                          sub = value;
                        });

                      }
                    ),
                    Text('곱셈'),
                    Switch(
                      value: mul, 
                      onChanged: (value){
                        setState(() {
                          if(mul == true){
                            str3 = tec5.text;
                            tec5.text = '';
                          }else{
                            tec5.text = str3;
                          }
                          mul = value;
                        });
                      }
                    ),
                    Text('나눗셈'),
                    Switch(
                      value: div, 
                      onChanged: (value){
                        setState(() {
                          if(div == true){
                            str4 = tec6.text;
                            tec6.text = '';
                          }else{
                            tec6.text = str4;
                          }
                          div = value;
                        });
                      }
                    ),
                  ],
                ),
                TextField(
                  controller: tec3,
                  keyboardType: TextInputType.number,
                  decoration: const InputDecoration(
                    labelText: '덧셈 결과',
                  ),
                  readOnly: true,
                ),
                TextField(
                  controller: tec4,
                  keyboardType: TextInputType.number,
                  decoration: const InputDecoration(
                    labelText: '뺄셈 결과',
                  
                  ),
                  readOnly: true,
                ),
                TextField(
                  controller: tec5,
                  keyboardType: TextInputType.number,
                  decoration: const InputDecoration(
                    labelText: '곱셈 결과',
                  ),
                  readOnly: true,
                ),
                TextField(
                  controller: tec6,
                  keyboardType: TextInputType.number,
                  decoration: const InputDecoration(
                    labelText: '나눗셈 결과',
                  ),
                  readOnly: true,
                ),
              ],
            ),
          ),
        ),
    );
  }

  // --- function

  textEmptySnackBar(BuildContext context){
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(
        content: Text('숫자를 입력하세요'),
        duration: Duration(seconds: 2),
        backgroundColor: Colors.red,
      )
    );
  }

  calculation(){
    
    tec3.text = add == true ? (int.parse(tec1.text.trim()) + int.parse(tec2.text.trim())).toString() : '';
    tec4.text = sub == true ? (int.parse(tec1.text.trim()) - int.parse(tec2.text.trim())).toString() : '';
    tec5.text = mul == true ? (int.parse(tec1.text.trim()) * int.parse(tec2.text.trim())).toString() : '';
    tec6.text = div == true ? (int.parse(tec1.text.trim()) / int.parse(tec2.text.trim())).toString() : '';
  }

  eraseAll(){
    tec1.text = '';
    tec2.text = '';
    tec3.text = '';
    tec4.text = '';
    tec5.text = '';
    tec6.text = '';
  }

}