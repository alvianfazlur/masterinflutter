import 'dart:convert';
import 'dart:io';
import 'package:bwa_masteringflutter/shared/theme.dart';
import 'package:bwa_masteringflutter/ui/pages/credit_page/credit_page.dart';
import 'package:bwa_masteringflutter/ui/pages/payment_page/payment_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:webview_flutter/webview_flutter.dart';

import 'midtrans/midtrans.dart';

class MidtransPaymentPage extends GetView<PaymentController> {
  static const routeName = "/payment";

  @override
  Widget build(BuildContext context) {
    WebViewController webViewController = WebViewController();

    void showConfirmDialog(title, desc, message) async {
      await showModalBottomSheet(
        backgroundColor: backgroundColor,
        context: context,
        isScrollControlled: true,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
        ),
        builder: (BuildContext context) {
          return Container(
            height: 250,
            child: Padding(
              padding: const EdgeInsets.all(10),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    title,
                    style: purpleTextStyle.copyWith(
                      fontWeight: bold,
                      fontSize: 18,
                    ),
                  ),
                  SizedBox(
                    height: 25,
                  ),
                  Text(
                    desc,
                    style: purpleTextStyle.copyWith(fontWeight: medium),
                  ),
                  SizedBox(
                    height: 25,
                  ),
                ],
              ),
            ),
          );
        },
      );
    }

    handleResponse(message) {
      try {
        var title, desc;
        late Midtrans midtrans;
        if (Platform.isAndroid) {
          switch (message) {
            case 'ok':
              midtrans = Midtrans(MIDTRANS_PAYMENT_TYPE.bank_transfer,
                  MIDTRANS_STATUS_CODE.MIDTRANS_STATUS_CODE_200);
              break;
            case 'pending':
              midtrans = Midtrans(MIDTRANS_PAYMENT_TYPE.bank_transfer,
                  MIDTRANS_STATUS_CODE.MIDTRANS_STATUS_CODE_201);
              break;
            case 'error':
              midtrans = Midtrans(MIDTRANS_PAYMENT_TYPE.bank_transfer,
                  MIDTRANS_STATUS_CODE.MIDTRANS_STATUS_CODE_202);
              break;
          }
        } else {
          midtrans = Midtrans.fromString(message);
        }
        var result = midtrans.getResult();
        title = result[0];
        desc = result[1];
        if (title.length == 0 && desc.length == 0)
          Get.snackbar(
            'Error',
            'Error Occured',
            backgroundColor: Colors.red,
            colorText: Colors.white,
            snackPosition: SnackPosition.TOP,
            duration: const Duration(seconds: 3),
          );
        else
          showConfirmDialog(title, desc, message);
      } catch (e) {
        Get.snackbar(
          'Error',
          'Error Occured',
          backgroundColor: Colors.red,
          colorText: Colors.white,
          snackPosition: SnackPosition.TOP,
          duration: const Duration(seconds: 3),
        );
      }
    }

    return Scaffold(
      backgroundColor: backgroundColor,
      appBar: AppBar(
        backgroundColor: backgroundColor,
        title: Text(
          'Payment',
          style: purpleTextStyle.copyWith(
            fontSize: 18,
            fontWeight: medium,
          ),
        ),
        centerTitle: true,
        automaticallyImplyLeading: false,
        leading: IconButton(
          onPressed: () => Navigator.pushNamed(context, CreditPage.routeName),
          icon: const Icon(
            Icons.arrow_back_ios_new_rounded,
            color: Colors.purple,
          ),
        ),
      ),
      body: WebViewWidget(
        controller: webViewController
          ..setJavaScriptMode(JavaScriptMode.unrestricted)
          ..loadRequest(Uri.dataFromString(
            '''<html lang="en">
      <head>
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <script
          type="text/javascript"
          src="https://app.sandbox.midtrans.com/snap/snap.js"
          data-client-key="data-client-key"
        ></script>
      </head>
      <body onload="setTimeout(function(){pay()}, 1000)">
        <script type="text/javascript">
            function pay() {
                snap.pay('${controller.snapToken}', {
                  // Optional
                  onSuccess: function(result) {
                    Android.postMessage('ok');
                    Print.postMessage(result);
                  },
                  // Optional
                  onPending: function(result) {
                    Android.postMessage('pending');
                    Print.postMessage(result);
                  },
                  // Optional
                  onError: function(result) {
                    Android.postMessage('error');
                    Print.postMessage(result);
                  },
                  onClose: function() {
                    Android.postMessage('close');
                    Print.postMessage('close');
                  }
                });
            }
        </script>
      </body>
    </html>''',
            mimeType: 'text/html',
            encoding: Encoding.getByName('utf-8'),
          ))
          ..addJavaScriptChannel(
            'Android',
            onMessageReceived: (JavaScriptMessage receiver) {
              print('==========>>>>>>>>>>>>>> BEGIN');
              print(receiver.message);
              if (Platform.isAndroid) {
                if (receiver.message != 'undefined') {
                  handleResponse(receiver.message);
                }
              }
              print('==========>>>>>>>>>>>>>> END');
            },
          )
          ..addJavaScriptChannel(
            'Print',
            onMessageReceived: (JavaScriptMessage receiver) {
              print('==========>>>>>>>>>>>>>> BEGIN');
              print(receiver.message);
              if (receiver.message != 'undefined') {
                handleResponse(receiver.message);
              }
              print('==========>>>>>>>>>>>>>> END');
            },
          ),
      ),
    );
  }
}
