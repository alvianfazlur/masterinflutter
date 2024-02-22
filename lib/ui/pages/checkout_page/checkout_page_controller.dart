import 'package:bwa_masteringflutter/models/destination.dart';
import 'package:bwa_masteringflutter/models/transaction.dart';
import 'package:bwa_masteringflutter/services/balance_service.dart';
import 'package:bwa_masteringflutter/services/transaction_service.dart';
import 'package:get/get.dart';

import '../choose_seat_page/seat_controller.dart';
import '../main_page/destination_controller/homepage_controller.dart';

enum TransactionStatus { loading, success, failed }

class CheckOutPageController extends GetxController{
  late final DestinationModel destination;
  Rx<TransactionStatus> status = TransactionStatus.loading.obs;
  late TransactionModel transactions = TransactionModel(destination: destination, uid: userController.user!.id);
  var seatController = Get.find<SeatController>();
  var userController = Get.find<HomePageController>();
  String? error;

  @override
  void onInit() {
    destination = Get.arguments as DestinationModel;
    transactions.amountOfTraveler = seatController.seatOccupied.length;
    transactions.selectedSeats = seatController.seatOccupied.join(', ');
    transactions.price = seatController.seatOccupied.length * destination.price;
    transactions.grandTotal = transactions.price + (transactions.price * 0.45).toInt();
    super.onInit();
  }

  bool isSufficient(){
    if(userController.user!.balance - transactions.grandTotal >= 0){
      print("Sufficient");
      return true;
    }else{
      print("Tidak CUkup");
      return false;
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
}