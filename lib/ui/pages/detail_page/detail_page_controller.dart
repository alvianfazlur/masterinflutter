import 'package:bwa_masteringflutter/models/destination.dart';
import 'package:get/get.dart';

class DetailPageController extends GetxController{
  late final DestinationModel destination;

  @override
  void onInit() {
    destination = Get.arguments as DestinationModel;
    super.onInit();
  }
}