class OrderModel {
  final int order_id;
  final int total_topup;
  final String status;
  final String user_id;

  OrderModel({
    required this.order_id,
    required this.user_id,
    required this.total_topup,
    required this.status,
  });

  factory OrderModel.fromJson(Map<String, dynamic> json) => OrderModel(
      order_id: json['id'],
      total_topup: json['total_topup'],
      status: json['status'],
      user_id: json['user_id']);

  factory OrderModel.fromJsonFb(Map<String, dynamic> json) => OrderModel(
      order_id: json['order_id'],
      total_topup: json['total_topup'],
      status: json['status'],
      user_id: json['user_id']);
}
