import 'package:bwa_masteringflutter/models/transaction.dart';
import 'package:flutter/material.dart';

import '../../../shared/theme.dart';

class TransactionCard extends StatelessWidget {
  const TransactionCard(this.transaction, {Key? key}) : super(key: key);

  final TransactionModel transaction;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(top: 16),
      padding: EdgeInsets.all(10),
      decoration: BoxDecoration(
        color: whiteColor,
        borderRadius: BorderRadius.circular(18),
      ),
      child: Row(
        children: [
          Expanded(
            child: Container(
              width: 138,
              margin: EdgeInsets.only(left: 16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    transaction.destination.name,
                    style: blackTextStyle.copyWith(
                        fontSize: 18, fontWeight: medium),
                  ),
                  Text(
                    transaction.destination.city,
                    style: greyTextStyle.copyWith(fontWeight: light),
                  ),
                  Text('Person: ${transaction.amountOfTraveler.toString()}'),
                  Text('Total Price: ${transaction.grandTotal.toString()}'),
                  Text('Selected Seats: ${transaction.selectedSeats.toString()}'),
                ],
              ),
            ),
          ),
          Container(
            width: 46,
            height: 24,
            child: Row(
              children: [
                Container(
                  width: 24,
                  height: 24,
                  decoration: BoxDecoration(
                      image: DecorationImage(
                          image: AssetImage('assets/images/Star.png'))),
                ),
                Text(
                  transaction.destination.rating.toString(),
                  style: blackTextStyle.copyWith(fontWeight: medium),
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
