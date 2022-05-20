import 'dart:math';

import 'package:ex07_bmi_app/staticvar.dart';
import 'package:flutter/material.dart';

class BmiResult extends StatefulWidget {
  const BmiResult({Key? key}) : super(key: key);

  @override
  State<BmiResult> createState() => _BmiResultState();
}

class _BmiResultState extends State<BmiResult> {
  late double height;
  late double weight;
  late double bmi;
  late String str1;
  

  @override
  void initState() {
    // TODO: implement initState
    height = double.parse(parameters.height);
    weight = double.parse(parameters.weight);
    bmi =  (weight / pow(height/100,2)) ;
    str1 = '';
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('your BMI is ..'),
        backgroundColor: Colors.purple,
        foregroundColor: Colors.amber[100],
      ),
      body: Center(
        child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          SizedBox(
            height: 100,
          ),
          Text(
            'bmi는 ${bmi.toStringAsFixed(2)}으로 입니다.',
            style: TextStyle(

              color: Colors.blueAccent[100],
              fontSize: 30,

            ),
          ),
          Text(
            '당신은 ${checkbmi(bmi)} 입니다.',
            style: TextStyle(

              color: Colors.blueAccent[100],
              fontSize: 30,

            ),
          ),


        ],
      ),
      )
    );
  }

  String checkbmi(double bmi){
    if(bmi <=18.4){
      str1 = '저체중';
    }else if(bmi<=22.9){
      str1 = '정상체중';
    }else if(bmi<=24.9){
      str1 = '과체중';
    }else if(bmi<= 29.9){
      str1 = '비만';
    }else{
      str1 = '고도비만';
    }
    return str1;
  }
  
}