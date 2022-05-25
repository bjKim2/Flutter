

import 'package:flutter/material.dart';
import 'package:teambmi_tabbar_app/kweon/message.dart';

class ResultPage extends StatefulWidget {
  const ResultPage({Key? key}) : super(key: key);

  @override
  State<ResultPage> createState() => _ResultPageState();
}

class _ResultPageState extends State<ResultPage> {
  // Property
  double height = double.parse(Message.height)/100;
  double weight = double.parse(Message.weight);
  double bmi_result = 0;
  String bmi = "";
  String advice = "";
  Color tcol = Colors.black;
  String showImg = "images/question.jpg";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.orange[100],
      appBar: AppBar(
        title: const Text(
          "결과창",
        ),
      ),
      body: SingleChildScrollView(
        child: Center(
          child: Column(
            children: [
              const Padding(
                padding: EdgeInsets.all(50.0),
                child: Text("당신의 결과는?",
                  style: TextStyle(
                    fontSize: 30,
                    color: Colors.green,
                  ),
                ),
              ),
              OutlinedButton(
                onPressed: () {
                  setResult();
                }, 
                style: OutlinedButton.styleFrom(
                  primary: Colors.blue,
                  side: const BorderSide(
                    color: Colors.blue,
                    width: 2,
                  ),
                  backgroundColor: Colors.blue[100],
                  minimumSize: const Size(200, 40)
                ),
                child: const Text("결과보기",),
              ),
              Padding(
                padding: const EdgeInsets.fromLTRB(0, 50, 0, 30),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Text("BMI : ",
                    style: TextStyle(
                          fontSize: 30,
                          color: Colors.black,
                          fontWeight: FontWeight.bold,
                        ),),
                    Text(bmi_result.toStringAsFixed(2),
                    style: TextStyle(
                          fontSize: 30,
                          color: tcol,
                          fontWeight: FontWeight.bold,
                        ),),

                  ],
                )
              ),
              Text(bmi,
              style: TextStyle(
                    fontSize: 30,
                    color: tcol,
                  ),),
              Text(advice,
              style: TextStyle(
                    fontSize: 30,
                    color: tcol,
                  ),
              ),
              Image.asset(
                showImg,
                width: 300,
                height: 300,
              )
            ],
          ),
        ),
      ),
    );
  }
  setResult() {
    bmi_result = weight / (height * height);
    setState(() {
      if (bmi_result >= 30) {
        bmi = "당신은 고도비만입니다.";
        advice = "운동이 시급합니다!!!!";
        tcol = Colors.red;
        showImg = "images/exercise.jpg";
      } else if (bmi_result >= 25) {
        bmi = "당신은 비만입니다.";
        advice = "운동이 필요합니다!!";
        tcol = Colors.red;
        showImg = "images/exercise.jpg";
      } else if (bmi_result >= 23) {
        bmi = "당신은 과체중입니다";
        advice = "운동을 시작할 필요가 있네요!";
        tcol = Colors.blue;
        showImg = "images/maintain.jpg";
      } else if (bmi_result >= 18.5) {
        bmi = "당신은 정상체중입니다.";
        advice = "이대로 유지가 중요해요!";
        tcol = Colors.green;
        showImg = "images/maintain.jpg";
      } else {
        bmi = "당신은 저체중입니다";
        advice = "조금 먹는양을 늘려야 하네요";
        tcol = Colors.blue;
        showImg = "images/low.jpg";
      }
    });
  }
}