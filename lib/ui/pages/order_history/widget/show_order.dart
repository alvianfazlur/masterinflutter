import 'package:bwa_masteringflutter/models/order.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../../shared/theme.dart';
import '../order_history_controller.dart';
import 'order_card.dart';

class ShowOrder extends StatelessWidget {
  const ShowOrder({Key? key, required this.orders}) : super(key: key);

  final List<OrderModel> orders;
  @override
  Widget build(BuildContext context) {
    if (orders.isEmpty) {
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
              decoration: const BoxDecoration(
                  image: DecorationImage(
                      opacity: 0.5,
                      image: AssetImage('assets/images/calendar.png'))),
            )
          ],
        ),
      );
    } else {
      return Container(
        margin: const EdgeInsets.only(bottom: 120),
        child: GetBuilder(
          builder: (OrderHistoryController controller) => Column(
            children: [
              Text("Riwayat TopUp", style: blackTextStyle.copyWith(fontWeight: semiBold, fontSize: 28),),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: orders.map((OrderModel order) {
                  return OrderCard(order);
                }).toList(),
              ),
            ],
          ),
        ),
      );
    }
  }
}
