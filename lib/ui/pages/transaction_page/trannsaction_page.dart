import 'package:bwa_masteringflutter/ui/pages/bonus_page/bonus_page.dart';
import 'package:bwa_masteringflutter/ui/pages/main_page/home_page.dart';
import 'package:bwa_masteringflutter/ui/pages/main_page/main_page.dart';
import 'package:bwa_masteringflutter/ui/pages/transaction_page/transaction_card.dart';
import 'package:bwa_masteringflutter/ui/pages/transaction_page/transaction_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../models/transaction.dart';
import '../../../shared/theme.dart';
import '../../widgets/custom_navigation_item.dart';
import '../setting_page/setting_page.dart';

class TransactionPage extends GetView<TransactionController> {
  static const routeName = '/transaction';

  @override
  Widget build(BuildContext context) {
    Widget ButtonNavbar() {
      return Align(
        alignment: Alignment.bottomCenter,
        child: Container(
          margin: EdgeInsets.only(bottom: 30, left: 24, right: 24),
          width: double.infinity,
          height: 60,
          decoration: BoxDecoration(
              color: whiteColor,
              borderRadius: BorderRadius.circular(defaultRadius)),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              CustomBottomNavbar(
                  image: 'assets/images/fi_globe.png',
                  onTap: () => Get.offNamed(MainPage.routeName)),
              CustomBottomNavbar(
                  image: 'assets/images/fi_book.png',
                  isSelected: true,
                  onTap: () => Get.toNamed(TransactionPage.routeName)),
              CustomBottomNavbar(
                  image: 'assets/images/fi_credit-card.png',
                  onTap: () => Get.toNamed(SettingPage.routeName)),
              CustomBottomNavbar(
                image: 'assets/images/fi_settings.png',
                onTap: () => Get.toNamed(SettingPage.routeName),
              ),
            ],
          ),
        ),
      );
    }

    Widget allTransaction(List<TransactionModel> transactions) {
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

    return GetBuilder<TransactionController>(
        builder: (controller) => Scaffold(
              backgroundColor: backgroundColor,
              body: SafeArea(
                child: Stack(
                  children: [
                    ListView(
                      padding: EdgeInsets.only(
                          left: defaultMargin, top: 30, right: 24),
                      children: [
                        allTransaction(controller.transactions),
                      ],
                    ),
                    ButtonNavbar(),
                  ],
                ),
              ),
            ));
  }
}
