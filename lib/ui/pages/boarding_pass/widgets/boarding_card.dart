import 'package:barcode_widget/barcode_widget.dart';
import 'package:bwa_masteringflutter/ui/pages/boarding_pass/boarding_pass_controller.dart';
import 'package:bwa_masteringflutter/ui/pages/boarding_pass/widgets/barcode.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import '../../../../shared/theme.dart';

class BoardingCard extends StatelessWidget {
  const BoardingCard({Key? key, required this.controller}) : super(key: key);

  final BoardingPassController controller;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      margin: EdgeInsets.only(right: 35, left: 35, top: 30, bottom: 100),
      decoration: BoxDecoration(
        color: whiteColor,
        borderRadius: BorderRadius.circular(20),
      ),
      child: Column(
        children: [
          Container(
              margin: EdgeInsets.only(bottom: 16, top: 25),
              height: 40,
              width: 158,
              decoration: BoxDecoration(
                  image: DecorationImage(
                      image: AssetImage(
                          "assets/images/logo_punggawa_travel_splash.png")))),
          Container(
              margin: EdgeInsets.only(bottom: 16, right: 15, left: 15),
              height: 60,
              width: double.infinity,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  image: DecorationImage(
                      fit: BoxFit.cover,
                      image: NetworkImage(
                          controller.transaction.destination.imageurl)))),
          Column(
            children: [
              Text(
                controller.transaction.destination.name,
                style:
                    blackTextStyle.copyWith(fontWeight: semiBold, fontSize: 18),
              ),
              Text(
                controller.transaction.destination.city,
                style: greyTextStyle.copyWith(),
              ),
              SizedBox(
                height: 30,
              ),
              Container(
                margin: EdgeInsets.only(bottom: 15, right: 15),
                child: Row(
                  children: [
                    Expanded(
                      child: Row(
                        children: [
                          Container(
                            width: 16,
                            height: 16,
                            margin: EdgeInsets.only(right: 6, left: 15),
                            decoration: BoxDecoration(
                                image: DecorationImage(
                                    image: AssetImage(
                                        'assets/images/coupon_fill.png'))),
                          ),
                          Text(
                            "Entrance Ticket",
                            style:
                                blackTextStyle.copyWith(fontWeight: semiBold),
                          ),
                        ],
                      ),
                    ),
                    Row(
                      children: [
                        Container(
                          width: 16,
                          height: 16,
                          margin: EdgeInsets.only(right: 6),
                          decoration: BoxDecoration(
                              image: DecorationImage(
                                  image: AssetImage(
                                      'assets/images/group_fill.png'))),
                        ),
                        Text(
                            "${controller.transaction.amountOfTraveler} Person",
                            style: greyTextStyle),
                      ],
                    )
                  ],
                ),
              ),
              Container(
                margin: EdgeInsets.only(bottom: 15, right: 15),
                child: Row(
                  children: [
                    Expanded(
                      child: Row(
                        children: [
                          Container(
                            width: 16,
                            height: 16,
                            margin: EdgeInsets.only(right: 6, left: 15),
                            decoration: BoxDecoration(
                                image: DecorationImage(
                                    image: AssetImage(
                                        'assets/images/calendar_fill.png'))),
                          ),
                          Text(
                            "Date",
                            style:
                                blackTextStyle.copyWith(fontWeight: semiBold),
                          ),
                        ],
                      ),
                    ),
                    Text(
                        "${controller.transaction.date.day} ${DateFormat.MMMM().format(controller.transaction.date)} ${controller.transaction.date.year}",
                        style: greyTextStyle)
                  ],
                ),
              ),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                "Ticket Order :",
                style: greyTextStyle.copyWith(fontSize: 11),
              ),
              SizedBox(
                width: 6,
              ),
              Text(
                "#${controller.transaction.id}",
                style: blackTextStyle.copyWith(fontSize: 11),
              ),
            ],
          ),
          SizedBox(
            height: 30,
          ),
          Text(
            "Pindai kode dibawah ini",
            style: blackTextStyle,
          ),
          SizedBox(
            height: 10,
          ),
          BarcodeGenerator(controller: controller),
          Text(
            "Dicetak pada : ${DateTime.now().day} ${DateFormat.MMMM().format(DateTime.now())} ${DateTime.now().year} ${DateTime.now().hour}:${DateTime.now().minute}",
            style: greyTextStyle.copyWith(fontSize: 11),
          ),
          SizedBox(
            height: 20,
          ),
        ],
      ),
    );
  }
}
