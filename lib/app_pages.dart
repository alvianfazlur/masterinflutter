import 'package:bwa_masteringflutter/ui/pages/get_started.dart';
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
];