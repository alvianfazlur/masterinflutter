import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:webview_flutter/webview_flutter.dart';

class MapViewPage extends StatelessWidget{
  const MapViewPage({Key? key}) : super(key: key);
  static const routeName = "/map_view";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("title"),
        ),
        body: WebViewWidget(controller: WebViewController()
          ..setJavaScriptMode(JavaScriptMode.unrestricted)
          ..loadRequest(Uri.parse('https://www.google.com/maps/place/Politeknik+Elektronika+Negeri+Surabaya/@-7.2758471,112.7911808,17z/data=!3m1!4b1!4m6!3m5!1s0x2dd7fa10ea2ae883:0xbe22c55d60ef09c7!8m2!3d-7.2758471!4d112.7937557!16s%2Fm%2F05h3fdq?entry=ttu'))
        )
    );
  }
}