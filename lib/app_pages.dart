import 'package:bwa_masteringflutter/ui/pages/bonus_page/bonus_binding.dart';
import 'package:bwa_masteringflutter/ui/pages/bonus_page/bonus_page.dart';
import 'package:bwa_masteringflutter/ui/pages/checkout_page/checkout_page.dart';
import 'package:bwa_masteringflutter/ui/pages/checkout_page/success_checkout.dart';
import 'package:bwa_masteringflutter/ui/pages/detail_page/detail_page.dart';
import 'package:bwa_masteringflutter/ui/pages/get_started.dart';
import 'package:bwa_masteringflutter/ui/pages/login/login_binding.dart';
import 'package:bwa_masteringflutter/ui/pages/login/login_page.dart';
import 'package:bwa_masteringflutter/ui/pages/main_page/main_page.dart';
import 'package:bwa_masteringflutter/ui/pages/choose_seat_page/seat_page.dart';
import 'package:bwa_masteringflutter/ui/pages/setting_page/setting_page.dart';
import 'package:bwa_masteringflutter/ui/pages/setting_page/setting_page_binding.dart';
import 'package:bwa_masteringflutter/ui/pages/sign_up/sign_up_binding.dart';
import 'package:bwa_masteringflutter/ui/pages/sign_up/sign_up_screen.dart';
import 'package:bwa_masteringflutter/ui/pages/splash_screen.dart';
import 'package:flutter/animation.dart';
import 'package:get/get_navigation/src/routes/get_route.dart';
import 'package:get/get_navigation/src/routes/transitions_type.dart';

var appPages = [
  GetPage(
    name: SplashPage.routeName,
    page: () => SplashPage(),
  ),
  GetPage(
    name: GetStartedPage.routeName,
    page: () => GetStartedPage(),
  ),
  GetPage(
    name: SignUpScreen.routeName,
    page: () => SignUpScreen(),
    binding: SignUpBinding(),
    transition: Transition.cupertino,
    curve: Curves.easeInOut,
    transitionDuration: const Duration(milliseconds: 250),
  ),
  GetPage(
    name: BonusPage.routeName,
    page: () => BonusPage(),
    binding: BonusPageBinding(),
    transition: Transition.cupertino,
    curve: Curves.easeInOut,
    transitionDuration: const Duration(milliseconds: 250),
  ),
  GetPage(
    name: MainPage.routeName,
    page: () => MainPage(),
    // binding: BonusPageBinding(),
    transition: Transition.cupertino,
    curve: Curves.easeInOut,
    transitionDuration: const Duration(milliseconds: 250),
  ),
  GetPage(
    name: DetailPage.routeName,
    page: () => DetailPage(),
    // binding: BonusPageBinding(),
    transition: Transition.cupertino,
    curve: Curves.easeInOut,
    transitionDuration: const Duration(milliseconds: 250),
  ),
  GetPage(
    name: ChooseSeatPage.routeName,
    page: () => ChooseSeatPage(),
    // binding: BonusPageBinding(),
    transition: Transition.cupertino,
    curve: Curves.easeInOut,
    transitionDuration: const Duration(milliseconds: 250),
  ),
  GetPage(
    name: CheckoutPage.routeName,
    page: () => CheckoutPage(),
    // binding: BonusPageBinding(),
    transition: Transition.cupertino,
    curve: Curves.easeInOut,
    transitionDuration: const Duration(milliseconds: 250),
  ),
  GetPage(
    name: SuccessCheckout.routeName,
    page: () => SuccessCheckout(),
    // binding: BonusPageBinding(),
    transition: Transition.cupertino,
    curve: Curves.easeInOut,
    transitionDuration: const Duration(milliseconds: 250),
  ),
  GetPage(
    name: SettingPage.routeName,
    page: () => SettingPage(),
    binding: SettingPageBinding(),
    transition: Transition.cupertino,
    curve: Curves.easeInOut,
    transitionDuration: const Duration(milliseconds: 250),
  ),
  GetPage(
    name: LoginPage.routeName,
    page: () => LoginPage(),
    binding: LoginPageBinding(),
    transition: Transition.cupertino,
    curve: Curves.easeInOut,
    transitionDuration: const Duration(milliseconds: 250),
  ),
];