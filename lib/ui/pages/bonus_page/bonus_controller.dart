import 'package:bwa_masteringflutter/models/user.dart';
import 'package:get/get.dart';

class BonusPageController extends GetxController {
  late final userData user;

  @override
  void onInit() {
    user = Get.arguments as userData;
    super.onInit();
  }
}
