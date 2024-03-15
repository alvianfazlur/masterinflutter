import 'package:bwa_masteringflutter/models/transaction.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import '../../../../shared/theme.dart';

class TransactionCard extends StatelessWidget {
  const TransactionCard(this.transaction, {Key? key}) : super(key: key);

  final TransactionModel transaction;

  @override
  Widget build(BuildContext context) {
    DateTime selectedDate = transaction.date;
    return Container(
        margin: EdgeInsets.only(top: 16),
        padding: EdgeInsets.all(15),
        decoration: BoxDecoration(
            color: whiteColor,
            borderRadius: BorderRadius.circular(18),
            border: Border.all(color: blackColor.withOpacity(0.2))),
        child: Column(
          children: [
            Row(
              children: [
                Expanded(
                  child: Text(
                    "${selectedDate.day} ${DateFormat.MMMM().format(selectedDate!)} ${selectedDate.year}",
                    style: blackTextStyle.copyWith(fontWeight: semiBold),
                  ),
                ),
                Container(
                    margin: EdgeInsets.only(bottom: 10),
                    padding: EdgeInsets.symmetric(horizontal: 8, vertical: 5),
                    decoration: BoxDecoration(
                        color: Colors.greenAccent,
                        borderRadius: BorderRadius.circular(12)),
                    child: Text(
                      "Lunas",
                      style: greenTextStyle.copyWith(fontWeight: light),
                    )),
              ],
            ),
            Container(
              padding: EdgeInsets.all(15),
              decoration: BoxDecoration(
                  color: backgroundColor,
                  borderRadius: BorderRadius.circular(18)),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      Container(
                        margin: EdgeInsets.only(right: 6),
                        width: 24,
                        height: 24,
                        decoration: BoxDecoration(
                            image: DecorationImage(
                                image: AssetImage('assets/images/plane.jpg'))),
                      ),
                      Text(
                        "PESAWAT",
                        style: blackTextStyle.copyWith(fontWeight: bold),
                      )
                    ],
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Row(
                    children: [
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(transaction.destination.name,
                                style: greyTextStyle),
                            Row(
                              children: [
                                Text(
                                  "Jakarta",
                                  style: greyTextStyle.copyWith(fontSize: 12),
                                ),
                                SizedBox(
                                  width: 5,
                                ),
                                Icon(
                                  Icons.arrow_forward_rounded,
                                  size: 11,
                                ),
                                SizedBox(
                                  width: 5,
                                ),
                                Text(
                                  transaction.destination.city,
                                  style: greyTextStyle.copyWith(fontSize: 12),
                                )
                              ],
                            ),
                            Text(
                              '${transaction.amountOfTraveler} Penumpang',
                              style: greyTextStyle.copyWith(fontWeight: light),
                            ),
                          ],
                        ),
                      ),
                      Column(
                        children: [
                          Text(
                            "Total Harga",
                            style: greyTextStyle.copyWith(fontWeight: light),
                          ),
                          Text(
                              NumberFormat.currency(
                                locale: 'id',
                                symbol: 'Rp ',
                                decimalDigits: 0,
                              ).format(transaction.grandTotal),
                              style: greyTextStyle.copyWith(
                                  color: Colors.blue, fontWeight: semiBold))
                        ],
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
