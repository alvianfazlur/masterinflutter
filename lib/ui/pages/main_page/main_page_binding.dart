import 'package:bwa_masteringflutter/destination_controller/destination_controller.dart';
import 'package:get/get.dart';

class MainPageBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => DestinationController());
  }
}