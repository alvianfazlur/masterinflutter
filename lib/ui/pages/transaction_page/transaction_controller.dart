import 'package:bwa_masteringflutter/models/transaction.dart';
import 'package:bwa_masteringflutter/services/transaction_service.dart';
import 'package:bwa_masteringflutter/ui/pages/main_page/destination_controller/homepage_controller.dart';
import 'package:get/get.dart';
import '../../../models/user.dart';
import '../../../services/balance_service.dart';

enum TransactionStatus { loading, success, failed }
class TransactionController extends GetxController{

  List<TransactionModel> transactions = [];
  Rx<TransactionStatus> status = TransactionStatus.loading.obs;
  String? error;
  userData? user;
  var userController = Get.find<HomePageController>();
  @override
  void onInit() {
    fetchTransactions();
    fetchBalance();
    super.onInit();
  }

  Future<void> fetchTransactions() async {
    try{
      transactions = await TransactionService().fetchTransaction(userController.user!.id);
      status = TransactionStatus.success.obs;
      update();
    }catch(e){
      status = TransactionStatus.failed.obs;
      error = e.toString();
      update();
    }
  }

  Future<void> fetchBalance()async {
    user = userController.user;
    var newBalance = await BalanceService().fetchBalance(userController.user!.id);
    user!.balance = newBalance;
    update();
  }
}