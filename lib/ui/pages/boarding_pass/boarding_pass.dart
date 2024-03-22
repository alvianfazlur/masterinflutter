import 'package:bwa_masteringflutter/shared/theme.dart';
import 'package:bwa_masteringflutter/ui/pages/boarding_pass/boarding_pass_controller.dart';
import 'package:bwa_masteringflutter/ui/pages/boarding_pass/widgets/boarding_card.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

class BoardingPass extends GetView<BoardingPassController> {
  const BoardingPass({Key? key}) : super(key: key);
  static const routeName = "/boarding-pass";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: primaryColor,
        centerTitle: true,
        title: Text(
          "Boarding Pass",
          style: whiteTextStyle.copyWith(fontSize: 16, fontWeight: semiBold),
        ),
        leading: IconButton(
            onPressed: () {
              Get.back();
            },
            icon: Image.asset(
              "assets/images/back_button.png",
              color: whiteColor,
            )),
      ),
      backgroundColor: primaryColor,
      body: Column(
        children: [
          BoardingCard(controller: controller)
        ],
      ),
    );
  }
}
