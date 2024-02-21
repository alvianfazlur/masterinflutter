import 'package:bwa_masteringflutter/models/order.dart';
import 'package:bwa_masteringflutter/ui/order_history/order_history_controller.dart';
import 'package:bwa_masteringflutter/ui/order_history/widget/order_card.dart';
import 'package:bwa_masteringflutter/ui/order_history/widget/show_order.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../shared/theme.dart';

class OrderHistoryPage extends GetView<OrderHistoryController> {
  const OrderHistoryPage({Key? key}) : super(key: key);
  static const routeName = '/order-history';


  @override
  Widget build(BuildContext context) {
    return GetBuilder(
      builder: (OrderHistoryController controller) => Scaffold(
        body: ListView(
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                children: [
                  ShowOrder(orders: controller.orderData),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
