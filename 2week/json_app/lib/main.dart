import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

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
      home: const Home(),
    );
  }
}

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  late List data;
  late List keys;
  late List values;

  @override
  void initState() {
    super.initState();
    data = [];
    getJSONData();
    keys = [];
    values = [];
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('JSON Test'),
      ),
      body: Center(
        // Android는 isLoading 센터 안쓰면 왼쪽 위에서 돌기 떄문에 센터 먼저적음
        child: data.isEmpty
            ? const Text(
                '데이터가 없습니다.') // circular progress indicator? 이란걸 쓰면 삥삥돈다
            : ListView.builder(
                itemCount: data.length,
                itemBuilder: (context, index) {
                  return Card(
                    child: Column(
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Row(
                            children: [
                              const Text(
                                'Code :',
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              Text(
                                data[index]['code'],
                              ),
                            ],
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Row(
                            children: [
                              for(int i = 1 ; i<=2 ; i++)
                                Text(
                                  'data',
                                  style: TextStyle(
                                    fontWeight: FontWeight.bold
                                  ),
                                ),
                              const Text(
                                'Name :',
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              Text(
                                data[index]['name'],
                              ),
                            ],
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Row(
                            children: [
                              const Text(
                                'Dept :',
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              Text(
                                data[index]['dept'],
                              ),
                            ],
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Row(
                            children: [
                              const Text(
                                'Phone :',
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              Text(
                                data[index]['phone'],
                              ),
                            ],
                          ),
                        ),
                      ],
                    )
                  );
                }
              ),
      ),
    );
  }

  // ---functions
  Future<bool> getJSONData() async { // Future 안적어도 되지만 적는게 async라 보기에 좋다. 
    //async 로 비동기 함수
    //var url = Uri.parse('http://localhost:8080/Flutter/student_query_flutter.jsp');
    var url = Uri.parse('https://zeushahn.github.io/Test/student2.json');
    //var url = Uri.parse('https://raw.githubusercontent.com/zeushahn/Test/main/student2.json');

    var response = await http.get(url); // build 가 끝날 때까지 기다려라
    var dataConvertedJSON = json.decode(utf8.decode(response.bodyBytes));

    // 한글화 하면서 json 파일 디코드하기
    List result = dataConvertedJSON['results'];

    setState(() {
      data.addAll(result);
      for(int i = 0 ; i <=1 ; i++){
        data[i].forEach((key, value) { 
          keys.add(key);
          values.add(value);
        });
      }
    });

    //print(response.body);
    print(keys);
    print(values);

    //get 방식은 암호화시켜서 압축시키기 떄문에 post는 잘안쓴다. // 보통 웹에서만 post를 씀
    return true;
  }
}// End
