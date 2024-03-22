import 'package:bwa_masteringflutter/models/transaction.dart';
import 'package:bwa_masteringflutter/ui/pages/boarding_pass/boarding_pass.dart';
import 'package:bwa_masteringflutter/ui/pages/transaction_page/transaction_controller.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

import '../../../../shared/theme.dart';

class TransactionCard extends StatelessWidget {
  const TransactionCard(this.transaction, {Key? key}) : super(key: key);

  final TransactionModel transaction;

  @override
  Widget build(BuildContext context) {
    return GetBuilder(
      builder: (TransactionController controller) => GestureDetector(
        onTap: () {
          transaction.date.isAfter(DateTime.now().subtract(Duration(days: 1)))
              ? Get.toNamed(BoardingPass.routeName, arguments: transaction)
              : print("Expired");
          ;
        },
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
                margin: EdgeInsets.only(top: 15),
                child: controller.shouldDisplayDate(transaction.dateCreated)
                    ? Text(
                        "${transaction.dateCreated.day} ${DateFormat.MMMM().format(transaction.dateCreated)} ${transaction.dateCreated.year}",
                        style: blackTextStyle.copyWith(
                            fontWeight: semiBold, fontSize: 16),
                      )
                    : SizedBox()),
            Container(
                margin: EdgeInsets.only(top: 16),
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
                                  transaction.destination.name,
                                  style: blackTextStyle.copyWith(
                                      fontSize: 16, fontWeight: semiBold),
                                ),
                                Text(
                                  transaction.destination.city,
                                  style: greyTextStyle.copyWith(fontSize: 12),
                                )
                              ],
                            ),
                          ),
                        ),
                        Container(
                          margin: EdgeInsets.only(right: 25),
                          child: Column(
                            children: [
                              Text(
                                "Order Code",
                                style: greyTextStyle.copyWith(fontSize: 12),
                              ),
                              Text(
                                "#${transaction.id.toString().substring(0, 10).toUpperCase()}",
                                style: blackTextStyle.copyWith(
                                    fontSize: 14, fontWeight: semiBold),
                              )
                            ],
                          ),
                        )
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
                                    "${transaction.amountOfTraveler} Person",
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
                                "${transaction.date.day}/${transaction.date.month}/${transaction.date.year}",
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
                )),
          ],
        ),
      ),
    );
  }
}
