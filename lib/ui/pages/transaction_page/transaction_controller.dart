import 'package:bwa_masteringflutter/models/transaction.dart';
import 'package:bwa_masteringflutter/services/transaction_service.dart';
import 'package:get/get.dart';

enum TransactionStatus { loading, success, failed }
class TransactionController extends GetxController{

  List<TransactionModel> transactions = [];
  Rx<TransactionStatus> status = TransactionStatus.loading.obs;
  String? error;
  @override
  void onInit() {
    fetchTransactions();
    super.onInit();
  }

  Future<void> fetchTransactions() async {
    try{
      transactions = await TransactionService().fetchTransaction();
      status = TransactionStatus.success.obs;
      update();
    }catch(e){
      status = TransactionStatus.failed.obs;
      error = e.toString();
      update();
    }
  }
}