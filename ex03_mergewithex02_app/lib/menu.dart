import 'package:flutter/material.dart';

class Menu extends StatelessWidget {
  const Menu({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Navigator_AppBar') ,
        centerTitle: false,
        actions: [
          IconButton(
            onPressed: () {
              Navigator.pushNamed(context, '1st');
            }, 
            icon: Icon(Icons.email),
          ),
          IconButton(
            onPressed: () {
              Navigator.pushNamed(context, '2nd');
            }, 
            icon: Icon(Icons.email_outlined),
            
          ),
        ],
  
      ),

      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            
            ElevatedButton(
              
              onPressed: (){
                Navigator.pushNamed(context, '1st');
              }, 
              style: ButtonStyle(
                backgroundColor:  MaterialStateProperty.all(Colors.green),
                minimumSize: MaterialStateProperty.all(const Size(100, 100)),
              ),
              child: const Text('보낸 편지함'),
            ),
            ElevatedButton(
              onPressed: (){
                Navigator.pushNamed(context, '2nd');
              }, 
              style: ButtonStyle(
              backgroundColor:  MaterialStateProperty.all(Colors.red),
              
              ),
              child: const Text('받은 편지함'),
            ),            
          ],
        ),
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
              // otherAccountsPictures: [
              //   CircleAvatar(
              //     backgroundImage: AssetImage('images/pikachu-2.jpg'),
              //   ),
              // ],
              accountName: Text('Pikachu'), 
              accountEmail: Text('pikachu@naver.com'),
              decoration: BoxDecoration(
                color: Colors.red,
                borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(40),
                  bottomRight: Radius.circular(40),
                )
              ),
            ),
            ListTile(
              onTap: (() {
                Navigator.pushNamed(context,'1st');
              }),
              leading:  const Icon(
                Icons.email,
                color:  Colors.blue,
              ),
              title: const Text('보낸 편지함'),
            ),
            ListTile(
              onTap: (() {
                Navigator.pushNamed(context,'2nd');
              }),
              leading:  const Icon(
                Icons.email_outlined,
                color:  Colors.red,
              ),
              title: const Text('받은 편지함'),
              //trailing: const Icon(Icons.add),
            ),
          ],
        ),
      ),
    );
  }
}