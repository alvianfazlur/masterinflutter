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
          Container(
            margin: EdgeInsets.only(left: 25),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text("My Tickets", style: whiteTextStyle.copyWith(fontSize: 24, fontWeight: semiBold),),
                  Text("Join us and get your next journey", style: greyTextStyle.copyWith(),),
                ],
              )),
          Container(
            margin: EdgeInsets.only(top: 50),
            padding: EdgeInsets.only(bottom: 200),
            decoration: BoxDecoration(
              color: whiteColor,
              borderRadius: BorderRadius.only(topLeft: Radius.circular(30), topRight: Radius.circular(30),)
            ),
            child: Center(
              child: Column(
                children: [
                  Container(
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
          ),
        ],
      );
    } else {
      return Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
              margin: EdgeInsets.only(left: 25),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text("My Tickets", style: whiteTextStyle.copyWith(fontSize: 24, fontWeight: semiBold),),
                  Text("Join us and get your next journey", style: greyTextStyle.copyWith(),),
                ],
              )),
          Container(
            margin: EdgeInsets.only(top: 50),
            padding: EdgeInsets.only(bottom: 200),
            constraints: BoxConstraints(
              minHeight: MediaQuery.of(context).size.height - 175,
            ),
            decoration: BoxDecoration(
                color: whiteColor,
                borderRadius: BorderRadius.only(topLeft: Radius.circular(30), topRight: Radius.circular(30),)
            ),
            child: Container(
              margin: EdgeInsets.only(left: 25, right: 25),
              child: Column(
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: transactions.map((TransactionModel transaction) {
                      return TransactionCard(transaction);
                    }).toList(),
                  ),
                ],
              ),
            ),
          ),
        ],
      );
    }
  }
}
