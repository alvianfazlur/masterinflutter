import 'package:bwa_masteringflutter/shared/theme.dart';
import 'package:bwa_masteringflutter/ui/pages/main_page/home_page.dart';
import 'package:bwa_masteringflutter/ui/widgets/custom_navigation_item.dart';
import 'package:flutter/material.dart';

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
              CustomBottomNavbar(image: 'assets/images/fi_globe.png',isSelected: true,),
              CustomBottomNavbar(image: 'assets/images/fi_book.png', ),
              CustomBottomNavbar(image: 'assets/images/fi_credit-card.png',),
              CustomBottomNavbar(image: 'assets/images/fi_settings.png',),
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
          ButtonNavbar()
        ],
      ),
    );
  }
}
