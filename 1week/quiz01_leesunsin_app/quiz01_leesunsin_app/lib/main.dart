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
      backgroundColor: Colors.orange,
      appBar : AppBar(
        title: const Text('영웅 Card'),
        backgroundColor: Colors.deepOrange,  
      ),
      body:
        Padding(
          padding: const EdgeInsets.fromLTRB(10,10,10,10),
          child: Column(
            crossAxisAlignment:CrossAxisAlignment.start ,
            children: [

              Padding(
                padding: const EdgeInsets.fromLTRB(0,20,0,10),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: const [
                    CircleAvatar(
                      backgroundImage: AssetImage(
                        'images/Lee.jpg',
                      ),
                      radius: 50,
                    )
                  ],
                ),
              ),
              Divider(
                height: 10,
                thickness: 2,
              ),
              Padding(
                padding: const EdgeInsets.fromLTRB(0,10,0,10),
                child: Text(
                  '영웅',
                  style:TextStyle(
                    color: Colors.white
                  )
                ),
              ),
              Text(
                '이순신 장군',
                style:TextStyle(
                  color: Colors.white,
                  fontSize: 30,
                )
              ),
              Padding(
                padding: const EdgeInsets.fromLTRB(0,10,0,10),
                child: Text(
                  '영웅',
                  style:TextStyle(
                    color: Colors.white
                  )
                ),
              ),
              Padding(
                padding: const EdgeInsets.fromLTRB(0,0,0,10),
                child: Text(
                  '62전 62승',
                  style:TextStyle(
                    color: Colors.red,
                    fontSize: 30,
                  )
                ),
              ),
              Row(
                children: [
                  Column(
                    children: const[
                      Icon(
                        Icons.access_alarm,
                        color: Colors.black,
                      ),
                      Icon(
                        Icons.access_alarm,
                        color: Colors.black,
                      ),
                      Icon(
                        Icons.access_alarm,
                        color: Colors.black,
                      ),
                      Icon(
                        Icons.access_alarm,
                        color: Colors.black,
                      ),
                      Icon(
                        Icons.access_alarm,
                        color: Colors.black,
                      ),
                      Icon(
                        Icons.access_alarm,
                        color: Colors.black,
                      ),
                      Icon(
                        Icons.access_alarm,
                        color: Colors.black,
                      ),

                    ],

                  ),
                  Padding(
                    padding: const EdgeInsets.fromLTRB(5,0,0,0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: const [
                        Padding(
                          padding: const EdgeInsets.all(3.0),
                          child: Text(
                            '목포해전'
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(4.0),
                          child: Text(
                            '사천포해전'
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(3.0),
                          child: Text(
                            '당포해전'
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(4.0),
                          child: Text(
                            '한산도해전'
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(3.0),
                          child: Text(
                            '부산포해전'
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(4.0),
                          child: Text(
                            '명량해전'
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(3.0),
                          child: Text(
                            '노량해전'
                          ),
                        ),
                      ],

                    ),
                  ),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Image.asset(
                    'images/turtle.gif',
                    width: 70,
                    height: 70,
                  )
                ],
              ),
            ],
          ),
        )
    );
  }
}