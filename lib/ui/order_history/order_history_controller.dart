import 'dart:convert';

import 'package:bwa_masteringflutter/services/balance_service.dart';
import 'package:bwa_masteringflutter/ui/pages/main_page/destination_controller/homepage_controller.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';
import '../../models/order.dart';
import '../../shared/api_url.dart';
import '../pages/bonus_page/bonus_controller.dart';

class OrderHistoryController extends GetxController{

  List<OrderModel> orderData = [];
  var userController = Get.find<HomePageController>();
  var isFetch = false.obs;
  late SharedPreferences prefs;

  @override
  void onInit() async {
    prefs = await SharedPreferences.getInstance();
    loadOrders();
    fetchOrders(userController.user!.id);
    super.onInit();
  }

  Future<void> loadOrders() async {
    final orderJsonList = prefs.getStringList('order_data${userController.user!.id}');
    if (orderJsonList != null) {
      orderData.clear();
      orderData.addAll(orderJsonList.map((userJson) => OrderModel.fromJson(jsonDecode(userJson))));
    }
    update();
  }

  Future<void> fetchOrders(String uid) async {
    isFetch.value = true;
    final String url = '$getOrderApi=$uid';
    final response = await http.get(Uri.parse(url));
    if(isFetch.value){
      if(response.statusCode == 200){
        print("Get Data");
        final List<dynamic> orders = json.decode(response.body);
        getDataFromDb(orders);
        isFetch.value = false;
      }
    }

  }
  void getDataFromDb(List<dynamic> orders) async {
    for (var element in orders) {
      OrderModel order = OrderModel.fromJson(element);
      if (orderData.any((existingOrder) => existingOrder.id == order.id)) {
        print('Order dengan id ${order.id} sudah pernah ditambahkan sebelumnya');
      } else {
        orderData.add(order);
        if(order.status == 'Paid'){
          await BalanceService().updateBalance(userController.user!.id, order.total_topup + userController.user!.balance);
        }
      }
      await saveOrders();
    }

    update();
  }

  Future<void> saveOrders() async {
    final orderJsonList = orderData.map((order) => jsonEncode(order.toJson())).toList();
    await prefs.setStringList('order_data${userController.user!.id}', orderJsonList);
  }

}