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
  late int sum;
  late String str1;
  TextEditingController textEditingController = TextEditingController();
  TextEditingController textEditingController_2 = TextEditingController();

  @override
  void initState() {
    sum = 0;
    str1 = '';
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
          title: const Text('간단한 덧셈 계산기'),
          centerTitle: false,
        ),
        body: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              // Text(
              //   '덧셈 결과 : $sum',
              //   style: TextStyle(
              //     fontSize: 20,
              //   ),
              // ),
              TextField(
                controller: textEditingController,
                keyboardType: TextInputType.number,
                decoration: InputDecoration(
                  labelText: '숫자1을 입력하세요 ',
                  enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(width: 4,color: Colors.green),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(width: 6,color: Colors.blue),
                    borderRadius: BorderRadius.circular(15),
                  )
                ),
                
              ),
              TextField(
                controller: textEditingController_2,
                keyboardType: TextInputType.number,
              ),
              ElevatedButton.icon(
                onPressed: () {
                  if (textEditingController.text.trim().isEmpty ||
                      textEditingController_2.text.trim().isEmpty) {
                    textSnackBar(context);
                  } else {
                    setState(() {
                      sum = int.parse(textEditingController.text) +
                          int.parse(textEditingController_2.text);
                    });
                    setState(() {
                      str1 = comment(sum);
                    });
                  }
                },
                icon: Icon(Icons.add),
                label: const Text(
                  '덧셈 확인',
                  textAlign: TextAlign.right,
                ),
                style: ButtonStyle(
                  minimumSize: MaterialStateProperty.all(Size(1000, 30)),
                  alignment: Alignment.centerLeft,
                  shape: MaterialStateProperty.all(RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(40))),
                ),
              ),
              const SizedBox(
                height: 30,
              ),
              
              Text(
                str1,
                style: const TextStyle(
                  color: Colors.red,
                ),
              )
            ],
          ),
        ),
      ),
    );
  }

  textSnackBar(BuildContext context) {
    ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
      content: Text('숫자를 입력해주세요'),
      duration: Duration(seconds: 2),
      backgroundColor: Colors.red,
    ));
  }

  comment(int sum) {
    return '입력하신 숫자의 합은 $sum 입니다.';
  }
}
