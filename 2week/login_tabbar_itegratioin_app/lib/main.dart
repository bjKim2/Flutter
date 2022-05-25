import 'package:flutter/material.dart';
import 'package:login_tabbar_itegratioin_app/animal_tabbar.dart';

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

  final tec = TextEditingController();
  final tec2 = TextEditingController();

  late String id;
  late String pw;
  late bool check;

  @override
  void initState() {
    super.initState();
    id = 'root';
    pw = 'qwer1234';
    check = false;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Log In'),
      ),
      body: 
        Column(
          children: [
            const Padding(
              padding: EdgeInsets.all(30.0),
              child: SizedBox(
                width: 100,
                height: 100,
                child: CircleAvatar(
                  child: Icon(
                    Icons.person,
                    size: 80,
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(10.0),
              child: TextField(
                controller: tec,
                decoration: const  InputDecoration(
                  labelText: '사용자 아이디를 입력하세요'
                ),
                keyboardType: TextInputType.text,
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(10.0),
              child: 
               TextField(
                textInputAction: TextInputAction.go,
                onSubmitted: (value){
                  if (tec.text.trim().isNotEmpty && tec2.text.trim().isNotEmpty){
                    setState(() {
                      check = tec.text == 'root' && tec2.text == 'qwer1234' ? true : false;
                      _loginCheck(context,check);
                    });
                  }else{
                    _nowriteSnackBar(context);
                  }
                },
                obscureText: true,
                controller: tec2,
                decoration: const  InputDecoration(
                  labelText: '사용자 아이디를 입력하세요'
                ),
                keyboardType: TextInputType.text,
              ),
            ),
            ElevatedButton(
              onPressed: () {
                if (tec.text.trim().isNotEmpty && tec2.text.trim().isNotEmpty){
                  setState(() {
                    check = tec.text == 'root' && tec2.text == 'qwer1234' ? true : false;
                    _loginCheck(context,check);
                  });
                }else{
                  _nowriteSnackBar(context);
                }
              }, 
              child: const Text('Log In')
            ),
          ],
        ),

    );
  }



  // --- functions

  //login check
  _loginCheck(BuildContext context,bool check){
    showDialog(
      context: context, 
      builder: (BuildContext context){
        return AlertDialog(
          title: check ? Text('환영합니다.') : Text('경고'),
          content: check ? Text('신원이 확인 되었습니다.') : Text('아이디와 패스와드가 일치하지 않습니다.'),
          actions: [
            ElevatedButton(
              onPressed: () {
                Navigator.of(context).pop();
                if(check){
                  Navigator.push(context,MaterialPageRoute(builder: (context) => const AnimalTabbar()));
                }
                check = false;
              },
              child: const Text('확인'),)
          ],
        );
      }
    );
  }

  _nowriteSnackBar(BuildContext context){
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(
        content: Text('입력이 올바르지 않습니다.'),
        duration: Duration(seconds: 2),
        backgroundColor: Colors.red,
      ),
    );
  }
  
}
