import 'package:bwa_masteringflutter/ui/pages/credit_page/credit_page.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import '../../shared/theme.dart';
import '../pages/main_page/main_page.dart';
import '../pages/setting_page/setting_page.dart';
import '../pages/transaction_page/trannsaction_page.dart';
import 'custom_navigation_item.dart';

class BottomNavbar extends StatelessWidget {
  const BottomNavbar(
      {Key? key,
      this.isSelectedHome = false,
      this.isSelectedSaldo = false,
      this.isSelectedSetting = false,
      this.isSelectedTransaction = false})
      : super(key: key);

  final bool isSelectedHome;
  final bool isSelectedTransaction;
  final bool isSelectedSaldo;
  final bool isSelectedSetting;

  @override
  Widget build(BuildContext context) {
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
                isSelected: isSelectedHome,
                onTap: () => Get.offNamedUntil(MainPage.routeName,
                    ModalRoute.withName(MainPage.routeName))),
            CustomBottomNavbar(
                image: 'assets/images/fi_book.png',
                isSelected: isSelectedTransaction,
                onTap: () {
                  if (isSelectedTransaction == true) {
                    print("active");
                  } else {
                    Get.offNamedUntil(TransactionPage.routeName,
                        ModalRoute.withName(MainPage.routeName));
                  }
                }),
            CustomBottomNavbar(
                image: 'assets/images/fi_credit-card.png',
                isSelected: isSelectedSaldo,
                onTap: () {
                  if (isSelectedSaldo == true) {
                    print("active");
                  } else {
                    Get.offNamedUntil(CreditPage.routeName,
                        ModalRoute.withName(MainPage.routeName));
                  }
                }),
            CustomBottomNavbar(
              image: 'assets/images/fi_settings.png',
              isSelected: isSelectedSetting,
                onTap: () {
                  if (isSelectedSetting == true) {
                    print("active");
                  } else {
                    Get.offNamedUntil(SettingPage.routeName,
                        ModalRoute.withName(MainPage.routeName));
                  }
                }
            ),
          ],
        ),
      ),
    );
  }
}
