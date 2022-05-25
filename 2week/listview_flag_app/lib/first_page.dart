import 'package:flutter/material.dart';
import 'package:listview_flag_app/nation.dart';

class FirstPage extends StatefulWidget {
  final List<Nation> list;
  const FirstPage({Key? key,required this.list }) : super(key: key);

  @override
  State<FirstPage> createState() => _FirstPageState();
}

class _FirstPageState extends State<FirstPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: ListView.builder(
          itemCount: widget.list.length,
          itemBuilder: (context,position){
            return GestureDetector(
              onTap: () {
                _showNationName(context,position);
              },
              child: Card(
                child: Row(
                  children: [
                    Image.asset(
                      widget.list[position].imagePath,
                      width: 100,
                      height: 100,
                      fit: BoxFit.contain,
                    ),
                    Text("    ${widget.list[position].nation.substring(0,1)+'_ '*(widget.list[position].nation.length-1)}")
                      
                  ],
                ),
              ),
            );
          }
        ),
      ),
    );
  }


  // --- functions

  _showNationName(BuildContext context,int position){
    showDialog(
      barrierDismissible: false,
      context: context, 
      builder: (BuildContext context){
        return AlertDialog(
          title: const Text('국가명'),
          content: Text('이 국가는 ${widget.list[position].nation.substring(0,1)+'_ '*(widget.list[position].nation.length-1)} 국가 입니다.'),
          actions: [
            ElevatedButton(
              onPressed: () {
                Navigator.pop(context);
              }, 
              child: Text('종료')
            )
          ],
        );
      }
    );
  }
}