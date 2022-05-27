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

  @override
  void initState() {
    if (Platform.isAndroid)  WebView.platform = AndroidWebView();
    super.initState();
    
    bool a = false;
    String b;
    
    print('aa');

    
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.amber,
        title: Center(
          child: Column(
            children: const [
              Text('Floating Button Webview',
                style: TextStyle(
                  color: Colors.black,
                ),
              ),
              
            ],
          ),
        ),
        toolbarHeight: 50,

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
            return  Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                FloatingActionButton(
                  backgroundColor: Colors.redAccent,
                  onPressed: (){
                    controller.data!.goBack(); // !은 옵셔널 데이터가없을시는 안하는 듯
                  },
                  child: const Icon(Icons.arrow_back_ios)
                ),
                const SizedBox(
                  width: 20,
                ),
                FloatingActionButton(
                  backgroundColor: Colors.amber,
                  onPressed: (){
                    controller.data!.reload();
                  },
                  child: const Icon(Icons.replay),
                ),
                const SizedBox(
                  width: 20,
                ),
                FloatingActionButton(
                  onPressed: (){
                    controller.data!.goForward();
                  },
                  child: const Icon(Icons.arrow_forward_ios),
                ),
              ],
            );
          }
          return Stack();
        }
      ),
    );
  }

  // --- functions

  _reloadSite(){
    _controller.future.then((value) => value.loadUrl('https://$siteName'));


  }
}
