import 'package:bwa_masteringflutter/services/auth_service.dart';
import 'package:bwa_masteringflutter/ui/pages/sign_up/sign_up_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SettingPageController extends GetxController {
  @override
  void onInit() {
        super.onInit();
  }

  void signOut() async {
    try{
      await AuthService().signOut();
      Get.offAllNamed(SignUpScreen.routeName);
    }catch(e){
      throw e;
    }
  }
}
