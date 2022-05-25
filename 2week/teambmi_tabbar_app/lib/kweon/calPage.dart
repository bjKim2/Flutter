import 'package:flutter/material.dart';
import 'package:teambmi_tabbar_app/kweon/message.dart';

class CalPage extends StatefulWidget {
  const CalPage({Key? key}) : super(key: key);

  @override
  State<CalPage> createState() => _CalPageState();
}

class _CalPageState extends State<CalPage> {
  // Property
  late TextEditingController height, weight;

  @override
  void initState() {
    height = TextEditingController();
    weight = TextEditingController();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        FocusScope.of(context).unfocus();
      },
      child: Scaffold(
        appBar: AppBar(
          title: const Text('merong'),
        ),
        body: Padding(
          padding: const EdgeInsets.all(20.0),
          child: SingleChildScrollView(
            child: Center(
              child: Column(
                children: [
                  const Padding(
                    padding: EdgeInsets.fromLTRB(0, 130, 0, 50),
                    child: Text(
                      "BMI 계산기",
                      style: TextStyle(
                        fontSize: 30,
                        color: Colors.green,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: TextField(
                      controller: height,
                      decoration: InputDecoration(
                        labelText: "키를 입력하세요(cm)",
                        enabledBorder: OutlineInputBorder(
                          borderSide: const BorderSide(
                            width: 2,
                            color: Colors.green,
                          ),
                          borderRadius: BorderRadius.circular(5),
                        ),
                        focusedBorder: const OutlineInputBorder(
                          borderSide: BorderSide(
                            width: 3,
                            color: Colors.blue,
                          ),
                        ),
                      ),
                      keyboardType: TextInputType.number,
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: TextField(
                      controller: weight,
                      decoration: InputDecoration(
                        labelText: "몸무게를 입력하세요(kg)",
                        enabledBorder: OutlineInputBorder(
                          borderSide: const BorderSide(
                            width: 2,
                            color: Colors.green,
                          ),
                          borderRadius: BorderRadius.circular(5),
                        ),
                        focusedBorder: const OutlineInputBorder(
                          borderSide: BorderSide(
                            width: 3,
                            color: Colors.blue,
                          ),
                        ),
                      ),
                      keyboardType: TextInputType.number,
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.fromLTRB(0, 50, 0, 5),
                    child: ElevatedButton.icon(
                      onPressed: () {
                        checkgo();
                      },
                      icon: const Icon(Icons.calculate),
                      label: const Text("계산하기"),
                      style: ButtonStyle(
                          fixedSize:
                              MaterialStateProperty.all(const Size(330, 40))),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.fromLTRB(0, 5, 0, 10),
                    child: ElevatedButton.icon(
                      onPressed: () {
                        removeall();
                      },
                      icon: const Icon(Icons.restore),
                      label: const Text("다시 입력하기"),
                      style: ButtonStyle(
                          fixedSize:
                              MaterialStateProperty.all(const Size(330, 40)),
                          backgroundColor: MaterialStateProperty.all(Colors.red[400]),
                          ),
                          
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  // --- functions

  // 이동하는 함수
  checkgo() {
    if (height.text.isEmpty || weight.text.isEmpty) {
      showSnackBar(context, "숫자를 입력해주세요", Colors.red);
    } else {
      Message.height = height.text;
      Message.weight = weight.text;
      Navigator.pushNamed(context, "resultPage");
    }
  }

  // 재입력 하는 함수
  removeall() {
    setState(() {
      height.text = "";
      weight.text = "";
    });
  }

    // snackbar 제공 함수
  showSnackBar(BuildContext context, String result, Color col) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(
          result,
        ),
        duration: const Duration(seconds: 1),
        backgroundColor: col,
      ),
    );
  }
}
