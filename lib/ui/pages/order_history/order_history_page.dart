import 'package:bwa_masteringflutter/ui/pages/order_history/widget/show_order.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'order_history_controller.dart';

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
