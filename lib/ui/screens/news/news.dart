// ignore_for_file: camel_case_types, prefer_typing_uninitialized_variables

import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';
import 'package:flutter_onboarding/ui/screens/news/web_view.dart';
import 'dart:io';

void main() {
  runApp(
    const MaterialApp(
      home: news(),
    ),
  );
}

class news extends StatefulWidget {
  const news({Key? key}) : super(key: key);

  @override
  State<news> createState() => _newsState();
}

class _newsState extends State<news> {
  late WebViewController _webViewController;

  // Add from here ...
  @override
  void initState() {
    if (Platform.isAndroid) {
      WebView.platform = SurfaceAndroidWebView();
    }
    super.initState();
  }

  // ... to here.
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Padding(
          padding: const EdgeInsets.only(right: 40),
          child: Center(
            child: const Text("Artikel"),
          ),
        ),
        actions: const [],
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
          initialUrl: 'https://alamtani.com',
          javascriptMode: JavascriptMode.unrestricted,
          onWebViewCreated: (WebViewController controller) {
            _webViewController = controller;
          },
        ),
      ),
    );
  }
}
