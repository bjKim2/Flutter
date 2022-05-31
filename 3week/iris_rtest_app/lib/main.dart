import 'dart:convert';
import 'dart:ffi';
import 'package:http/http.dart' as http;

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

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
  final tec1 = TextEditingController();
  final tec2 = TextEditingController();
  final tec3 = TextEditingController();
  final tec4 = TextEditingController();

  late double sepalLength;
  late double sepalWidth;
  late double petalLength;
  late double petalWidth;

  late String species;
  late String imagePath;

@override
  void initState() {
    super.initState();
    species = '';
    imagePath = 'images/all.jpg';
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Iris 품종 예측'),
      ),

      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: TextField(
                controller: tec1,
                keyboardType: TextInputType.number,
                decoration: InputDecoration(
                  labelText: 'Sepal Length의 크기를 입력하세요',
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: TextField(
                controller: tec2,
                keyboardType: TextInputType.number,
                decoration: InputDecoration(
                  labelText: 'Sepal Length의 크기를 입력하세요',
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: TextField(
                controller: tec3,
                keyboardType: TextInputType.number,
                decoration: InputDecoration(
                  labelText: 'Sepal Length의 크기를 입력하세요',
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: TextField(
                controller: tec4,
                keyboardType: TextInputType.number,
                decoration: InputDecoration(
                  labelText: 'Sepal Length의 크기를 입력하세요',
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: ElevatedButton(
                onPressed:() {
                  if(tec1.text.isNotEmpty && tec2.text.isNotEmpty && tec3.text.isNotEmpty && tec4.text.isNotEmpty ){
                    findSpecies();
                  }else{
                    _showSnackBar(context);
                  }
                  
                }, 
                child:const Text('입력')
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: CircleAvatar(

                backgroundImage: AssetImage(imagePath),
                radius: 70,
              ),
            )
            
            
          ],
        ),
      ),

    );  
  }


  // -- functions

  findSpecies() async{

    sepalLength = double.parse(tec1.text);
    sepalWidth = double.parse(tec2.text);
    petalLength = double.parse(tec3.text);
    petalWidth = double.parse(tec4.text);

    var url = Uri.parse('http://localhost:8080/Rserve/response_iris.jsp?sepalLength=$sepalLength&sepalWidth=$sepalWidth&petalLength=$petalLength&petalWidth=$petalWidth');

    var response = await http.get(url);
    var decodedJSON =  json.decode(utf8.decode(response.bodyBytes));

    setState(() {
      
      species =  decodedJSON['result'];

      imagePath = species == 'setosa' ? "images/setosa.jpg" : species == 'versicolor' ? "images/versicolor.jpg" : "images/virginica.jpg";

      _showDialog(context);
    });


  }

  _showDialog(BuildContext context){
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: const Text('품종 예측 결과'),
          content: Text('입력하신 품종은 $species 입니다.'),
          actions: [
            ElevatedButton(
              onPressed: () {
                Navigator.pop(context);  
              },
              child: const Text('OK')
            ),
          ],
        );
      },
    );
  }

  _showSnackBar(BuildContext context){
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: const Text('입력 좀 하세요'),
        duration: Duration(seconds: 2)
      )
    );
  }

}