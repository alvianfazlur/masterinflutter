import 'package:bwa_masteringflutter/shared/theme.dart';
import 'package:bwa_masteringflutter/ui/pages/transaction_page/trannsaction_page.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../main_page/main_page.dart';

class SuccessCheckout extends StatelessWidget {
  const SuccessCheckout({Key? key}) : super(key: key);
  static const routeName = "/success";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: backgroundColor,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              margin: EdgeInsets.only(bottom: 80),
              width: 300,
              height: 150,
              decoration: BoxDecoration(
                  image: DecorationImage(
                      image: AssetImage('assets/images/scheduling.png'))),
            ),
            Text(
              "Well Booked 😍",
              style:
                  blackTextStyle.copyWith(fontWeight: semiBold, fontSize: 32),
            ),
            SizedBox(
              height: 10,
            ),
            Text(
              "Are you ready to explore the new\nworld of experiences?",
              textAlign: TextAlign.center,
              style: greyTextStyle.copyWith(fontWeight: light, fontSize: 16,),
            ),
            Container(
              margin: EdgeInsets.only(top: 50),
              width: 220,
              height: 55,
              child: TextButton(
                style: TextButton.styleFrom(
                    backgroundColor: primaryColor,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(17))),
                onPressed: () {
                  Get.offNamedUntil(TransactionPage.routeName, ModalRoute.withName(MainPage.routeName));
                },
                child: Text(
                  'My Bookings',
                  style: whiteTextStyle.copyWith(
                      fontWeight: medium, fontSize: 18),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
