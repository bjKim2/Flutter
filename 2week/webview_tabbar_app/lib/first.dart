import 'dart:async';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';


class FirstPage extends StatefulWidget {
  final String siteName;
  const FirstPage({Key? key,required this.siteName}) : super(key: key);

  @override
  State<FirstPage> createState() => _FirstPageState();
}

class _FirstPageState extends State<FirstPage> {
  final Completer<WebViewController> _controller =
      Completer<WebViewController>();
  bool isLoading = true; // 로딩중 중간에 뺑뻉이 도는 거 
  String siteName = 'www.daum.net';
  String siteName2 = 'www.naver.com';

  @override
  void initState() {
    if (Platform.isAndroid)  WebView.platform = AndroidWebView();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          WebView(
            initialUrl: 'https://${widget.siteName}',
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
    );
  }

  // --- functions

  _reloadSite(){
    _controller.future.then((value) => value.loadUrl('https://$siteName'));
  }
}
