import 'package:bwa_masteringflutter/ui/pages/checkout_page/checkout_page.dart';
import 'package:bwa_masteringflutter/ui/pages/checkout_page/checkout_page_controller.dart';
import 'package:bwa_masteringflutter/ui/pages/choose_seat_page/seat_controller.dart';
import 'package:get/get.dart';

class CheckoutPageBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => CheckOutPageController());
  }
}