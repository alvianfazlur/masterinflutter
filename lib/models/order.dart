import 'package:cloud_firestore/cloud_firestore.dart';

class OrderModel {
  final int id;
  final String name;
  final int total_topup;
  final String status;
  final DateTime createdAt;
  final DateTime updatedAt;

  OrderModel(
      {required this.id,
      required this.name,
      required this.total_topup,
      required this.status,
      required this.createdAt, required this.updatedAt});

  factory OrderModel.fromJson(Map<String, dynamic> json) => OrderModel(
        id: json['id'],
        name: json['name'],
        total_topup: json['total_topup'],
        status: json['status'],
      createdAt : DateTime.parse(json['created_at']).toLocal(),
      updatedAt : DateTime.parse(json['updated_at']).toLocal()
      );
}
