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
      appBar: AppBar(
        title: const Text("Text with Column and Row"),
      ),
      body: Center(
        child: 
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Row(
              mainAxisAlignment: MainAxisAlignment.center,
              // mainAxisSize: MainAxisSize.min,
              children: [


                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: const [
                    Padding(
                      padding: EdgeInsets.all(8.0),
                      child: Icon(Icons.email_rounded),
                    ),

                    Padding(
                      padding: EdgeInsets.all(8.0),
                      child: Icon(Icons.account_balance),
                    ),

                    Padding(
                      padding: EdgeInsets.all(8.0),
                      child: Icon(
                        Icons.account_circle,
                        color: Colors.blue,
                      ),
                    ),


                  ],
                ),
                const SizedBox(
                  width: 10,
                ),
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: const [
                    Padding(
                      padding: EdgeInsets.all(12.0),
                      child: Text(
                        'James'
                      ),
                    ),

                    Padding(
                      padding: EdgeInsets.all(12.0),
                      child: Text(
                        'Cathy'
                      ),
                    ),

                    Padding(
                      padding: EdgeInsets.all(12.0),
                      child: Text(
                        'Kenny'
                      ),
                    ),
                  ],
                ),

              ],
            ),

          ],
        ),
      ),
    );
  }
}
