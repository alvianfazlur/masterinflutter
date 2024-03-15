import 'package:bwa_masteringflutter/models/user.dart';
import 'package:bwa_masteringflutter/services/midtrans_service.dart';
import 'package:bwa_masteringflutter/ui/pages/main_page/destination_controller/homepage_controller.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

import '../../../services/balance_service.dart';

class CreditController extends GetxController{
  var userController = Get.find<HomePageController>();
  userData? user;
  String? snapToken;
  final List<int> selectedNominal = [];
  bool isVisibleMenu = false;
  TextEditingController search = TextEditingController();

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
      selectedNominal.clear();
    }
    selectedNominal.add(nominal);
    search.text = selectedNominal[0].toString();
    update();
  }

  Future<void> fetchBalance()async {
    user = userController.user;
    var newBalance = await BalanceService().fetchBalance(userController.user!.id);
    user!.balance = newBalance;
    update();
  }

  void clearSearch() {
    search.clear();
    update();
  }

}