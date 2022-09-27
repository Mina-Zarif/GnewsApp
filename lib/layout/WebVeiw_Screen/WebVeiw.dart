import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';

// ignore: camel_case_types, must_be_immutable
class WebView_Screen extends StatelessWidget {
  late String url;
  WebView_Screen(this.url, {super.key});
  @override
  Widget build(BuildContext context) {
    return  Scaffold(

      body: SafeArea(child: WebView(initialUrl: url,)) ,
    );
  }
}
