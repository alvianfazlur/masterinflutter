import 'package:bwa_masteringflutter/models/destination.dart';
import 'package:bwa_masteringflutter/shared/theme.dart';
import 'package:bwa_masteringflutter/ui/pages/main_page/controller/homepage_controller.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:intl/intl.dart';

import '../pages/detail_page/detail_page.dart';

class NewDestination extends StatelessWidget {
  const NewDestination(
    this.destination, {
    Key? key,
  }) : super(key: key);
  final DestinationModel destination;

  @override
  Widget build(BuildContext context) {
    return GetBuilder<HomePageController>(
      builder: (HomePageController controller) => GestureDetector(
        onTap: () {
          Get.toNamed(DetailPage.routeName, arguments: {
            'destination': destination,
            'traveller': controller.traveller,
            'date': controller.selectedDate
          });
        },
        child: Container(
          margin: EdgeInsets.only(top: 16),
          decoration: BoxDecoration(
              color: whiteColor,
              borderRadius: BorderRadius.circular(18),
              border: Border.all(color: greyColor.withOpacity(0.3), width: 2)),
          child: Column(
            children: [
              Row(
                children: [
                  Container(
                    margin: EdgeInsets.only(left: 15, top: 15),
                    width: 60,
                    height: 60,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(18),
                        image: DecorationImage(
                            fit: BoxFit.cover,
                            image: NetworkImage(destination.imageurl))),
                  ),
                  Expanded(
                    child: Container(
                      margin: EdgeInsets.only(top: 15, left: 15),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            destination.name,
                            style: blackTextStyle.copyWith(
                                fontWeight: semiBold, fontSize: 18),
                          ),
                          SizedBox(
                            height: 4,
                          ),
                          Text(
                            destination.city,
                            style: greyTextStyle.copyWith(fontWeight: medium),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
              Container(
                margin: EdgeInsets.only(top: 20),
                decoration: BoxDecoration(
                    border: Border.all(color: greyColor.withOpacity(0.3))),
              ),
              Container(
                margin: EdgeInsets.only(left: 30, top: 10, bottom: 10),
                child: Row(
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "Rating",
                          style: greyTextStyle.copyWith(
                              fontSize: 12, fontWeight: medium),
                        ),
                        SizedBox(
                          height: 6,
                        ),
                        Row(
                          children: [
                            Container(
                              width: 17,
                              height: 17,
                              margin: EdgeInsets.only(right: 6),
                              decoration: BoxDecoration(
                                  image: DecorationImage(
                                      image: AssetImage(
                                          "assets/images/Star.png"))),
                            ),
                            Text(
                              destination.rating.toString(),
                              style:
                                  blackTextStyle.copyWith(fontWeight: semiBold),
                            )
                          ],
                        )
                      ],
                    ),
                    SizedBox(
                      width: 30,
                    ),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "Ticket Price",
                            style: greyTextStyle.copyWith(
                                fontSize: 12, fontWeight: medium),
                          ),
                          SizedBox(
                            height: 6,
                          ),
                          Text(
                            NumberFormat.currency(
                              locale: 'id',
                              symbol: 'Rp ',
                              decimalDigits: 0,
                            ).format(destination.price),
                            style:
                                blackTextStyle.copyWith(fontWeight: semiBold),
                          ),
                        ],
                      ),
                    ),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "Open Time",
                            style: greyTextStyle.copyWith(
                                fontSize: 12, fontWeight: medium),
                          ),
                          SizedBox(
                            height: 6,
                          ),
                          Text(
                            "08:00 - 17:00",
                            style: greyTextStyle,
                          )
                        ],
                      ),
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
