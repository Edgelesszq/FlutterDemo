import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';

class WebPage extends StatefulWidget {
  @override
  WebPageState createState() => WebPageState();
}

class WebPageState extends State<WebPage> {
  @override
  void initState() {
    super.initState();
    // Enable hybrid composition.
  }

  @override
  Widget build(BuildContext context) {
    return WebView(
      initialUrl: 'https://m3u8play.com/',
    );
  }
}
