import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

import 'dart:math';


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
  late int num1;


  @override
  void initState() {
    super.initState();

    data = [];
    getJSONData();
    num1 = 100;

    Random random = Random();
    // print(random.nextBool());
    // print(random.nextBool());
    // print(random.nextBool());
    // print(random.nextBool());
    // print(random.nextBool());
    // print(random.nextBool());


  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('JSON Movie'),
      ),
      body: Center(
        child: data.isEmpty ? 
          Text('데이터가 없습니다.') 
          : 
          ListView.builder(
            itemCount: (data.length ~/3 + data.length %3),
            itemBuilder: (context, index) {
              return Row(
                children: [
                  Column(
                    children: [
                      GestureDetector(
                        onTap: () {

                            setState(() {
                              
                              num1 = index*3;
                              print(num1);
                            });

                        },
                        child: SizedBox(
                          width: 200,
                          height: 100,
                          child: Card(
                            color: num1 == index*3 ? Colors.red : Colors.white,
                            child: Row(
                              children: [
                                Image.network(
                                  data[index*3]['image'],
                                  width: 100,
                                  height: 200,
                                ),
                                Text('    ${data[index]['title']}')
                              ],  
                            ),
                          ),
                        ),
                      ),
                      
                      (index*3 +1) <= data.length -1? 
                      GestureDetector(
                        onTap: () {
                          setState(() {
                            
                          num1 = index*3+1;
                          });
                        },
                        child: SizedBox(
                          width: 200,
                          height: 100,
                          child: Card(
                            color: num1 == index*3 +1 ? Colors.red : Colors.white,
                            child: Row(
                              children: [
                                Image.network(
                                  data[(index*3 +1) >= data.length -1? 0 : index*3 +1 ]['image'],
                                  width: 100,
                                  height: 200,
                                ),
                                Text('    ${data[(index*3 +1) >= data.length -1? 0 : index*3 +1]['title']}')
                              ],  
                            ),
                          ), 
                        ),
                      ) : Text(''),
                      
                    ],
                  ),
                  (index*3 +2) <= data.length -1? 
                  GestureDetector(
                    onTap: () {
                      setState(() {
                        
                      num1 = index*3+2;
                      });
                    },
                    child: SizedBox(
                      width: 200,
                      height: 200,
                      child: Card(
                        color: num1 == index*3 +2 ? Colors.red : Colors.white,
                        child: Row(
                          children: [
                            Image.network(
                              data[(index*3 +2) >= data.length -1? 0 : index*3 +2]['image'],
                              width: 100,
                              height: 200,
                            ),
                            Text('    ${data[(index*3 +2) >= data.length -1? 0 : index*3 +2]['title']}')
                          ],  
                        ),
                      ),
                    ),
                  ) : Text(''),
                ],
              );
            },),

      ),
    );
  }

  //--functions
  Future<bool> getJSONData() async{
    
    var url  = Uri.parse('https://raw.githubusercontent.com/zeushahn/Test/main/movies.json');
    //var url  = Uri.parse('https://zeushahn.github.io/Test/movies.json');

    var response = await http.get(url);
    //var dataConvertedJSON = json.decode(utf8.decode(response.bodyBytes));
    var dataConvertedJSON = json.decode(utf8.decode(response.bodyBytes));
    setState(() {
      data.addAll(dataConvertedJSON['results']);
    });

    return true;
  }
}