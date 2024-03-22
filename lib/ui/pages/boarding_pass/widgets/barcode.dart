import 'package:barcode_widget/barcode_widget.dart';
import 'package:bwa_masteringflutter/ui/pages/boarding_pass/boarding_pass_controller.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '../../../../shared/theme.dart';

class BarcodeGenerator extends StatelessWidget {
  const BarcodeGenerator({Key? key, required this.controller}) : super(key: key);

  final BoardingPassController controller;
  @override
  Widget build(BuildContext context) {
    return Container(
        margin: EdgeInsets.only(left: 15, right: 15, bottom: 10),
        child: Stack(
          alignment: Alignment.center,
          children: [
            BarcodeWidget(
              height: 45,
              width: 270,
              data: "${controller.transaction.id}",
              barcode: Barcode.code128(),
              drawText: false,
              // barcode: Barcode.qrCode(
              //   errorCorrectLevel: BarcodeQRCorrectionLevel.high,
              // ),
            ),
          ],
        ));
  }
}
