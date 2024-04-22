import 'package:bwa_masteringflutter/ui/pages/transaction_page/transaction_controller.dart';
import 'package:bwa_masteringflutter/ui/pages/transaction_page/transaction_history/transaction_history.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import '../../../../models/transaction.dart';
import '../../../../shared/theme.dart';
import 'transaction_card.dart';

class ShowTransaction extends StatelessWidget {
  const ShowTransaction({Key? key, required this.transactions})
      : super(key: key);

  final List<TransactionModel> transactions;

  @override
  Widget build(BuildContext context) {
    DateTime yesterday = DateTime.now().subtract(Duration(days: 1));
    List<TransactionModel> filteredTransactions = transactions
        .where((transaction) =>
            transaction.date.isAfter(yesterday))
        .toList();

    return GetBuilder<TransactionController>(
      builder: (TransactionController controller) => Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
              margin: EdgeInsets.only(left: 25, right: 25),
              child: Row(
                children: [
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "Tickets Booking",
                          style: whiteTextStyle.copyWith(
                              fontSize: 24, fontWeight: semiBold),
                        ),
                        Text(
                          "Join us and get your next journey",
                          style: greyTextStyle.copyWith(),
                        ),
                      ],
                    ),
                  ),
                  GestureDetector(
                    onTap: (){
                      controller.displayedDates.clear();
                      Get.toNamed(TransactionHistory.routeName, arguments: transactions);
                    },
                    child: Container(
                      width: 45,
                      height: 45,
                      decoration: BoxDecoration(
                          border: Border.all(
                              color: greyColor.withOpacity(0.4), width: 2),
                          borderRadius: BorderRadius.circular(10)),
                      child: Container(
                        decoration: BoxDecoration(
                            image: DecorationImage(
                                image:
                                    AssetImage("assets/images/order_history.png"))),
                      ),
                    ),
                  )
                ],
              )),
          filteredTransactions.isEmpty
              ? Container(
                  margin: EdgeInsets.only(top: 50),
                  padding: EdgeInsets.only(bottom: 200),
                  decoration: BoxDecoration(
                      color: whiteColor,
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(30),
                        topRight: Radius.circular(30),
                      )),
                  child: Center(
                    child: Column(
                      children: [
                        Container(
                          width: 300,
                          height: 300,
                          decoration: BoxDecoration(
                              image: DecorationImage(
                                  image: AssetImage(
                                      'assets/images/transaction_background.png'))),
                        ),
                        Text(
                          "No Tickets Active",
                          style: blackTextStyle.copyWith(
                              fontWeight: semiBold, fontSize: 24),
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        Text(
                          "You haven't made a booking schedule",
                          style: greyTextStyle,
                        )
                      ],
                    ),
                  ),
                )
              : Container(
                  margin: EdgeInsets.only(top: 50),
                  padding: EdgeInsets.only(bottom: 200),
                  constraints: BoxConstraints(
                    minHeight: MediaQuery.of(context).size.height - 175,
                  ),
                  decoration: BoxDecoration(
                      color: whiteColor,
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(30),
                        topRight: Radius.circular(30),
                      )),
                  child: Container(
                    margin: EdgeInsets.only(left: 25, right: 25),
                    child: Column(
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: filteredTransactions
                              .map((TransactionModel transaction) {
                            return TransactionCard(transaction);
                          }).toList(),
                        ),
                      ],
                    ),
                  ),
                ),
        ],
      ),
    );
  }
}
