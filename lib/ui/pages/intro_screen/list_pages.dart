import 'package:bwa_masteringflutter/shared/theme.dart';
import 'package:introduction_screen/introduction_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

List<PageViewModel> listPageView = [
  PageViewModel(
    decoration: PageDecoration(),
    titleWidget: Text(
      "Welcome to Punggawa Travel",
      style: blackTextStyle.copyWith(fontSize: 20, fontWeight: extraBold),
    ),
    bodyWidget: Text(
      "Book your dream destinations effortlessly with Punggawa Travel app.",
      style: blackTextStyle.copyWith(fontSize: 16),
      textAlign: TextAlign.center,
    ),
    image: Padding(
      padding: const EdgeInsets.only(top: 30.0),
      child: Container(
        width: Get.width,
        height: Get.height,
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage("assets/images/intro_1.jpg"),
          ),
        ),
      ),
    ),
  ),
  PageViewModel(
    titleWidget: Text(
      "Book. Explore. Enjoy!",
      style: blackTextStyle.copyWith(fontSize: 20, fontWeight: extraBold),
    ),
    bodyWidget: Text(
      "Make every journey memorable with Punggawa Travel app",
      style: blackTextStyle.copyWith(fontSize: 16),
      textAlign: TextAlign.center,
    ),
    image: Padding(
      padding: const EdgeInsets.only(top: 30.0),
      child: Container(
        width: Get.width,
        height: Get.height,
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage("assets/images/intro_2.jpg"),
          ),
        ),
      ),
    ),
  ),
  PageViewModel(
    titleWidget: Text(
      "Unlock new adventures with Punggawa Pay.",
      style: blackTextStyle.copyWith(fontSize: 20, fontWeight: extraBold),
      textAlign: TextAlign.center,
    ),
    bodyWidget: Text(
      "Unlock a world of possibilities with Punggawa Pay",
      style: blackTextStyle.copyWith(fontSize: 16),
      textAlign: TextAlign.center,
    ),
    image: Padding(
      padding: const EdgeInsets.only(top: 30.0),
      child: Container(
        width: Get.width,
        height: Get.height,
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage("assets/images/intro_3.jpg"),
          ),
        ),
      ),
    ),
  ),
];
