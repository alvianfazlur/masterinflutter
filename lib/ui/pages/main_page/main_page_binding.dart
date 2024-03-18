import 'package:get/get.dart';

import 'controller/date_controller.dart';
import 'controller/homepage_controller.dart';

class MainPageBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => HomePageController());
    Get.lazyPut(() => DatePickerController());
  }
}