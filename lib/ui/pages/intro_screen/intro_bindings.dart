import 'package:bwa_masteringflutter/ui/pages/intro_screen/intro_controller.dart';
import 'package:get/get.dart';

class IntroBindings extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => IntroController());
  }
}