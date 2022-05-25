import 'package:flutter/material.dart';
import 'package:teambmi_tabbar_app/sung/message.dart';

class FirstPage extends StatefulWidget {
  const FirstPage({Key? key}) : super(key: key);

  @override
  State<FirstPage> createState() => _FirstPageState();
}

class _FirstPageState extends State<FirstPage> {
  late TextEditingController weightCnt;
  late TextEditingController heightCnt;
 

  @override
  void initState() {
    weightCnt = TextEditingController();
    heightCnt = TextEditingController();
   
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        FocusScope.of(context).unfocus();
      },
      child: Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          title: const Text('Body Mass Index'),
        ),
        body: SingleChildScrollView(
          child: Center(
            child: Column(
              children: [
                Image.asset('images/BMI.jpeg'),
                const SizedBox(
                  height: 30,
                ),
                SizedBox(
                  height: 40,
                  width: 300,
                  child: TextField(
                    controller: heightCnt,
                    decoration: const InputDecoration(
                        labelText: '키(Cm)를 입력하세요',
                        labelStyle: TextStyle(fontSize: 15),
                        border: OutlineInputBorder()),
                    keyboardType: TextInputType.number,
                  ),
                ),
                const SizedBox(height: 20,),
                SizedBox(
                  height: 40,
                  width: 300,
                  child: TextField(
                    controller: weightCnt,
                    decoration: const InputDecoration(
                        labelText: '몸무게를(Kg)를 입력하세요',
                        labelStyle: TextStyle(fontSize: 15),
                        border: OutlineInputBorder()),
                    keyboardType: TextInputType.number,
                  ),
                ),
                const SizedBox(height: 70,),
                ElevatedButton(
                    onPressed: () {
                      if (heightCnt.text.trim().isEmpty |
                          weightCnt.text.trim().isEmpty) {
                        errorSnackBar(context);
                      } else {
                        Message.height = double.parse(heightCnt.text);
                        Message.weight = double.parse(weightCnt.text);
                        heightCnt.text = "";
                        weightCnt.text = "";
                        Navigator.pushNamed(context, '/2');
                      }
                    },
                    child: const Text('BMI 계산하기')),
              ],
            ),
          ),
        ),
      ),
    );
  }

  errorSnackBar(BuildContext context) {
    ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
      content: Text('정보를 입력해주세요'),
      duration: Duration(seconds: 2),
      backgroundColor: Colors.red,
    ));
  }

}
