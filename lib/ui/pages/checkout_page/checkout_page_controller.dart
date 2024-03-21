import 'package:bwa_masteringflutter/models/destination.dart';
import 'package:bwa_masteringflutter/models/transaction.dart';
import 'package:bwa_masteringflutter/services/balance_service.dart';
import 'package:bwa_masteringflutter/services/transaction_service.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import '../main_page/controller/homepage_controller.dart';

enum TransactionStatus { loading, success, failed }

class CheckOutPageController extends GetxController{
  late final DestinationModel destination;
  Rx<TransactionStatus> status = TransactionStatus.loading.obs;
  late TransactionModel transactions = TransactionModel(destination: destination, uid: userController.user!.id, date: DateTime.now(), dateCreated: DateTime.now());
  TextEditingController personController = TextEditingController();
  var userController = Get.find<HomePageController>();
  String? error;
  late final RxInt traveller;
  late final Rx<DateTime> selectedDate;

  @override
  void onInit() {
    final arguments = Get.arguments;
    destination = arguments['destination'];
    traveller = arguments['traveller'];
    selectedDate = arguments['date'];
    transactions.date = selectedDate.value;
    updatePrice();
    super.onInit();
  }

  String isSufficient(){
    if(transactions.price == 0){
      print("Kosong");
      return "Kosong";
    }
    else if(userController.user!.balance - transactions.grandTotal >= 0){
      print("Sufficient");
      return "Gas";
    }else{
      print("Tidak Cukup");
      return "Kurang";
    }
  }

  Future <void> createTransaction(TransactionModel transaction) async{
    try{
      await TransactionService().createTransaction(transaction);
      await payFromSaldo();
      status = TransactionStatus.success.obs;
    }catch(e){
      status = TransactionStatus.failed.obs;
      error = e.toString();
    }
  }

  Future<void> payFromSaldo()async{
    int newBalance;
    newBalance = userController.user!.balance - transactions.grandTotal;
    BalanceService().updateBalance(userController.user!.id, newBalance);
  }

  void updatePrice(){
    transactions.amountOfTraveler = traveller.value;
    transactions.price = traveller.value * transactions.destination.price;
    transactions.grandTotal = transactions.price + (transactions.price * 0.20).toInt();
    update();
  }
}