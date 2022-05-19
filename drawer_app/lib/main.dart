import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      routes: {
        '/' :(context) => const Home(),

      },
      initialRoute: '/',
    );
  }
}

class Home extends StatelessWidget {
  const Home({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Drawer'),
      ),
      body: const Center(
        child: Text('Drawer'),
      ),
      drawer: Drawer(
        
        child: ListView(
          padding: EdgeInsets.zero,
          children: [
            const UserAccountsDrawerHeader(
              currentAccountPicture: 
                CircleAvatar(
                  backgroundImage:  AssetImage('images/pikachu-1.jpg'),
                ),
              otherAccountsPictures: [
                CircleAvatar(
                  backgroundImage: AssetImage('images/pikachu-2.jpg'),
                ),
              ],
              accountName: Text('Pikachu'), 
              accountEmail: Text('pikachu@naver.com'),
              decoration: BoxDecoration(
                color: Colors.red,
                borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(40),
                )
              ),
            ),
            ListTile(
              onTap: (() {
                //
              }),
              leading:  const Icon(
                Icons.home,
                color:  Colors.black,
              ),
              title: const Text('Home'),
              trailing: const Icon(Icons.add),
            )
          ],
        ),
      ),
    );
  }
}