import 'package:bwa_masteringflutter/ui/pages/credit_page/credit_controller.dart';
import 'package:get/get.dart';
import 'package:get/get_instance/src/bindings_interface.dart';

class CreditBinding extends Bindings{
  @override
  void dependencies() {
    Get.lazyPut(() => CreditController());
  }
}