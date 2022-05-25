
import 'package:flutter/material.dart';
import 'package:teambmi_tabbar_app/eon/staticvar.dart';

class BmiInsert extends StatefulWidget {
  const BmiInsert({Key? key}) : super(key: key);

  @override
  State<BmiInsert> createState() => _BmiInsertState();
}

class _BmiInsertState extends State<BmiInsert> {
  TextEditingController tec1 = TextEditingController();
  TextEditingController tec2 = TextEditingController();


  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        FocusScope.of(context).unfocus();
      },
      child: Scaffold(
        appBar: AppBar(
          title: const Text('your BMI?'),
          backgroundColor: Colors.purple,
          foregroundColor: Colors.amber[100],
        ),
        body: Padding(
          padding: const EdgeInsets.all(30.0),
          child: Column(
            children: [
              SizedBox(
                height: 100,
              ), 
              TextField(
                controller: tec1,
                keyboardType: TextInputType.number,
                decoration: InputDecoration(
                  labelText: '신장을 입력하세요 (cm)',
                  enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(width: 2,color: Colors.amberAccent),
                    borderRadius: BorderRadius.circular(20)
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(width: 3,color: Colors.purple),
                    borderRadius: BorderRadius.circular(20)
                  ),
                ),
              ),
              SizedBox(height: 30,),
              TextField(
                controller: tec2,
                keyboardType: TextInputType.number,
                decoration: InputDecoration(
                  labelText: '체중은 좀 솔직하게 입력하세요 (kg)',
                  enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(width: 2,color: Colors.amberAccent),
                    borderRadius: BorderRadius.circular(20)
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(width: 3,color: Colors.purple),
                    borderRadius: BorderRadius.circular(20)
                  ),
                ),
              ),

              Padding(
                padding: const EdgeInsets.all(20.0),
                child: ElevatedButton(
                  onPressed: () {
                    if(tec1.text.trim().isEmpty || tec2.text.trim().isEmpty){
                      tec12SnackBar(context);
                    }else{
                      parameters.height = tec1.text;
                      parameters.weight = tec2.text;
                      Navigator.pushNamed(context,'bmiresult');

                    }

                    
                  }, 
                  style: ButtonStyle(
                    backgroundColor: MaterialStateProperty.all(Colors.purple),
                    
                  ),
                  child: const Text('검사하기'),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  // --- function

  tec12SnackBar(BuildContext context){
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(
        content: Text('숫자를 입력해주세요.'),
        duration: Duration(seconds: 2),
        backgroundColor: Colors.red,

      )
    );
  }

}

