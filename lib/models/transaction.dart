import 'package:bwa_masteringflutter/models/destination.dart';

class TransactionModel {
  String? id;
  final String uid;
  DestinationModel destination;
  int amountOfTraveler;
  bool insurance;
  bool refundable;
  double vat;
  int price;
  int grandTotal;
  DateTime date;
  DateTime dateCreated;

  TransactionModel(
      {required this.destination,
        required this.uid,
        required this.date,
        required this.dateCreated,
      this.amountOfTraveler = 0,
      this.insurance = true,
      this.refundable = false,
      this.vat = 0.45,
      this.price = 0,
      this.grandTotal = 0,
      this.id});

  factory TransactionModel.fromJson(String id, Map<String, dynamic> json) =>
      TransactionModel(
          id: id,
          uid: json['uid'],
          destination: DestinationModel.fromJson(json['destination']['id'], json['destination']),
          amountOfTraveler: json['amountOfTraveler'],
          insurance: json['insurance'],
          refundable: json['refundable'],
          vat: json['vat'],
          price: json['price'],
          date: DateTime.fromMillisecondsSinceEpoch(json['date'].millisecondsSinceEpoch),
          dateCreated: DateTime.fromMillisecondsSinceEpoch(json['dateCreated'].millisecondsSinceEpoch),
          grandTotal: json['grandTotal']);
}
