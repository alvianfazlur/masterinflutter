import 'package:bwa_masteringflutter/ui/pages/setting_page/setting_page_controller.dart';
import 'package:bwa_masteringflutter/ui/pages/sign_up/sign_up_controller.dart';
import 'package:get/get.dart';

class SettingPageBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => SettingPageController());
  }
}