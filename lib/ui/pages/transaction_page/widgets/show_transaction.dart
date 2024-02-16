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
      return Center(
        child: Column(
          children: [
            Text(
              "Kamu Belum Membuat Jadwal Booking",
              style: blackTextStyle.copyWith(fontSize: 28),
              textAlign: TextAlign.center,
            ),
            Container(
              margin: EdgeInsets.only(top: 50),
              width: 300,
              height: 300,
              decoration: BoxDecoration(
                  image: DecorationImage(
                    opacity: 0.5,
                      image: AssetImage('assets/images/calendar.png'))),
            )
          ],
        ),
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
