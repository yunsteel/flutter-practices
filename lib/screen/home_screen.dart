import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';

class HomeScreen extends StatelessWidget {
  WebViewController webViewController = WebViewController()
    ..loadRequest(Uri.parse("https://scinapse.io"))
    ..setJavaScriptMode(JavaScriptMode.unrestricted);

  HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue,
        title: Text(
          "Scinapse world",
          style: TextStyle(color: Colors.white),
        ),
        centerTitle: true,
        actions: [
          IconButton(
              onPressed: () {
                webViewController.goBack();
              },
              icon: Icon(
                Icons.arrow_left,
                color: Colors.white,
              )),
          IconButton(
              onPressed: () {
                webViewController.goForward();
              },
              icon: Icon(
                Icons.arrow_right,
              )),
          IconButton(
              onPressed: () {
                webViewController.loadRequest(Uri.parse("https://scinapse.io"));
              },
              icon: Icon(
                Icons.home,
                color: Colors.white,
              ))
        ],
      ),
      body: WebViewWidget(
        controller: webViewController,
      ),
    );
  }
}
