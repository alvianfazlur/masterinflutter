import 'package:bwa_masteringflutter/ui/pages/payment_page/payment_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:webview_flutter/webview_flutter.dart';

class MidtransPaymentPage extends GetView<PaymentController>{
  static const routeName = "/payment";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Midtrans Payment'),
        ),
        body: WebViewWidget(controller: WebViewController()
          ..setJavaScriptMode(JavaScriptMode.unrestricted)
          ..loadRequest(Uri.parse('https://app.sandbox.midtrans.com/snap/v2/vtweb/${controller.snapToken}'))
        )
    );
  }
}