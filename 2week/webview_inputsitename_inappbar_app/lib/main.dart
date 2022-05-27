import 'dart:async';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final Completer<WebViewController> _controller =
      Completer<WebViewController>();
  bool isLoading = true; // 로딩중 중간에 뺑뻉이 도는 거 
  String siteName = 'www.daum.net';
  String siteName2 = 'www.naver.com';

  final tec = TextEditingController();

  @override
  void initState() {
    if (Platform.isAndroid)  WebView.platform = AndroidWebView();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: (){
        FocusScope.of(context).unfocus();
      },
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.amber,
          title: SizedBox(
            width: 600,
            height: 50,
            child: TextField(
              showCursor: true,
              autofocus: true,
              textInputAction: TextInputAction.go ,
              onSubmitted: (value){
                if(tec.text.trim().isNotEmpty){
                  setState(() {
                    
                  siteName = tec.text;
                  _reloadSite();
                  });
                }else{
                  _emptysnackBar();
                }
              },
              controller: tec,
              decoration: InputDecoration(
                enabledBorder: OutlineInputBorder(
                  borderSide: BorderSide(
                    width: 0,
                  )
                ),
                focusedBorder: OutlineInputBorder(
                  borderSide: BorderSide(
                    width: 2,
                  )
                ),
                labelText : 'site이름을 입력하세요!',
              ),
            ),
          ),
          actions: [
            IconButton(
              onPressed: (){
                if(tec.text.trim().isNotEmpty){
                  setState(() {
                    
                  siteName = tec.text;
                  _reloadSite();
                  });
                }else{
                  _emptysnackBar();
                }
              }, 
              icon: Icon(
                Icons.ac_unit
              ),
            ),
          ],
          toolbarHeight: 100,
        ),
        body: Stack(
          children: [
            WebView(
              initialUrl: 'https://$siteName',
              javascriptMode: JavascriptMode.unrestricted,// 자바스크립트모드 제한없이 쓸수 있다.
              onWebViewCreated: (WebViewController webViewController){
                _controller.complete(webViewController); // 다불러오면 화면을 보여준다.
              },//화면 구성될 떄
              onPageFinished: (finish){
                setState(() {
                  isLoading = false;
                });
              },
              onPageStarted: (start){
                setState(() {
                  isLoading = true;
                });
              },
            ),
            isLoading ? const Center(
              child:  CircularProgressIndicator(),
            )
            : Stack(),
          ],
        ),
        floatingActionButton: FutureBuilder<WebViewController>(
          future: _controller.future,
          builder: (BuildContext context, AsyncSnapshot<WebViewController> controller){
            if(controller.hasData){//컨트롤러가 돌아갈 데이터가 있다면
              return FloatingActionButton(
                backgroundColor: Colors.redAccent,
                onPressed: (){
                  controller.data!.goBack(); // !은 옵셔널
                },
                child: const Icon(Icons.arrow_back)
              );
            }
            return Stack();
          }
        ),
      ),
    );
  }

  // --- functions

  _reloadSite(){
    _controller.future.then((value) => value.loadUrl('https://$siteName'));
  }

  _emptysnackBar(){
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: const Text('주소를 입력하세요'),
        duration:  Duration(seconds: 2),
        backgroundColor: Colors.red,
      )
    );

  }
}
