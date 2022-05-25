

import 'package:flutter/material.dart';

class StartPage extends StatefulWidget {
  const StartPage({Key? key}) : super(key: key);

  @override
  State<StartPage> createState() => _StartPageState();
}

class _StartPageState extends State<StartPage> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.pushNamed(context, "calPage");
      },
      child: Scaffold(
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: const [
              Padding(
                padding: EdgeInsets.fromLTRB(0, 0, 0, 50),
                child: Text("BMI 계산기",
                  style: TextStyle(
                    fontSize: 50,
                    color: Colors.green,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              Image(
                image: AssetImage("images/bmi.jpg",
                ),
              ),
              SizedBox(
                height: 30,
              ),
              Text("아무곳이나 탭하여 이동합니다.", 
              ),
            ],
          ),
        ),
      ),
    );
  }
}