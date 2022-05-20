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
  late TextEditingController textEditingController;

  @override
  void initState() {
    textEditingController = TextEditingController();
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
          title: const Text('Text Field'),
        ),
        body: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            children: [
              TextField(
                maxLength: 100,
                controller: textEditingController,
                //decoration: const InputDecoration(labelText: '글자를 입력하세요'),
                keyboardType: TextInputType.text,
                //테두리가능 border 쪽이라는 데.. 각자 공부
              ),
              const SizedBox(
                height: 20,
              ),
              ElevatedButton(
                onPressed: () {
                  // 사용자의 입력 내용 확인
                  if(textEditingController.text.trim().isEmpty){
                    errorSnackBar(context);
                  }else{
                    showSnackBar(context);
                  }
                }, 
                child: const Text('출력'),
              ),
            ],
          ),
        ),
      ),
    );
  }

  // -- functions


  // Dec 텍스트필드에 입력을 안하거나 한 경우 나눠서 스낵바
  errorSnackBar(BuildContext context){
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(
        content: Text('글자를 입력하세요'),
        duration: Duration(seconds: 2), 
        backgroundColor: Colors.red,
      )
    );
  }
  
  // Dec 텍스트필드에 입력을 안하거나 한 경우 나눠서 스낵바
  showSnackBar(BuildContext context){
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text('입력한 글자는 ${textEditingController.text} 입니다.'),
        duration: Duration(seconds: 2),
        backgroundColor: Colors.blue,
      )
    );
  }



}