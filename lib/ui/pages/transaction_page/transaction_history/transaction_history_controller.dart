import 'package:get/get.dart';

import '../../../../models/transaction.dart';

class TransactionHistoryController extends GetxController {
  late List<TransactionModel> transactions;

  @override
  void onInit() async {
    transactions = Get.arguments;
    super.onInit();
  }
}
