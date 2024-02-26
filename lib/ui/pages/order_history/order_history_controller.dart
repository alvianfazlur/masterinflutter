import 'dart:convert';
import 'package:bwa_masteringflutter/services/balance_service.dart';
import 'package:bwa_masteringflutter/ui/pages/main_page/destination_controller/homepage_controller.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';
import '../../../models/order.dart';
import '../../../shared/api_url.dart';

class OrderHistoryController extends GetxController{

  List<OrderModel> paidOrderData = [];
  List<OrderModel> displayOrderData = [];
  var userController = Get.find<HomePageController>();
  late SharedPreferences prefs;

  @override
  void onInit() async {
    prefs = await SharedPreferences.getInstance();
    paidOrderData.clear();
    displayOrderData = paidOrderData;
    await loadOrders();
    await fetchOrders(userController.user!.id);
    super.onInit();
  }

  Future<void> loadOrders() async {
    final orderJsonList = prefs.getStringList('order_data${userController.user!.id}');
    if (orderJsonList != null) {
      paidOrderData.clear();
      paidOrderData.addAll(orderJsonList.map((userJson) => OrderModel.fromJson(jsonDecode(userJson))));
    }
    update();
  }

  Future<void> fetchOrders(String uid) async {
    final String url = '$getOrderApi=$uid';
    final response = await http.get(Uri.parse(url));
      if(response.statusCode == 200){
        print("Get Data");
        final List<dynamic> orders = json.decode(response.body);
        getDataFromDb(orders);
      }

  }
  void getDataFromDb(List<dynamic> orders) async {
    for (var element in orders) {
      OrderModel order = OrderModel.fromJson(element);
      if (paidOrderData.any((existingOrder) => existingOrder.id == order.id && existingOrder.status == order.status)) {
        print('Order dengan id ${order.id} sudah pernah ditambahkan sebelumnya');
      }
      else {
        if(order.status == 'Paid'){
          print('Order dengan id ${order.id} akan ditambahkan pada shared preferences');
          paidOrderData.add(order);
          await saveOrders();
          await BalanceService().updateBalance(userController.user!.id, order.total_topup + userController.user!.balance);
        }else{
          print('Order dengan id ${order.id} akan ditambahkan pada list');
          displayOrderData.add(order);
        }
      }
    }
    update();
  }

  Future<void> saveOrders() async {
    print("saveOrders");
    final orderJsonList = paidOrderData.map((order) => jsonEncode(order.toJson())).toList();
    await prefs.setStringList('order_data${userController.user!.id}', orderJsonList);
  }
}