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
      home: const Home(),
      debugShowCheckedModeBanner: false,
    );
  }
}

class Home extends StatelessWidget {
  const Home({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(250, 250, 90, 8),
      appBar: AppBar(
        centerTitle: false,
        backgroundColor: Colors.green,
        title: const Text(
          'Image Ex01',
          ),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [

            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: const [
                CircleAvatar(
                  backgroundImage: AssetImage('images/pikachu-1.jpg'),
                  radius: 30,
                ),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: const [
                CircleAvatar(
                  backgroundImage: AssetImage('images/pikachu-2.jpg'),
                  radius: 30,
                ),
                SizedBox(
                  width: 10,
                ),          
                CircleAvatar(
                  backgroundImage: AssetImage('images/pikachu-3.jpg'),
                  radius: 30,
                ),
              ],
            ),
          ],
        ),
      ) 
    );
  }
}