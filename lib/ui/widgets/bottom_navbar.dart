import 'package:bwa_masteringflutter/ui/pages/credit_page/credit_page.dart';
import 'package:bwa_masteringflutter/ui/pages/main_page/home_page.dart';
import 'package:bwa_masteringflutter/ui/pages/news_page/news_page.dart';
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
      this.isSelectedNews = false,
      this.isSelectedTransaction = false,})
      : super(key: key);

  final bool isSelectedHome;
  final bool isSelectedTransaction;
  final bool isSelectedSaldo;
  final bool isSelectedSetting;
  final bool isSelectedNews;

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.bottomCenter,
      child: Container(
        width: double.infinity,
        height: 75,
        decoration: BoxDecoration(
            color: whiteColor,
          border: Border(top: BorderSide(color: greyColor.withOpacity(0.2), width: 2))
            ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            CustomBottomNavbar(
                image: isSelectedHome ? 'assets/images/fi_globe_active.png' : 'assets/images/fi_globe.png',
                isSelected: isSelectedHome,
                onTap: () {
                  if (isSelectedHome == true) {
                    print("active");
                  } else {
                    Get.offNamedUntil(MainPage.routeName,
                        ModalRoute.withName(MainPage.routeName));
                  }
                }),
            CustomBottomNavbar(
                image: isSelectedTransaction? 'assets/images/fi_book_active.png' : 'assets/images/fi_book.png',
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
                image: isSelectedNews? 'assets/images/fi_news_active.png' : 'assets/images/fi_news.png',
                isSelected: isSelectedNews,
                onTap: () {
                  if (isSelectedNews == true) {
                    print("active");
                  } else {
                    Get.offNamedUntil(NewsPage.routeName,
                        ModalRoute.withName(MainPage.routeName));
                  }
                }
            ),
            CustomBottomNavbar(
                image: isSelectedSaldo? 'assets/images/fi_credit-card-active.png' :'assets/images/fi_credit-card.png',
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
              image: isSelectedSetting? 'assets/images/fi_settings_active.png' :'assets/images/fi_settings.png',
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
