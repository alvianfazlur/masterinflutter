import 'package:bwa_masteringflutter/shared/theme.dart';
import 'package:bwa_masteringflutter/ui/pages/boarding_pass/boarding_pass.dart';
import 'package:bwa_masteringflutter/ui/pages/detail_ticket/detail_card.dart';
import 'package:bwa_masteringflutter/ui/pages/detail_ticket/detail_ticket_controller.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:intl/intl.dart';

class DetailTicketPage extends GetView<DetailTicketController> {
  const DetailTicketPage({Key? key}) : super(key: key);

  static const routeName = "/detail-ticket";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Detail Ticket",
          style: blackTextStyle.copyWith(fontWeight: semiBold, fontSize: 16),
        ),
        centerTitle: true,
        leading: IconButton(
            onPressed: () {
              Get.back();
            },
            icon: Image.asset("assets/images/back_button.png")),
      ),
      body: Container(
        height: MediaQuery.sizeOf(context).height,
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Container(
                  margin: EdgeInsets.only(left: 10, top: 30),
                  width: 150,
                  height: 30,
                  decoration: BoxDecoration(
                      image: DecorationImage(
                          image: AssetImage(
                              "assets/images/logo_punggawa_travel_splash.png"))),
                ),
                Container(
                  margin: EdgeInsets.only(right: 25, top: 30),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      Text(
                        "Ticket Order",
                        style: greyTextStyle.copyWith(fontSize: 12),
                      ),
                      Text(
                        "#${controller.transaction.id?.toUpperCase()}",
                        style: blackTextStyle.copyWith(
                            fontSize: 12, fontWeight: semiBold),
                      )
                    ],
                  ),
                ),
              ],
            ),
            DetailTicketCard(controller: controller,),
            controller.transaction.date
                    .isAfter(DateTime.now().subtract(Duration(days: 1)))
                ? Container(
                    padding: EdgeInsets.all(20),
                    margin: EdgeInsets.only(left: 10, right: 25, top: 15),
                    width: double.infinity,
                    decoration: BoxDecoration(
                        color: Colors.yellow.withOpacity(0.3),
                        borderRadius: BorderRadius.circular(10)),
                    child: Text(
                      "You are required to present the e-boarding pass at the counter. The e-boarding pass will be available on the date ${DateFormat.MMMM().format(controller.transaction.date)} ${controller.transaction.date.day}, ${controller.transaction.date.year}",
                      style: yellowTextStyle.copyWith(fontSize: 12),
                    ),
                  )
                : SizedBox(),
            Expanded(
              child: SizedBox(),
            ),
            controller.transaction.date.day == DateTime.now().day
                ? Container(
                    width: double.infinity,
                    height: 50,
                    margin: EdgeInsets.only(left: 10, right: 25, bottom: 30),
                    child: TextButton(
                      style: TextButton.styleFrom(
                          backgroundColor: primaryColor,
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10))),
                      onPressed: () {
                        Get.toNamed(BoardingPass.routeName,
                            arguments: controller.transaction);
                      },
                      child: Text(
                        'Print E-Boarding Pass',
                        style: whiteTextStyle.copyWith(
                            fontWeight: medium, fontSize: 16),
                      ),
                    ),
                  )
                : Container(
                    alignment: Alignment.center,
                    margin: EdgeInsets.only(left: 10, right: 25, bottom: 30),
                    width: double.infinity,
                    height: 50,
                    decoration: BoxDecoration(
                        color: primaryColor.withOpacity(0.5),
                        borderRadius: BorderRadius.circular(10)),
                    child: Text(
                      'Print E-Boarding Pass',
                      style: whiteTextStyle.copyWith(
                          fontWeight: medium, fontSize: 16),
                    ),
                  )
          ],
        ),
      ),
    );
  }
}
