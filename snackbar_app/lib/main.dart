import 'package:flutter/material.dart';
import 'package:snackbar_app/snackbar.dart';

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
      appBar: AppBar(
        title: const Text('Snack Bar'),
        backgroundColor: Colors.amberAccent,
      ),
      body: const MySnackBar(),
      // body : Center(
      //   child: ElevatedButton(
      //     onPressed: (){
      //       snackBarFunction(context);
      //     //   ScaffoldMessenger.of(context).showSnackBar(
      //     //     const SnackBar(
      //     //       content: Text('Elevated Button is clicked'),
      //     //       duration: Duration(microseconds: 100),
      //     //       backgroundColor: Colors.red,
      //     //     ),
      //     //   );
      //     }, 
      //     child: const Text('Elevated Button'),

      //   ),
      // ),
    );
  }

  // --- Functions
  snackBarFunction(BuildContext context){
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(
        content: Text('Elevated Button is clicked'),
        duration: Duration(seconds: 2),
        backgroundColor: Colors.red,
      ),
    );
  }


} // End