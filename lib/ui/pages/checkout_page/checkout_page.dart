import 'package:bwa_masteringflutter/shared/theme.dart';
import 'package:bwa_masteringflutter/ui/pages/checkout_page/checkout_page_controller.dart';
import 'package:bwa_masteringflutter/ui/pages/checkout_page/success_checkout.dart';
import 'package:bwa_masteringflutter/ui/pages/checkout_page/widget/details_ticket.dart';
import 'package:bwa_masteringflutter/ui/pages/checkout_page/widget/payment_details.dart';
import 'package:bwa_masteringflutter/ui/pages/checkout_page/widget/payment_summary.dart';
import 'package:bwa_masteringflutter/ui/pages/checkout_page/widget/voucher_discount.dart';
import 'package:bwa_masteringflutter/ui/pages/main_page/controller/homepage_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

class CheckoutPage extends GetView<CheckOutPageController> {
  CheckoutPage({Key? key}) : super(key: key);
  static const routeName = '/checkout';

  @override
  Widget build(BuildContext context) {

    Widget buttonPay() {
      return Container(
        margin: EdgeInsets.only(bottom: 10, left: 25, right: 25),
        width: 327,
        height: 55,
        child: TextButton(
          style: TextButton.styleFrom(
              backgroundColor: primaryColor,
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(17))),
          onPressed: () async {
            Get.dialog(
              AlertDialog(
                backgroundColor: Colors.white,
                titlePadding: EdgeInsets.symmetric(horizontal: 50, vertical: 20),
                title: Text(
                  "Book to ${controller.transactions.destination.name}",
                  style: blackTextStyle.copyWith(
                      fontWeight: extraBold, fontSize: 20),
                  textAlign: TextAlign.center,
                ),
                content: Column(
                  crossAxisAlignment:
                  CrossAxisAlignment.start,
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Text(
                      "Get Ready For Your Exciting Journey",
                      style: blackTextStyle.copyWith(fontSize: 16),
                      textAlign: TextAlign.center,
                    ),
                  ],
                ),
                actions: [
                  TextButton(
                    onPressed: () {
                      Get.back();
                    },
                    child: Text(
                      'Close',
                      style: blackTextStyle,
                    ),
                  ),
                  TextButton(
                    onPressed: () async{
                      if (controller.isSufficient() == "Gas") {
                        await controller.createTransaction(controller.transactions);
                        if (controller.status == TransactionStatus.loading) {
                          print("Loading");
                        } else if (controller.status == TransactionStatus.success) {
                          var userController = Get.find<HomePageController>();
                          print("Success");
                          Get.offAllNamed(SuccessCheckout.routeName, arguments: userController.user);
                        } else if (controller.status == TransactionStatus.failed) {
                          print("Failed");
                          ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                              content: Text(controller.error ?? 'Unknown error')));
                        }
                      } else if (controller.isSufficient() == "Kosong") {
                        Get.snackbar(
                          'Penumpang Kosong',
                          'Pilih Jumlah Penumpang Terlebih Dahulu!',
                          backgroundColor: Colors.red,
                          colorText: Colors.white,
                          snackPosition: SnackPosition.TOP,
                          duration: const Duration(seconds: 3),
                        );
                      } else {
                        Get.snackbar(
                          'Saldo Tidak Cukup',
                          'Silahkan Mengisi Saldo Terlebih Dahulu!',
                          backgroundColor: Colors.red,
                          colorText: Colors.white,
                          snackPosition: SnackPosition.TOP,
                          duration: const Duration(seconds: 3),
                        );
                      }
                    },
                    child: Text(
                      'Book',
                      style: purpleTextStyle.copyWith(fontSize: 16),
                    ),
                  ),
                ],
              ),
            );
          },
          child: Text(
            'Book a Ticket Now',
            style: whiteTextStyle.copyWith(fontWeight: medium, fontSize: 18),
          ),
        ),
      );
    }

    Widget terms() {
      return Container(
        margin: EdgeInsets.only(bottom: 30),
        child: TextButton(
          onPressed: () {
            Get.dialog(
              AlertDialog(
                backgroundColor: Colors.white,
                title: const Text("Terms and Conditions"),
                content: const Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Text("Your terms and conditions here..."),
                  ],
                ),
                actions: [
                  TextButton(
                    onPressed: () {
                      Get.back();
                    },
                    child: const Text('Close'),
                  ),
                ],
              ),
            );
          },
          child: Text(
            'Terms and Conditions',
            style: greyTextStyle.copyWith(fontWeight: light, fontSize: 16),
          ),
        ),
      );
    }

    return GetBuilder<CheckOutPageController>(
      builder: (CheckOutPageController controller) => Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: Text(
            "Ticket Checkout",
            style: blackTextStyle.copyWith(fontSize: 16, fontWeight: bold),
          ),
          leading: IconButton(
              onPressed: () {
                Get.back();
              },
              icon: Image.asset("assets/images/back_button.png")),
          bottom: PreferredSize(
            preferredSize: Size.fromHeight(4),
            child: Container(
              color: blackColor.withOpacity(0.1),
              height: 1,
            ),
          ),
        ),
        body: ListView(
          children: [
            DetailTicket(controller: controller),
            PaymentDetails(controller: controller),
            DiscountVoucher(controller: controller),
            PaymentSummary(controller: controller),
            buttonPay(),
            terms()
          ],
        ),
      ),
    );
  }
}
