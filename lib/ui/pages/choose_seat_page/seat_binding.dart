import 'package:bwa_masteringflutter/ui/pages/choose_seat_page/seat_controller.dart';
import 'package:get/get.dart';

class SeatBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => SeatController());
  }
}