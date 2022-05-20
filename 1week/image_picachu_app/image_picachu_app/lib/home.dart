import 'package:flutter/material.dart';

class Home extends StatelessWidget {
  const Home({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: const Text('pikachu'),
      ),
      body: SingleChildScrollView(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Padding(
                padding: const EdgeInsets.all(12.0),
                child: Image.asset(
                  'images/pikachu-1.jpg',
                  height: 20,
                  width: 300,
                  repeat : ImageRepeat.repeatX,
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(12.0),
                child: Image.asset(
                  'images/pikachu-2.jpg',
                  // height: 150,
                  // width: 150,
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(12.0),
                child: Image.asset(
                  'images/pikachu-3.jpg',
                  // height: 150,
                  // width: 150,
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Opacity(
                  opacity: 0.7,
                  child: Image.asset(
                    'images/pikachu-3.jpg',
                    height: 20,
                    width: 300,
                    repeat: ImageRepeat.repeatX,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}