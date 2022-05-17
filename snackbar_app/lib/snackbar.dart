
import 'package:flutter/material.dart';

class MySnackBar extends StatelessWidget {
  const MySnackBar ({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child:  Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          ElevatedButton(
            onPressed: (){
              ScaffoldMessenger.of(context).showSnackBar(
                const SnackBar(
                  content: Text('Elevated Button is clicked'),
                  duration: Duration(seconds: 3),
                  backgroundColor: Colors.blue,
                ),
              );
            }, 
            style: ElevatedButton.styleFrom(
              primary: Colors.blue 
            ),
            child: const Text('Elevated Button'),
          ),
          ElevatedButton(
            onPressed: (){
              ScaffoldMessenger.of(context).showSnackBar(
                const SnackBar(
                  content: Text('Elevated Button is clicked'),
                  duration: Duration(seconds: 3),
                  backgroundColor: Colors.red,
                ),
              );
            }, 
            style: ElevatedButton.styleFrom(
              primary: Colors.red 
            ),
            child: const Text('Elevated Button'),
          ),
          
        ],
      ),
    );
  }
}

