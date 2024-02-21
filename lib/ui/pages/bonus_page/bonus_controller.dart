import 'package:bwa_masteringflutter/models/user.dart';
import 'package:bwa_masteringflutter/services/balance_service.dart';
import 'package:get/get.dart';
class BonusPageController extends GetxController {
  userData? user;

  @override
  void onInit() {
    user = Get.arguments as userData;
    super.onInit();
  }



}
