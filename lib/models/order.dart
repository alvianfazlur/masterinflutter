class OrderModel {
  final int id;
  final String name;
  final int total_topup;
  final String status;

  OrderModel(
      {required this.id,
      required this.name,
      required this.total_topup,
      required this.status,});

  factory OrderModel.fromJson(Map<String, dynamic> json) => OrderModel(
        id: json['id'],
        name: json['name'],
        total_topup: json['total_topup'],
        status: json['status'],
      );

  Map<String, dynamic> toJson() => {
    'id': id,
    'name': name,
    'total_topup': total_topup,
    'status': status,
  };
}
