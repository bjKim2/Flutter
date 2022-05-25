
import 'package:flutter/material.dart';

class ModifySetting extends StatefulWidget {
  final String str;
  final bool on_Off;
  const ModifySetting({Key? key,required this.str,required this.on_Off}) : super(key: key);

  @override
  State<ModifySetting> createState() => _ModifySettingState();
}

class _ModifySettingState extends State<ModifySetting> {
  
  final tec = TextEditingController();
  late bool on_Off;
  late String str;
  late List params;

  @override
  void initState() {
    super.initState();
    on_Off = widget.on_Off;
    str = widget.str;
    tec.text = str;
    params = [];
  }



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title:  const Text('수정화면'),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Padding(
            padding: const EdgeInsets.all(10.0),
            child: TextField(
              controller: tec,
              decoration: InputDecoration(
                labelText: '글자를 입력하세요',
              ),
            ),
          ),
          SizedBox(
            height: 10,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                on_Off ? 'On':'Off',
              ),
              Switch(
                value: on_Off, 
                onChanged: (value){
                  setState(() {
                    on_Off = value; 
                  });
                }
              ),
            ],
          ),
          SizedBox(
            height: 20,
          ),
          ElevatedButton(
            onPressed: (){
              setState(() {
                str = tec.text;
                params.add(str);
                params.add(on_Off);
                
              });
              Navigator.pop(context,params);
            }, 
            child: const Text('OK')
          ),

        ],
      ),
    );
  }
}