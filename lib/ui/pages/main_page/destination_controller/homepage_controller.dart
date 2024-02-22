import 'package:bwa_masteringflutter/models/user.dart';
import 'package:bwa_masteringflutter/services/destination_service.dart';
import 'package:get/get.dart';
import '../../../../models/destination.dart';

enum DestinationStatus{ loading, success, failed }

class HomePageController extends GetxController{
  Rx<DestinationStatus> status = DestinationStatus.loading.obs;
  List<DestinationModel> destinations = [];
  userData? user;
  String? error;

  @override
  void onInit() {
    fetchDestinations();
    user = Get.arguments as userData;
    update();
    super.onInit();
  }

  Future<void> fetchDestinations() async {
    try{
      destinations = await DestinationService().fetchData();
      status = DestinationStatus.success.obs;
      update();
    }catch(e){
      status = DestinationStatus.failed.obs;
      error = e.toString();
      update();
    }
  }
}