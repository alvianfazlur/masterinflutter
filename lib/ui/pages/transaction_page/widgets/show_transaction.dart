import 'package:flutter/material.dart';

import '../../../../models/transaction.dart';
import '../../../../shared/theme.dart';
import 'transaction_card.dart';

class ShowTransaction extends StatelessWidget {
  const ShowTransaction({Key? key, required this.transactions}) : super(key: key);

  final List<TransactionModel> transactions;
  @override
  Widget build(BuildContext context) {
    if (transactions.isEmpty) {
      return Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text("My Tickets", style: blackTextStyle.copyWith(fontSize: 24, fontWeight: semiBold),),
          Center(
            child: Column(
              children: [
                Container(
                  margin: EdgeInsets.only(top: 50),
                  width: 300,
                  height: 300,
                  decoration: BoxDecoration(
                      image: DecorationImage(
                          image: AssetImage('assets/images/transaction_background.png'))),
                ),
                Text("No Tickets Saved", style: blackTextStyle.copyWith(fontWeight: semiBold, fontSize: 24),),
                SizedBox(height: 10,),
                Text("You haven't made a booking schedule", style: greyTextStyle,)
              ],
            ),
          ),
        ],
      );
    } else {
      return Container(
        margin: EdgeInsets.only(bottom: 120),
        child: Column(
          children: [
            Text("Riwayat Booking", style: blackTextStyle.copyWith(fontWeight: semiBold, fontSize: 28),),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: transactions.map((TransactionModel transaction) {
                return TransactionCard(transaction);
              }).toList(),
            ),
          ],
        ),
      );
    }
  }
}
