import 'package:bwa_masteringflutter/models/destination.dart';

class TransactionModel {
  String? id;
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
      this.grandTotal = 0,
      this.id});

  factory TransactionModel.fromJson(String id, Map<String, dynamic> json) =>
      TransactionModel(
          id: id,
          destination: DestinationModel.fromJson(json['destination']['id'], json['destination']),
          amountOfTraveler: json['amountOfTraveler'],
          selectedSeats: json['selectedSeats'],
          insurance: json['insurance'],
          refundable: json['refundable'],
          vat: json['vat'],
          price: json['price'],
          grandTotal: json['grandTotal']);
}
