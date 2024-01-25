import 'package:bwa_masteringflutter/app_pages.dart';
import 'package:bwa_masteringflutter/ui/pages/get_started.dart';
import 'package:bwa_masteringflutter/ui/pages/splash_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';

void main() {
  runApp(GetMaterialApp(
    debugShowCheckedModeBanner: false,
    initialRoute: SplashPage.routeName,
    getPages: appPages,
  ));
}