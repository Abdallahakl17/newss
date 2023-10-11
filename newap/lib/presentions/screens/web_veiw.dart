// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';

class WebVeiwWidge extends StatefulWidget {
  WebVeiwWidge({super.key, required this.url});
  String url;

  @override
  State<WebVeiwWidge> createState() => _WebVeiwWidgeState();
}

class _WebVeiwWidgeState extends State<WebVeiwWidge> {
  late var contollerVeiw = WebViewController();

  @override
  void initState() {
    super.initState();
    contollerVeiw = WebViewController()..loadRequest(Uri.parse(widget.url));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(),
        body: WebViewWidget(
          controller: contollerVeiw,
        ));
  }
}
