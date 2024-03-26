import 'package:bwa_masteringflutter/shared/theme.dart';
import 'package:bwa_masteringflutter/ui/pages/transaction_page/trannsaction_page.dart';
import 'package:bwa_masteringflutter/ui/pages/transaction_page/transaction_history/transaction_history_card.dart';
import 'package:bwa_masteringflutter/ui/pages/transaction_page/transaction_history/transaction_history_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../../models/transaction.dart';

class TransactionHistory extends GetView<TransactionHistoryController> {
  const TransactionHistory({Key? key}) : super(key: key);
  static const routeName = "/transaction-history";

  @override
  Widget build(BuildContext context) {
    DateTime yesterday = DateTime.now().subtract(Duration(days: 1));
    List<TransactionModel> filteredTransactions = controller.transactions
        .where((transaction) => transaction.date.isBefore(yesterday))
        .toList();
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          "Transaction History",
          style: blackTextStyle.copyWith(fontSize: 16, fontWeight: semiBold),
        ),
        leading: IconButton(
            onPressed: () {
              Get.offNamed(TransactionPage.routeName);
            },
            icon: Image.asset("assets/images/back_button.png")),
      ),
      body: filteredTransactions.isEmpty
          ? SizedBox()
          : SingleChildScrollView(
        padding: EdgeInsets.all(25),
            child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children:
                    filteredTransactions.map((TransactionModel transaction) {
                  return TransactionHistoryCard(transaction);
                }).toList(),
              ),
          ),
    );
  }
}
