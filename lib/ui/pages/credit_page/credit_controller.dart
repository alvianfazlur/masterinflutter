import 'package:bwa_masteringflutter/models/user.dart';
import 'package:bwa_masteringflutter/services/midtrans_service.dart';
import 'package:bwa_masteringflutter/services/user_service.dart';
import 'package:bwa_masteringflutter/ui/pages/bonus_page/bonus_controller.dart';
import 'package:get/get.dart';

import '../../../services/balance_service.dart';

class CreditController extends GetxController{
  var userController = Get.find<BonusPageController>();
  userData? user;
  String? snapToken;
  final List<int> selectedNominal = [];
  bool isVisibleMenu = false;

  @override
  void onInit() {
    user = userController.user;
    fetchBalance();
    super.onInit();
  }

  void setVisibleMenu(bool isVisible) {
    isVisibleMenu = isVisible;
    update();
  }


  Future<void> topUp({required String id, required int balance, required String name}) async {
    user = userController.user;
    try {
      snapToken = await MidtransService().createTopUpOrder(id, balance, name);
      update();
    } catch (e) {
      throw e;
    }
  }

  bool isSelected(int nominal){
    int index = selectedNominal.indexOf(nominal);
    if(index == -1){
      return false;
    }else{
      return true;
    }
  }

  Future<void> selectNominal(int nominal) async {
    if (selectedNominal.isNotEmpty) {
      selectedNominal.removeAt(0);
    }
    selectedNominal.add(nominal);
    update();
  }

  Future<void> fetchBalance()async {
    user = userController.user;
    var newBalance = await BalanceService().fetchBalance(userController.user!.id);
    print(newBalance);
    user!.balance = newBalance;
    update();
  }

}