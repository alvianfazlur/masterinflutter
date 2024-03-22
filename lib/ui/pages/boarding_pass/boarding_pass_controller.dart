
import 'package:bwa_masteringflutter/models/transaction.dart';
import 'package:get/get.dart';

class BoardingPassController extends GetxController{

  late final TransactionModel transaction;
  @override
  void onInit() {
    transaction = Get.arguments;
    super.onInit();
  }
}