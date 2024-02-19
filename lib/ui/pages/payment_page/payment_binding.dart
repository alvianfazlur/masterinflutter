import 'package:bwa_masteringflutter/ui/pages/payment_page/payment_controller.dart';
import 'package:get/get.dart';
import 'package:get/get_instance/src/bindings_interface.dart';

class PaymentBinding extends Bindings{
  @override
  void dependencies() {
    Get.lazyPut(() => PaymentController());
  }
}