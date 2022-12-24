// ignore_for_file: camel_case_types, prefer_typing_uninitialized_variables

import 'package:flutter/material.dart';
import 'package:flutter_onboarding/ui/screens/news/web_view.dart';
import 'package:webview_flutter/webview_flutter.dart';

class weather_page extends StatefulWidget {
  const weather_page({Key? key}) : super(key: key);

  @override
  State<weather_page> createState() => _weather_pageState();
}

class _weather_pageState extends State<weather_page> {
  late WebViewController _webViewController;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Padding(
          padding: const EdgeInsets.only(right: 40),
          child: Center(
            child: const Text(
              "Cuaca",
            ),
          ),
        ),
      ),
      body: WillPopScope(
        onWillPop: () async {
          if (await _webViewController.canGoBack()) {
            await _webViewController.goBack();
            return false;
          } else {
            return true;
          }
        },
        child: WebView(
          initialUrl: 'https://www.msn.com/id-id/cuaca',
          javascriptMode: JavascriptMode.unrestricted,
          onWebViewCreated: (WebViewController controller) {
            _webViewController = controller;
          },
        ),
      ),
    );
  }
}
