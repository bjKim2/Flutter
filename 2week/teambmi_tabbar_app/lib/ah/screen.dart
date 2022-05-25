import 'package:flutter/material.dart';
import 'package:teambmi_tabbar_app/ah/message.dart';

class First extends StatefulWidget {
  const First({Key? key}) : super(key: key);

  @override
  State<First> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<First> {
  late TextEditingController height;
  late TextEditingController weight;
  
 

  late double a;
  late double b;
  late String str;
  late double bmi;
  

  @override
  void initState() {
    height = TextEditingController();
    weight = TextEditingController();
    

    a = 0;
    b = 0;
    bmi=0;
    str="";

    super.initState();
  }

  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        FocusScope.of(context).unfocus();
      },
      child: Scaffold(
        appBar: AppBar(title: const Text('BMI 계산기'),
       backgroundColor: Colors.orange[100],
        ),

        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                TextField(
                  controller: height,
                  decoration:
                      const InputDecoration(labelText: '키를 입력하세요.'),
                  keyboardType: TextInputType.number,
                ),
                TextField(
                    controller: weight,
                    decoration:
                        const InputDecoration(labelText: '몸무게를 입력하세요.'),
                    keyboardType: TextInputType.number),
                const SizedBox(
                  height: 10,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: ElevatedButton(
                        onPressed: () {

                          _showDialog(context);

                          if (height.text.trim().isEmpty ||
                              weight.text.trim().isEmpty) {
                            errorSnackBar(context);
                          } else {
                            setState(() {
                             a = double.parse(height.text);
                             b = double.parse(weight.text);
                             bmi = b/(a*a*0.0001);
                            
                          if( bmi >0 && bmi < 18.4){
                            str="저체중";
                          
                          }else if( bmi >=18.4 && bmi < 23){
                              str="정상체중";
                          }else if( bmi >=23 && bmi < 25){
                              str="과체중";
                          
                          }else if( bmi >=25 && bmi < 30){
                              str="비만";
                          
                          }else {
                              str="고도비만";
                          }
                            });
                          Message.msg = str;
                          
                          }

                            
                        },
                        style: ButtonStyle(
                          backgroundColor:
                              MaterialStateProperty.all(Colors.black)),
                        child: Row(
                          children: const [
                            Text('확인'),
                          ],
                        ),
                      ),
                    ),
                    ElevatedButton(
                      onPressed: () {
                        height.text = "";
                        weight.text = "";
                        bmi= 0;
                        str="";
                  
                      },
                      style: ButtonStyle(
                          backgroundColor:
                              MaterialStateProperty.all(Colors.lime)),
                      child: Row(
                        children: const [
                          Text('재입력'),
                          
                        ],
                      ),
                    ),
                  ],
                ),
   
           
              ],
            ),
          ),
        ),
      ),
    );
  }

//Desc: 텍스트필드에 입력을 안하고 버튼을 눌렀을 경우
  errorSnackBar(BuildContext context) {
    ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
      content: Text('숫자를 입력하세요.'),
      duration: Duration(seconds: 2),
      backgroundColor: Colors.red,
    ));
  }


//Functions
_showDialog(BuildContext context){
  showDialog(
    context: context, 
    //barrierDismissible: false,
    builder:(BuildContext ctx){
      return AlertDialog(
        content: const Text('마음의 준비가 되셨습니까?'),
        actions: [
          Center(
            child: TextButton(
              onPressed: () {
                  Navigator.of(context).pop();
                  Navigator.pushNamed(context, '/second');
              },
              child: const Text('확인하기')
              ),
          ),
        ],
      );
    });
}





}//End