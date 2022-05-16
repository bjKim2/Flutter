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
      debugShowCheckedModeBanner: false,
    );
  }
}

class MyHomePage extends StatelessWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const 
          Text(
            'Melon Juice',
            style: TextStyle(
              fontSize: 30,
            ),

          ),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Padding(
              padding: const EdgeInsets.all(30.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: const [
                  Text(
                    style: TextStyle(
                      color: Colors.orange,
                      fontWeight: FontWeight.w900,
                      fontSize: 50,
                    ),           
                    'James',   
                  ),
                  SizedBox(
                    width: 20,
                  ),
                  Text(
                    'Cathy'
                  ),
                  SizedBox(
                    width: 20,
                  ),
                  Text(
                    'Kenny'
                  ),
                ],
              ),
            ),
            
            Padding(
              padding: const EdgeInsets.fromLTRB(20, 0, 20, 0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: const [
                  Text(
                    style: TextStyle(
                      color: Colors.orange,
                      fontWeight: FontWeight.w900,
                      fontSize: 50,
                    ),           
                    'James',   
                  ),
                  SizedBox(
                    width: 20,
                  ),
                  Text(
                    'Cathy'
                  ),
                  SizedBox(
                    width: 20,
                  ),
                  Text(
                    'Kenny'
                  ),
                ],
              ),
            ),
          ],
        )
      ),
    );
  }
}