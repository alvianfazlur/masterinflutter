import 'package:bwa_masteringflutter/ui/pages/main_page/main_page.dart';
import 'package:bwa_masteringflutter/ui/pages/transaction_page/widgets/show_transaction.dart';
import 'package:bwa_masteringflutter/ui/pages/transaction_page/widgets/transaction_card.dart';
import 'package:bwa_masteringflutter/ui/pages/transaction_page/transaction_controller.dart';
import 'package:bwa_masteringflutter/ui/widgets/bottom_navbar.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../shared/theme.dart';

class TransactionPage extends GetView<TransactionController> {
  static const routeName = '/transaction';

  @override
  Widget build(BuildContext context) {

    return GetBuilder<TransactionController>(
        builder: (controller) => Scaffold(
              backgroundColor: primaryColor,
              body: SafeArea(
                child: RefreshIndicator(
                  onRefresh: () async {
                    controller.fetchTransactions();
                  },
                  child: Stack(
                    children: [
                      ListView(
                        padding: EdgeInsets.only(
                            top: 30),
                        children: [
                          ShowTransaction(transactions: controller.transactions),
                        ],
                      ),
                      BottomNavbar(isSelectedTransaction: true),
                    ],
                  ),
                ),
              ),
            ));
  }
}
