import 'package:bwa_masteringflutter/ui/pages/credit_page/widget/topup_button.dart';
import 'package:bwa_masteringflutter/ui/pages/main_page/destination_controller/homepage_controller.dart';
import 'package:bwa_masteringflutter/ui/pages/main_page/widgets/user_card.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

import '../../../../shared/theme.dart';
import '../credit_controller.dart';

class CreditContent extends StatelessWidget {
  const CreditContent({Key? key, required this.controller}) : super(key: key);

  final CreditController controller;
  @override
  Widget build(BuildContext context) {
    var userCardController = Get.find<HomePageController>();
    return Container(
      width: double.infinity,
      height: 180,
      margin: const EdgeInsets.only(left: 30, right: 30),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          UserCard(controller: userCardController),
        ],
      ),
    );
  }
}
