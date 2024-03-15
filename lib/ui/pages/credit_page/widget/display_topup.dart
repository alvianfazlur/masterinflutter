import 'package:bwa_masteringflutter/shared/theme.dart';
import 'package:bwa_masteringflutter/ui/pages/credit_page/credit_controller.dart';
import 'package:bwa_masteringflutter/ui/pages/credit_page/credit_page.dart';
import 'package:bwa_masteringflutter/ui/pages/credit_page/widget/button_nominal.dart';
import 'package:bwa_masteringflutter/ui/pages/credit_page/widget/input_saldo.dart';
import 'package:bwa_masteringflutter/ui/pages/payment_page/payment_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:webview_flutter/webview_flutter.dart';

class DisplayTopUp extends StatelessWidget {
  DisplayTopUp({Key? key}) : super(key: key);
  WebViewController webViewController = WebViewController();
  static const routeName = "/display-topup";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        leading: IconButton(
          onPressed: () {
            Get.back();
          },
          icon: Image.asset('assets/images/back_button.png'),
        ),
        title: Text("Top Up", style: blackTextStyle.copyWith(fontSize: 16, fontWeight: semiBold),),
      ),
      backgroundColor: backgroundColor,
      body: GetBuilder(
        builder: (CreditController controller) => Container(
          padding: EdgeInsets.all(10),
          margin: EdgeInsets.only(
              left: defaultMargin, right: defaultMargin, top: 30),
          child: ListView(
            children: [
              Column(
                children: [
                  Container(
                    margin: EdgeInsets.only(bottom: 10),
                    width: 88,
                    height: 32,
                    decoration: BoxDecoration(
                        image: DecorationImage(
                            image:
                                AssetImage("assets/images/midtrans_icon.png"))),
                  ),
                  Text(
                    "Midtrans",
                    style: blackTextStyle.copyWith(
                        fontWeight: medium, fontSize: 15),
                  ),
                  InputSaldo(controller: controller),
                  SizedBox(
                    height: 10,
                  ),
                  Container(
                    width: double.infinity,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Container(
                          child: Row(
                            children: [
                              ButtonNominal(nominal: 50000),
                              ButtonNominal(nominal: 100000),
                            ],
                          ),
                        ),
                        Container(
                          child: Row(
                            children: [
                              ButtonNominal(nominal: 150000),
                              ButtonNominal(nominal: 200000),
                            ],
                          ),
                        ),
                        Container(
                          child: Row(
                            children: [
                              ButtonNominal(nominal: 500000),
                              ButtonNominal(nominal: 1000000),
                            ],
                          ),
                        ),
                        Visibility(
                          visible: controller.selectedNominal.isNotEmpty &&
                              controller.selectedNominal[0] >= 10000,
                          child: Align(
                            alignment: Alignment.bottomCenter,
                            child: Container(
                              margin: EdgeInsets.only(top: 30),
                              width: double.infinity,
                              height: 50,
                              child: TextButton(
                                style: TextButton.styleFrom(
                                    backgroundColor: primaryColor,
                                    shape: RoundedRectangleBorder(
                                        borderRadius:
                                            BorderRadius.circular(10))),
                                onPressed: () async {
                                  Get.dialog(
                                    Center(
                                      child: CircularProgressIndicator(),
                                    ),
                                    barrierDismissible: false,
                                  );
                                  await controller.topUp(
                                    id: controller.user!.id,
                                    balance: controller.selectedNominal[0],
                                    name: controller.user!.name,
                                  );
                                  Get.back();
                                  Get.toNamed(MidtransPaymentPage.routeName,
                                      arguments: controller.snapToken);
                                },
                                child: Text(
                                  'Top Up Now',
                                  style: whiteTextStyle.copyWith(
                                      fontWeight: medium),
                                ),
                              ),
                            ),
                          ),
                        )
                      ],
                    ),
                  )
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
