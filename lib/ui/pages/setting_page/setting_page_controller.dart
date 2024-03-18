import 'package:bwa_masteringflutter/services/auth_service.dart';
import 'package:bwa_masteringflutter/ui/pages/login/login_page.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import '../../../models/user.dart';
import '../main_page/controller/homepage_controller.dart';

class SettingPageController extends GetxController {
  var userController = Get.find<HomePageController>();
  userData? user;
  late String censoredPart;
  late String censoredText;
  TextEditingController name = TextEditingController();
  TextEditingController id = TextEditingController();
  TextEditingController hobby = TextEditingController();
  String userId = '';

  @override
  void onInit() {
    user = userController.user;
    userId = user!.id;
    censoredPart = userId.substring(3, 10);
    censoredText = userId.replaceRange(3, 10, '*******');
    id.text = user!.id;
    name.text = user!.name;
    hobby.text = user!.hobby;
    super.onInit();
  }

  void signOut() async {
    try {
      await AuthService().signOut();
      Get.offAllNamed(LoginPage.routeName);
    } catch (e) {
      throw e;
    }
  }
}
