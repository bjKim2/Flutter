import 'dart:io';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:image_picker/image_picker.dart';
import 'package:http_parser/http_parser.dart';

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
  File? _image;
  final picker = ImagePicker();
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xfff4f3f9),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SizedBox(height: 25.0),
          showImage(),
          SizedBox(
            height: 50.0,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: <Widget>[
              // 카메라 촬영 버튼
              FloatingActionButton(
                child: Icon(Icons.add_a_photo),
                tooltip: 'pick Iamge',
                onPressed: () {
                  getImage(ImageSource.camera);
                },
              ),

              // 갤러리에서 이미지를 가져오는 버튼
              FloatingActionButton(
                child: Icon(Icons.wallpaper),
                tooltip: 'pick Iamge',
                onPressed: () {
                  getImage(ImageSource.gallery);
                },
              ),
              SizedBox(
                width: 100,
                height: 100,
                child: Image.asset('images/smile.png'))
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              ElevatedButton(
                onPressed:() {
                  sendFile();
                }, 
                child:const Text('전송'))
            ],
          )
        ],
      ));
  }



  // functions

  Future getImage(ImageSource imageSource) async {
    final image = await picker.pickImage(source: imageSource);
    setState(() {
      _image = File(image!.path); // 가져온 이미지를 _image에 저장
    });
  }

  // widget
  Widget showImage() {
    return Container(
        color: const Color(0xffd0cece),
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.width,
        child: Center(
            child: _image == null
                ? Text('No image selected.')
                : Image.file(File(_image!.path))));
  }

  sendFile() async{ 
    var uri = Uri.parse('http://localhost:8080/Flutter/test.jsp');
    var request = http.MultipartRequest('POST', uri)
      ..fields['user'] = 'nweiz@google.com'
      ..files.add(await http.MultipartFile.fromPath(
          'test1', _image!.path ,
          contentType: new MediaType('file', 'image/jpeg'),));
    var response = await request.send();
    if (response.statusCode == 200) print('Uploaded!');
  }

}