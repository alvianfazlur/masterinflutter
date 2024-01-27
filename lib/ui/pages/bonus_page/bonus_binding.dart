import 'package:bwa_masteringflutter/ui/pages/bonus_page/bonus_controller.dart';
import 'package:bwa_masteringflutter/ui/pages/sign_up/sign_up_controller.dart';
import 'package:get/get.dart';

class BonusPageBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => BonusPageController());
  }
}