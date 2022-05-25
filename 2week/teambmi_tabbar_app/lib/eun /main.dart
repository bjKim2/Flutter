import 'package:flutter/material.dart';

class eun extends StatefulWidget {
  const eun({Key? key}) : super(key: key);


  @override
  State<eun> createState() => _eunState();
}

class _eunState extends State<eun> {
  late TextEditingController kg;
  late TextEditingController cm;
  late TextEditingController bmi;
  late TextEditingController result;

@override
  void initState() {
    kg = TextEditingController();
    cm = TextEditingController();
    bmi = TextEditingController();
    result = TextEditingController();
    super.initState();
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
            backgroundColor: Colors.orange[100],
      appBar: AppBar(
        title: const Text('BMI'),
        backgroundColor: Colors.cyan,
        elevation: 1.0,
      ),
      body: SingleChildScrollView(
        child: Center(
          child: Column(
            children: [
              Image.asset(          
                    'images/bmi2.jpeg',
                     width: 250,
                     height: 100,
                    
                  ),
                
            TextField(
                    controller: kg,
                    decoration: const InputDecoration(labelText: '몸무게를 입력하세요.'),
                    keyboardType: TextInputType.number,
                    
                  ),
            TextField(
                    controller: cm,
                    decoration: const InputDecoration(labelText: '키를 입력하세요.'),
                    keyboardType: TextInputType.number,
                  ),
            
            const SizedBox(
              height: 15,
            ),
            ElevatedButton(
              onPressed:(){
                setState(() {
                  bmi1();
                  result1();
                });
              },
             style: ElevatedButton.styleFrom(
              primary: Color.fromARGB(255, 92, 196, 237),
              shape: RoundedRectangleBorder(
               borderRadius: BorderRadius.circular(20),
                  ),
                ),
               child: const Text('결과'
               ),
               ),
               TextField(
                    controller: bmi,
                    readOnly: true,
                    decoration: const InputDecoration(labelText: 'Your BMI'),
                ),
                TextField(
                  controller: result,
                  readOnly: true,
                  decoration: const InputDecoration(labelText: 'Your result'),
                )
              
            ],
          ),
        ),
      ),
    );
  }

  //--Functions
//-버튼



  bmi1(){
    setState(() {
      bmi.text =(int.parse(kg.text)/((int.parse(cm.text)*0.01)*(int.parse(cm.text)*0.01))).toString();
      
    });
    
  
  }
  result1(){
    setState(() {
      if(double.parse(bmi.text)<= 18.4){
        result.text=("당신은 저체중입니다.  운동하실 필요가 있습니다.");
      }else if(double.parse(bmi.text)<= 22.9){
        result.text=("당신은 정상입니다.  운동은 굳이....");
      }else if(double.parse(bmi.text)<= 24.9){
        result.text=("당신은 과체중입니다. 운동을 고민ing");
      }else if(double.parse(bmi.text)<= 29.9){
        result.text=("당신은 비만 입니다.  운동하실 필요가 있습니다.");
      }else{
        result.text=("당신은 고도 비만입니다. 목숨이 위험하십니다. 운동하세요.");
      }
      
    });
  }

}
// int.parse(kg.text)
// int.parse(cm.text)
// int.parse(cm.text)