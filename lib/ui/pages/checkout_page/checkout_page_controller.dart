import 'package:bwa_masteringflutter/models/destination.dart';
import 'package:bwa_masteringflutter/models/transaction.dart';
import 'package:bwa_masteringflutter/services/transaction_service.dart';
import 'package:get/get.dart';

import '../choose_seat_page/seat_controller.dart';

enum TransactionStatus { loading, success, failed }

class CheckOutPageController extends GetxController{
  late final DestinationModel destination;
  Rx<TransactionStatus> status = TransactionStatus.loading.obs;
  late TransactionModel transactions = TransactionModel(destination: destination);
  var seatController = Get.find<SeatController>();
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

  Future <void> createTransaction(TransactionModel transaction) async{
    try{
      await TransactionService().createTransaction(transaction);
      status = TransactionStatus.success.obs;
    }catch(e){
      status = TransactionStatus.failed.obs;
      error = e.toString();
    }
  }
}