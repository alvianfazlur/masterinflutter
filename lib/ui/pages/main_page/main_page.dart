import 'package:bwa_masteringflutter/shared/theme.dart';
import 'package:bwa_masteringflutter/ui/pages/main_page/home_page.dart';
import 'package:bwa_masteringflutter/ui/pages/setting_page/setting_page.dart';
import 'package:bwa_masteringflutter/ui/pages/sign_up/sign_up_controller.dart';
import 'package:bwa_masteringflutter/ui/widgets/custom_navigation_item.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class MainPage extends StatelessWidget {
  static const routeName = "/main";

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
              CustomBottomNavbar(image: 'assets/images/fi_globe.png',isSelected: true,onTap: ()=> Get.toNamed(SettingPage.routeName)),
              CustomBottomNavbar(image: 'assets/images/fi_book.png', onTap: ()=> Get.toNamed(SettingPage.routeName)),
              CustomBottomNavbar(image: 'assets/images/fi_credit-card.png', onTap: ()=> Get.toNamed(SettingPage.routeName)),
              CustomBottomNavbar(image: 'assets/images/fi_settings.png', onTap: ()=> Get.toNamed(SettingPage.routeName),),
            ],
          ),
        ),
      );
    }

    return Scaffold(
      backgroundColor: backgroundColor,
      body: Stack(
        children: [
          HomePage(),
          ButtonNavbar(),
        ],
      ),
    );
  }
}
