import 'package:bwa_masteringflutter/models/order.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import '../../../../shared/theme.dart';

class OrderCard extends StatelessWidget {
  const OrderCard(this.order, {Key? key}) : super(key: key);

  final OrderModel order;

  @override
  Widget build(BuildContext context) {
    return Container(
        margin: EdgeInsets.only(top: 16),
        padding: EdgeInsets.all(15),
        decoration: BoxDecoration(
            color: whiteColor,
            borderRadius: BorderRadius.circular(18),
            border: Border.all(color: blackColor.withOpacity(0.2))),
        child: Column(
          children: [
            Row(
              children: [
                Expanded(
                    child: Text(
                  '#${order.order_id.toString()}',
                  style: greyTextStyle,
                )),
                Container(
                    margin: EdgeInsets.only(bottom: 10),
                    padding: EdgeInsets.symmetric(horizontal: 8, vertical: 5),
                    decoration: BoxDecoration(
                        color: order.status == 'Paid'
                            ? Colors.greenAccent
                            : Colors.red,
                        borderRadius: BorderRadius.circular(12)),
                    child: Text(
                      order.status,
                      style: order.status == 'Paid'
                          ? greenTextStyle.copyWith(fontWeight: light)
                          : whiteTextStyle.copyWith(fontWeight: light),
                    )),
              ],
            ),
            Container(
              width: double.infinity,
              height: 100,
              padding: EdgeInsets.all(15),
              decoration: BoxDecoration(
                  border: Border.all(color: Colors.black.withOpacity(0.1)),
                  color: backgroundColor,
                  borderRadius: BorderRadius.circular(18)),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Column(
                    children: [
                      Row(
                        children: [
                          Expanded(
                              child: Text(
                            "+ Saldo",
                            style: blackTextStyle.copyWith(
                                color: order.status == "Paid" ? Colors.greenAccent : redColor,
                                fontWeight: extraBold),
                          )),
                          Text(
                              NumberFormat.currency(
                                locale: 'id',
                                symbol: 'Rp ',
                                decimalDigits: 0,
                              ).format(order.total_topup),
                              style: blackTextStyle.copyWith(
                                  color: order.status == "Paid" ? Colors.greenAccent : redColor,
                                  fontWeight: semiBold)),
                        ],
                      ),
                    ],
                  )
                ],
              ),
            )
          ],
        ));
  }
}
