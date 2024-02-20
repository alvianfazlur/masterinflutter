import 'dart:convert';

import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import '../../models/order.dart';
import '../../shared/api_url.dart';
import '../pages/bonus_page/bonus_controller.dart';

class OrderHistoryController extends GetxController{

  List<OrderModel> orderData = [];
  var userController = Get.find<BonusPageController>();
  var isFetch = false.obs;

  @override
  void onInit() {
    fetchOrders(userController.user.id);
    super.onInit();
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
    orderData.clear();
    for (var element in orders) {
      orderData.add(OrderModel.fromJson(element));
    }

    update();
  }
}