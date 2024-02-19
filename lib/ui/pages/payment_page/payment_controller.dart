
import 'package:get/get.dart';

class PaymentController extends GetxController{

  String? snapToken;

  @override
  void onInit() {
    snapToken = Get.arguments;
    print(snapToken);
    update();
    super.onInit();
  }
}