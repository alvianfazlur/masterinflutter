import 'package:bwa_masteringflutter/ui/pages/detail_ticket/detail_ticket_controller.dart';
import 'package:flutter/material.dart';

import '../../../shared/theme.dart';

class DetailTicketCard extends StatelessWidget {
  const DetailTicketCard({Key? key, required this.controller}) : super(key: key);

  final DetailTicketController controller;
  @override
  Widget build(BuildContext context) {
    return Container(
        margin: EdgeInsets.only(top: 25, left: 10, right: 25),
        decoration: BoxDecoration(
            color: whiteColor,
            borderRadius: BorderRadius.circular(18),
            border: Border.all(color: blackColor.withOpacity(0.2))),
        child: Column(
          children: [
            Row(
              children: [
                Expanded(
                  child: Container(
                    margin: EdgeInsets.only(left: 25, top: 20),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          controller.transaction.destination.name,
                          style: blackTextStyle.copyWith(
                              fontSize: 16, fontWeight: semiBold),
                        ),
                        Text(
                          controller.transaction.destination.city,
                          style: greyTextStyle.copyWith(fontSize: 12),
                        )
                      ],
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(
              height: 20,
            ),
            Container(
              decoration: BoxDecoration(
                  border:
                  Border.all(color: greyColor.withOpacity(0.2))),
            ),
            SizedBox(
              height: 20,
            ),
            Container(
              margin: EdgeInsets.only(left: 25, right: 25, bottom: 25),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Person",
                        style: greyTextStyle.copyWith(fontSize: 12),
                      ),
                      Row(
                        children: [
                          Container(
                            margin: EdgeInsets.only(right: 6),
                            width: 14,
                            height: 14,
                            decoration: BoxDecoration(
                                image: DecorationImage(
                                    image: AssetImage(
                                        "assets/images/group_fill.png"))),
                          ),
                          Text(
                            "${controller.transaction.amountOfTraveler} Person",
                            style: greyTextStyle.copyWith(fontSize: 12),
                          ),
                        ],
                      )
                    ],
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Date",
                        style: greyTextStyle.copyWith(fontSize: 12),
                      ),
                      Text(
                        "${controller.transaction.date.day}/${controller.transaction.date.month}/${controller.transaction.date.year}",
                        style: blackTextStyle.copyWith(
                            fontSize: 12, fontWeight: semiBold),
                      )
                    ],
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Status",
                        style: greyTextStyle.copyWith(fontSize: 12),
                      ),
                      Text(
                        "Lunas",
                        style: greenTextStyle.copyWith(
                            fontSize: 12, fontWeight: semiBold),
                      )
                    ],
                  ),
                ],
              ),
            )
          ],
        ));
  }
}
