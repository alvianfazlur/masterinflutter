import 'package:get/get.dart';
import '../../../models/transaction.dart';

class DetailTicketController extends GetxController{

  late final TransactionModel transaction;

  @override
  void onInit() {
    transaction = Get.arguments;
    super.onInit();
  }
}