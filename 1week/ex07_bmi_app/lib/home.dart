import 'package:flutter/material.dart';


class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  late bool check1;

  @override
  void initState() {
    check1 = false;
    super.initState();
  }
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.orange[100],
      
      body: Padding(
        padding: const EdgeInsets.all(0.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            SizedBox(
              height: 100,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [

                Text(
                  '지금도 지방세포 분열 중...',
                  style: TextStyle(
                    fontSize: 20,
                    color: Colors.purple[400],
                    fontFamily: 'NotSans',
                    fontStyle: FontStyle.italic,
                  ),
                ),

              ],
              
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                'BMI Collector',
                style: TextStyle(
                  
                  fontSize: 40,
                  color: Colors.purple[400],
                  fontFamily: 'NotSans',
                  fontStyle: FontStyle.normal,
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(0,50,0,50),
              child: Image.asset(
                'images/hamburger.jpg',
                height: 400,
                width: 450,
                fit: BoxFit.fill,
                //centerSlice: new Rect.fromLTRB(0, 0, 0,0),
                
              ),
            ),

            ElevatedButton.icon(
              onPressed: () {
                setState(() {
                  check1 = true;
                  Navigator.pushNamed(context, 'bmiinsert');
                });
              },
              icon: Icon(Icons.face_rounded),
              style: ButtonStyle(
                backgroundColor: MaterialStateProperty.all(Colors.purple),
                minimumSize: MaterialStateProperty.all(Size(100, 50))
              ),
              label:  const Text(
                '내 체질량 지수 걱정해보기',
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.w400,
                ),
              ),
            ),
          ],
        ),
      ),
    );   
  }
}