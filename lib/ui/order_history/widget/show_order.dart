import 'package:bwa_masteringflutter/models/order.dart';
import 'package:bwa_masteringflutter/ui/order_history/order_history_controller.dart';
import 'package:bwa_masteringflutter/ui/order_history/widget/order_card.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../models/transaction.dart';
import '../../../../shared/theme.dart';

class ShowOrder extends StatelessWidget {
  const ShowOrder({Key? key, required this.order}) : super(key: key);

  final List<OrderModel> order;
  @override
  Widget build(BuildContext context) {
    if (order.isEmpty) {
      return Center(
        child: Column(
          children: [
            Text(
              "Kamu Belum Melakukan Topup",
              style: blackTextStyle.copyWith(fontSize: 28),
              textAlign: TextAlign.center,
            ),
            Container(
              margin: EdgeInsets.only(top: 50),
              width: 300,
              height: 300,
              decoration: BoxDecoration(
                  image: DecorationImage(
                      opacity: 0.5,
                      image: AssetImage('assets/images/calendar.png'))),
            )
          ],
        ),
      );
    } else {
      return Container(
        margin: EdgeInsets.only(bottom: 120),
        child: GetBuilder(
          builder: (OrderHistoryController controller) => Column(
            children: [
              Text("Riwayat TopUp", style: blackTextStyle.copyWith(fontWeight: semiBold, fontSize: 28),),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: order.map((OrderModel orders) {
                  return OrderCard(orders);
                }).toList(),
              ),
            ],
          ),
        ),
      );
    }
  }
}
