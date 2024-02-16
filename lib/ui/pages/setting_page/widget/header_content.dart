import 'package:bwa_masteringflutter/ui/pages/setting_page/setting_page_controller.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:intl/intl.dart';

import '../../../../shared/theme.dart';

class HeaderContent extends StatelessWidget {
  const HeaderContent({Key? key, required this.controller}) : super(key: key);

  final SettingPageController controller;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Container(
        margin: EdgeInsets.only(right: 20, left: 20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Align(
              alignment: Alignment.topCenter,
              child: Container(
                alignment: Alignment.center,
                margin: EdgeInsets.only(top: 10),
                width: 100,
                height: 30,
                decoration: BoxDecoration(
                    border:
                        Border.all(color: CupertinoColors.activeBlue, width: 2),
                    borderRadius: BorderRadius.circular(10),
                    color: Colors.lightBlue),
                child: Text(
                  "Personal",
                  style:
                      whiteTextStyle.copyWith(fontSize: 12, fontWeight: medium),
                ),
              ),
            ),
            Row(
              children: [
                Container(
                  margin: EdgeInsets.only(top: 10, right: 6),
                  width: 60,
                  height: 60,
                  decoration: const BoxDecoration(
                      image: DecorationImage(
                          image: AssetImage('assets/images/pic_filled.png'))),
                ),
                Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      controller.user!.name.toUpperCase(),
                      style: whiteTextStyle,
                      overflow: TextOverflow.ellipsis,
                    ),
                    RichText(
                      overflow: TextOverflow.ellipsis,
                      text: TextSpan(
                        style: whiteTextStyle.copyWith(fontWeight: light, fontSize: 12),
                        children: [
                          TextSpan(
                            text: controller.userId.substring(0, 3),
                          ),
                          TextSpan(
                            text: controller.censoredText.substring(3, 10),
                            style: TextStyle(color: greyColor),
                          ),
                          TextSpan(
                            text: controller.userId.substring(controller.userId.length - 2),
                          ),
                        ],
                      ),
                    )

                  ],
                ))
              ],
            ),
            Container(
              width: double.infinity,
              padding: EdgeInsets.all(10),
              margin: EdgeInsets.only(top: 50),
              decoration: BoxDecoration(
                border: Border.all(color: greyColor.withOpacity(0.2)),
                color: whiteColor,
                borderRadius: BorderRadius.circular(10)
              ),
              child: Column(
                children: [
                  Row(
                    children: [
                      Expanded(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text("Balance", style: blackTextStyle,),
                            Text(
                              NumberFormat.currency(
                                locale: 'id',
                                symbol: 'Rp ',
                                decimalDigits: 0,
                              ).format(controller.user!.balance),style: blackTextStyle.copyWith(fontWeight: extraBold, fontSize: 16),),
                          ],
                        ),
                      ),
                    ],
                  ),
                  Container(
                    margin: EdgeInsets.only(top: 20),
                    color: greyColor.withOpacity(0.3),
                    padding: EdgeInsets.all(1),
                  ),
                  SizedBox(height: 20,),
                  Row(
                    children: [
                      Expanded(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text("Income", style: blackTextStyle,),
                            Text(
                              NumberFormat.currency(
                                locale: 'id',
                                symbol: 'Rp ',
                                decimalDigits: 0,
                              ).format(0),style: blackTextStyle.copyWith(fontWeight: extraBold, fontSize: 16, color: greenColor),),
                          ],
                        ),
                      ),
                      Container(
                        color: greyColor.withOpacity(0.3),
                        padding: EdgeInsets.all(1),
                        height: 50,
                      ),
                      Expanded(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text("Expense", style: blackTextStyle,),
                            Text(
                              NumberFormat.currency(
                                locale: 'id',
                                symbol: 'Rp ',
                                decimalDigits: 0,
                              ).format(0),style: blackTextStyle.copyWith(fontWeight: extraBold, fontSize: 16, color: redColor),),
                          ],
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 20,)
                ],
              ),
            ),
            Container(
              margin: EdgeInsets.only(top: 50),
              width: double.infinity,
              height: 40,
              child: TextButton(
                style: TextButton.styleFrom(
                    backgroundColor: primaryColor,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10))),
                onPressed: () {
                  Get.dialog(
                    AlertDialog(
                      backgroundColor: Colors.white,
                      title: Text("Ready to Logout?", style: blackTextStyle.copyWith(fontWeight: extraBold),),
                      content: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Text("We'll Miss You 👋", style: blackTextStyle,),
                        ],
                      ),
                      actions: [
                        TextButton(
                          onPressed: () {
                            Get.back();
                          },
                          child: Text('Close', style: blackTextStyle,),
                        ),
                        TextButton(
                          onPressed: () {
                            controller.signOut();
                          },
                          child: Text('Sign Out', style: redTextStyle,),
                        ),
                      ],
                    ),
                  );
                },
                child: Text(
                  'Peace Out',
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
