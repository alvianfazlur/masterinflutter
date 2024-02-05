import 'package:bwa_masteringflutter/models/destination.dart';

class TransactionModel {
  final DestinationModel destination;
  final int amountOfTraveler;
  final String selectedSeats;
  final bool insurance;
  final bool refundable;
  final double vat;
  final int price;
  final int grandTotal;

  TransactionModel(
      {required this.destination,
      this.amountOfTraveler = 0,
      this.selectedSeats = '',
      this.insurance = false,
      this.refundable = false,
      this.vat = 0,
      this.price = 0,
      this.grandTotal = 0});
}
