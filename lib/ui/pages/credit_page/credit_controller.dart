import 'package:bwa_masteringflutter/models/user.dart';
import 'package:bwa_masteringflutter/services/user_service.dart';
import 'package:bwa_masteringflutter/ui/pages/bonus_page/bonus_controller.dart';
import 'package:get/get.dart';

class CreditController extends GetxController{
  var userController = Get.find<BonusPageController>();
  userData? user;

  @override
  void onInit() {
    user = userController.user;
    super.onInit();
  }

  Future<void> topUp({required String id, required int balance}) async {
    user = userController.user;
    int newBalance = user!.balance + balance;
    try {
      await userService().updateBalance(id, newBalance);
      user!.balance = newBalance;
      update();
    } catch (e) {
      throw e;
    }
  }
}