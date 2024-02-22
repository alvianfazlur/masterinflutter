import 'package:get/get.dart';

import 'destination_controller/homepage_controller.dart';

class MainPageBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => HomePageController());
  }
}