import 'package:bwa_masteringflutter/ui/pages/checkout_page/checkout_page_controller.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import '../../../../shared/theme.dart';

class PaymentDetails extends StatelessWidget {
  const PaymentDetails({Key? key, required this.controller}) : super(key: key);

  final CheckOutPageController controller;
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(left: 25, right: 25, top: 20, bottom: 25),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(18)),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "Payment Methods",
            style:
            blackTextStyle.copyWith(fontWeight: semiBold, fontSize: 16),
          ),
          SizedBox(
            height: 16,
          ),
          Container(
            padding: EdgeInsets.only(right: 20),
            decoration: BoxDecoration(
              border: Border.all(
                color: greyColor.withOpacity(0.3), width: 2
              ),
              borderRadius: BorderRadius.circular(15)
            ),
            child: Column(
              children: [
                Container(
                  padding: EdgeInsets.all(20),
                  child: Row(
                    children: [
                      Container(
                        margin: EdgeInsets.only(right: 20),
                        width: 18,
                        height: 18,
                        decoration: BoxDecoration(
                          image: DecorationImage(image: AssetImage("assets/images/wallet_fill.png"),
                          fit: BoxFit.cover)
                        ),
                      ),
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text("Punggawa Pay", style: blackTextStyle.copyWith(fontSize: 16),),
                            Text(
                              NumberFormat.currency(
                                locale: 'id',
                                symbol: 'Rp ',
                                decimalDigits: 0,
                              ).format(controller.userController.user!.balance),
                              style: greyTextStyle.copyWith(
                                  fontWeight: medium, fontSize: 13),
                            ),
                          ],
                        ),
                      ),
                      Container(
                        width: 18,
                        height: 18,
                        decoration: BoxDecoration(
                          image: DecorationImage(image: AssetImage("assets/images/check_payment.png"))
                        ),
                      )
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
