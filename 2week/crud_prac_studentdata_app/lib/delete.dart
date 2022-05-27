import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;


class Delete extends StatefulWidget {
  final String code;
  final String name;
  final String dept;
  final String phone;

  const Delete({Key? key,required this.code,required this.name,required this.dept,required this.phone}) : super(key: key);

  @override
  State<Delete> createState() => _DeleteState();
}

class _DeleteState extends State<Delete> {

  // Property
  final codeController = TextEditingController(); 
  final nameController = TextEditingController(); 
  final deptController = TextEditingController(); 
  final phoneController = TextEditingController(); 

  late String code;
  late String name;
  late String dept;
  late String phone;
  late String result;


  @override
  void initState() {
    super.initState();

    codeController.text = widget.code;
    nameController.text = widget.name;
    deptController.text = widget.dept;
    phoneController.text = widget.phone;
    
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        FocusScope.of(context).unfocus();
      },
      child: Scaffold(
        appBar: AppBar(
          title : const Text('Delete for CRUD'),
        ),
        body: Center(
          child: Padding(
            padding: const EdgeInsets.all(20.0),
            child: Column(
              children: [
                TextField(
                  readOnly: true,
                  controller: codeController,
                  decoration: const InputDecoration(
                    labelText: '학번',
                    enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(
                        width: 0,
                      )
                    ),
                  ),
                  keyboardType: TextInputType.text,
                ),
                TextField(
                  readOnly: true,
                  controller: nameController,
                  decoration: const InputDecoration(
                    labelText: '성명',
                    enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(
                        width: 0,
                      )
                    ),
                  ),
                  keyboardType: TextInputType.text,
                ),
                TextField(
                  readOnly: true,
                  controller: deptController,
                  decoration: const InputDecoration(
                    labelText: '전공',
                    enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(
                        width: 0,
                      )
                    ),
                  ),
                  keyboardType: TextInputType.text,
                ),
                TextField(
                  readOnly: true,
                  controller: phoneController,
                  decoration: const InputDecoration(
                    labelText: '전화번호',
                    enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(
                        width: 0,
                      )
                    ),
                  ),
                  keyboardType: TextInputType.number,
                ),
                const SizedBox(
                  height: 30,
                ),
                ElevatedButton(
                  onPressed: () {
                    code = codeController.text;
                    name = nameController.text;
                    dept = deptController.text;
                    phone = phoneController.text;
                    deleteAction();
                  },
                  child: const Text('삭제')
                ),
              ],
            ),
          ),
        ),
        
      ),
    );
  }

  // --- functions
  deleteAction() async{
    
    var url = Uri.parse(
      'http://localhost:8080/Flutter/student_delete_return_flutter.jsp?code=$code'
    );

    var response = await http.get(url);

    setState(() {
      var dataConvertedJSON = json.decode(utf8.decode(response.bodyBytes));

      result = dataConvertedJSON["result"];

      if(result == "OK"){
        _showDialog(context);

      }else if(result == "ERROR"){
        errorSnackBar(context);
      }
    });
  }

  // -- functions

  _showDialog(BuildContext context){
    showDialog(context: context, 
    builder: (BuildContext context){
      return AlertDialog(
        title:  const Text('삭제 결과'),
        content: const Text('삭제가 완료 되었습니다.'),
        actions: [
          TextButton(
            onPressed:(){
              Navigator.of(context).pop();
              Navigator.of(context).pop();
            }, 
            child: const Text('OK'),
          )
        ],
      );
    }
    );
  }

  errorSnackBar(BuildContext context){
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(
        content: Text('삭제 에러가 발생했습니다.'),
        duration: Duration(seconds: 2),
        backgroundColor: Colors.red,
      )
    );
  }
}//End