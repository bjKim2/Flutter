import 'package:flutter/material.dart';
import 'package:listview_todo_app/model/message.dart';

class InsertList extends StatefulWidget {
  const InsertList({Key? key}) : super(key: key);

  @override
  State<InsertList> createState() => _InsertListState();
}

class _InsertListState extends State<InsertList> {
  late TextEditingController textEditingController;
  late bool cart;
  late bool clock;
  late bool pencil;

  @override
  void initState() {
    super.initState();
    cart = true;
    clock = false;
    pencil = false;
    textEditingController = TextEditingController();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Add View'),
      ),
      body: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text('구매'),
              Switch(
                value: cart, 
                onChanged: (value){
                  checkSwitch(value);
                  cart = true;
                },
              ),
              Image.asset('images/cart.png'),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text('약속'),
              Switch(
                value: clock, 
                onChanged: (value){
                  checkSwitch(value);
                  clock = value;
                },
              ),
              Image.asset('images/clock.png'),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text('스터디'),
              Switch(
                value: pencil, 
                onChanged: (value){
                  checkSwitch(value);
                  pencil = value;
                },
                
              ),
              Image.asset('images/pencil.png'),
            ],
          ),

          TextField(
            controller: textEditingController,
            decoration: const InputDecoration(
              labelText: '목록을 입력 하세요',
            ),
            keyboardType: TextInputType.text,
          ),
          const SizedBox(
            height: 50,
          ),
          ElevatedButton(
            onPressed: () {
              if(textEditingController.text.trim().isNotEmpty){
                addList();
              }

              Navigator.pop(context);
            }, 
            child: const Text('OK'),
          ),
        ],
      ),
    );
  }

  // functions

  // add todolist 
  addList(){
    Message.imagePath = cart ? 'images/cart.png' : clock ? 'images/clock.png' : 'images/pencil.png';
    Message.workList = textEditingController.text;
    Message.action = true;
  }

  checkSwitch(bool value){
    setState(() {
      if(value){
        cart = false;
        clock = false;
        pencil = false;
      }else{
        cart = true;
      }
    });
  }
  
}// End