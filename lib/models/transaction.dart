import 'package:bwa_masteringflutter/models/destination.dart';

class TransactionModel {
  DestinationModel destination;
  int amountOfTraveler;
  String selectedSeats;
  bool insurance;
  bool refundable;
  double vat;
  int price;
  int grandTotal;

  TransactionModel(
      {required this.destination,
      this.amountOfTraveler = 0,
      this.selectedSeats = '',
      this.insurance = true,
      this.refundable = false,
      this.vat = 0.45,
      this.price = 0,
      this.grandTotal = 0});
}
