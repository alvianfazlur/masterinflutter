import 'package:bwa_masteringflutter/ui/pages/transaction_page/transaction_card.dart';
import 'package:bwa_masteringflutter/ui/pages/transaction_page/transaction_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../models/transaction.dart';
import '../../../shared/theme.dart';

class TransactionPage extends GetView<TransactionController>{
  static const routeName = '/transaction';
  @override

  Widget build(BuildContext context) {

    Widget allTransaction(List<TransactionModel> transactions){
      return Container(
        margin: EdgeInsets.only(bottom: 120),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
            children: transactions.map((TransactionModel transactions) {
              return TransactionCard(transactions);
            }).toList(),

        ),
      );
    }

    return GetBuilder<TransactionController>(
        builder: (controller) => Scaffold(
          body: SafeArea(
            child: ListView(
              padding: EdgeInsets.only(left: defaultMargin, top: 30, right: 24),
              children: [
                allTransaction(controller.transactions),
              ],
            ),
          ),
        ));
  }
  
}