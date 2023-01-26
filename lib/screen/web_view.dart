import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';
import 'package:device_info_plus/device_info_plus.dart';

class webviewScreen extends StatefulWidget {
  const webviewScreen({super.key});

  @override
  State<webviewScreen> createState() => _webviewScreenState();

}

class _webviewScreenState extends State<webviewScreen> {
  late final WebViewController controller;
  @override
  void initState(){
    super.initState();
    
    controller = WebViewController()
    ..setJavaScriptMode(JavaScriptMode.unrestricted) 
    ..setBackgroundColor(Color(0x00000000))
    ..loadRequest(Uri.parse('https://flutter.dev'));
     }
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('WebView Example'),
      ),
      body: WebViewWidget(controller: controller,),
    );

  }
}