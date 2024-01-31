import 'package:bwa_masteringflutter/shared/theme.dart';
import 'package:bwa_masteringflutter/ui/pages/bonus_page/bonus_controller.dart';
import 'package:bwa_masteringflutter/ui/pages/main_page/main_page.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class BonusPage extends GetView<BonusPageController> {
  static const routeName = "/bonus";

  @override
  Widget build(BuildContext context) {
    Widget BonusCard() {
      return Container(
        width: 300,
        height: 211,
        padding: EdgeInsets.all(defaultMargin),
        decoration: BoxDecoration(
            image:
                DecorationImage(image: AssetImage('assets/images/wallet.png')),
            boxShadow: [
              BoxShadow(
                  color: primaryColor.withOpacity(0.5),
                  blurRadius: 50,
                  offset: Offset(0, 10))
            ]),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Name",
                        style: whiteTextStyle.copyWith(fontWeight: light),
                      ),
                      Text(
                        controller.user.name,
                        style: whiteTextStyle.copyWith(
                            fontSize: 20, fontWeight: medium),
                        overflow: TextOverflow.ellipsis,
                      )
                    ],
                  ),
                ),
                Container(
                  width: 24,
                  height: 24,
                  margin: EdgeInsets.only(right: 6),
                  decoration: const BoxDecoration(
                      image: DecorationImage(
                          image: AssetImage('assets/images/plane.png'))),
                ),
                Text(
                  "Pay",
                  style:
                      whiteTextStyle.copyWith(fontSize: 16, fontWeight: medium),
                )
              ],
            ),
            SizedBox(
              height: 41,
            ),
            Text(
              "Balance",
              style: whiteTextStyle.copyWith(fontSize: 14, fontWeight: light),
            ),
            Text(
              controller.user.balance.toString(),
              style: whiteTextStyle.copyWith(fontSize: 26, fontWeight: medium),
            ),
          ],
        ),
      );
    }
    Widget FlyButton() {
      return Container(
        margin: EdgeInsets.only(top: 50),
        width: 220,
        height: 55,
        child: TextButton(
          style: TextButton.styleFrom(
              backgroundColor: primaryColor,
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(defaultRadius))),
          onPressed: () {
            Get.offAndToNamed(MainPage.routeName);
          },
          child: Text(
            'Start Fly Now',
            style: whiteTextStyle.copyWith(fontWeight: medium, fontSize: 18),
          ),
        ),
      );
    }

    return Scaffold(
      backgroundColor: backgroundColor,
      body: SafeArea(
          child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            BonusCard(),
            SizedBox(
              height: 80,
            ),
            Text(
              "Big Bonus 🎉",
              style:
                  blackTextStyle.copyWith(fontSize: 32, fontWeight: semiBold),
            ),
            SizedBox(
              height: 6,
            ),
            Text(
              "We give you early credit so that\nyou can buy a flight ticket",
              style: greyTextStyle.copyWith(fontSize: 16, fontWeight: light),
              textAlign: TextAlign.center,
            ),
            FlyButton()
          ],
        ),
      )),
    );
  }
}
