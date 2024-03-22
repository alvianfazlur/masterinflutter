import 'package:bwa_masteringflutter/ui/pages/boarding_pass/boarding_pass_controller.dart';
import 'package:get/get.dart';

class BoardingPassBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => BoardingPassController());
  }
}