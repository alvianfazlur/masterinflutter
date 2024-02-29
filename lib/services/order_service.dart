
import 'package:bwa_masteringflutter/models/order.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class OrderService{
  CollectionReference _orderReference =
  FirebaseFirestore.instance.collection('orders');

  Future<void> addOrder(OrderModel order) async {
    try {
      _orderReference.add({
        'order_id': order.order_id,
        'user_id': order.user_id,
        'total_topup': order.total_topup,
        'status': order.status,
      });
    } catch (e) {
      throw e;
    }
  }
  Future<List<OrderModel>> fetchOrder(String uid) async {
    try {
      QuerySnapshot result =  await _orderReference.where('user_id', isEqualTo: uid).get();
      List<OrderModel> orders = result.docs.map((e) {
        return OrderModel.fromJsonFb(e.data() as Map<String, dynamic>);
      }).toList();
      return orders;
    } catch (e) {
      throw e;
    }
  }
}