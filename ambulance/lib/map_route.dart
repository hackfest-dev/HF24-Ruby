import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';

class MapRoute extends StatelessWidget {
  const MapRoute({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Map Route'),
      ),
      body: WebView(
        initialUrl: 'assets/html/final.html',
        javascriptMode: JavascriptMode.unrestricted,
      ),
    );
  }
}
