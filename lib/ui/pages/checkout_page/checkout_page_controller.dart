import 'package:bwa_masteringflutter/models/destination.dart';
import 'package:get/get.dart';

class CheckOutPageController extends GetxController{
  late final DestinationModel destination;

  @override
  void onInit() {
    destination = Get.arguments as DestinationModel;
    print(destination);
    super.onInit();
  }
}