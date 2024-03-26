import 'package:bwa_masteringflutter/ui/pages/transaction_page/transaction_history/transaction_history_controller.dart';
import 'package:get/get.dart';

class TransactionHistoryBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => TransactionHistoryController());
  }
}