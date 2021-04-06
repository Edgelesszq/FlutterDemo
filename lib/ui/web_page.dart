import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_webview_plugin/flutter_webview_plugin.dart';

String selectedUrl = 'https://m3u8play.com';
const kAndroidUserAgent =
    'Mozilla/5.0 (Linux; Android 6.0; Nexus 5 Build/MRA58N) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/62.0.3202.94 Mobile Safari/537.36';

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
    return WebViewPage();
  }
}

class WebViewPage extends StatefulWidget {
  const WebViewPage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  WebViewPageState createState() => WebViewPageState();
}

class WebViewPageState extends State<WebViewPage> {
  // Instance of WebView plugin
  static final flutterWebViewPlugin = FlutterWebviewPlugin();
  // On destroy stream
  StreamSubscription _onDestroy;
  // On urlChanged stream
  StreamSubscription<String> _onUrlChanged;
  // On urlChanged stream
  StreamSubscription<WebViewStateChanged> _onStateChanged;

  StreamSubscription<WebViewHttpError> _onHttpError;

  StreamSubscription<double> _onProgressChanged;

  StreamSubscription<double> _onScrollYChanged;

  StreamSubscription<double> _onScrollXChanged;

  final _urlCtrl = TextEditingController(text: selectedUrl);

  final _codeCtrl = TextEditingController(text: 'window.navigator.userAgent');

  final _scaffoldKey = GlobalKey<ScaffoldState>();

  final _history = [];
  static WebViewPageState webViewPageState;
  void clearView() {
    if (flutterWebViewPlugin != null) {
      flutterWebViewPlugin.getCookies().then((m) {
        setState(() {
          _history.add('cookies: $m');
        });
      });
    }
  }

  @override
  void initState() {
    super.initState();
    webViewPageState = new WebViewPageState();
    flutterWebViewPlugin.close();

    _urlCtrl.addListener(() {
      selectedUrl = _urlCtrl.text;
    });

    // Add a listener to on destroy WebView, so you can make came actions.
    _onDestroy = flutterWebViewPlugin.onDestroy.listen((_) {
      if (mounted) {
        // Actions like show a info toast.
        _scaffoldKey.currentState.showSnackBar(
            const SnackBar(content: const Text('Webview Destroyed')));
      }
    });

    // Add a listener to on url changed
    _onUrlChanged = flutterWebViewPlugin.onUrlChanged.listen((String url) {
      if (mounted) {
        setState(() {
          _history.add('onUrlChanged: $url');
        });
      }
    });

    _onProgressChanged =
        flutterWebViewPlugin.onProgressChanged.listen((double progress) {
      if (mounted) {
        setState(() {
          _history.add('onProgressChanged: $progress');
        });
      }
    });

    _onScrollYChanged =
        flutterWebViewPlugin.onScrollYChanged.listen((double y) {
      if (mounted) {
        setState(() {
          _history.add('Scroll in Y Direction: $y');
        });
      }
    });

    _onScrollXChanged =
        flutterWebViewPlugin.onScrollXChanged.listen((double x) {
      if (mounted) {
        setState(() {
          _history.add('Scroll in X Direction: $x');
        });
      }
    });

    _onStateChanged =
        flutterWebViewPlugin.onStateChanged.listen((WebViewStateChanged state) {
      if (mounted) {
        setState(() {
          _history.add('onStateChanged: ${state.type} ${state.url}');
        });
      }
    });

    _onHttpError =
        flutterWebViewPlugin.onHttpError.listen((WebViewHttpError error) {
      if (mounted) {
        setState(() {
          _history.add('onHttpError: ${error.code} ${error.url}');
        });
      }
    });
  }

  @override
  void dispose() {
    // Every listener should be canceled, the same should be done with this stream.
    _onDestroy.cancel();
    _onUrlChanged.cancel();
    _onStateChanged.cancel();
    _onHttpError.cancel();
    _onProgressChanged.cancel();
    _onScrollXChanged.cancel();
    _onScrollYChanged.cancel();
    flutterWebViewPlugin.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            child: TextField(controller: _urlCtrl),
          ),
          RaisedButton(
            onPressed: () {
              flutterWebViewPlugin.launch(selectedUrl);
            },
            child: const Text('打开网址'),
          ),
          RaisedButton(
            onPressed: () {
              flutterWebViewPlugin.launch("https://www.003004.vip/");
            },
            child: const Text('漫画网址'),
          ),
          RaisedButton(
            onPressed: () {
              flutterWebViewPlugin.launch("http://www.milimili.cc/");
            },
            child: const Text('动漫网址'),
          ),
        ],
      ),
    );
  }
}
