import 'package:bwa_masteringflutter/models/user.dart';
import 'package:bwa_masteringflutter/services/destination_service.dart';
import 'package:get/get.dart';
import '../../../../models/destination.dart';
import 'package:flutter/material.dart';

enum DestinationStatus{ loading, success, failed }

class HomePageController extends GetxController{
  Rx<DestinationStatus> status = DestinationStatus.loading.obs;
  final TextEditingController search = TextEditingController();
  List<DestinationModel> destinations = [];
  List<DestinationModel> displayDestinations = [];
  final FocusNode searchPlaceFocus = FocusNode();
  userData? user;
  String? error;

  @override
  void onInit() async{
    fetchDestinations();
    user = Get.arguments as userData;
    update();
    super.onInit();
  }

  Future<void> fetchDestinations() async {
    try{
      destinations = await DestinationService().fetchData();
      displayDestinations = destinations;
      status = DestinationStatus.success.obs;
      update();
    }catch(e){
      status = DestinationStatus.failed.obs;
      error = e.toString();
      update();
    }
  }

  void updateList(String value) {
    displayDestinations = destinations.where(
            (element) => element.name.toLowerCase().contains(value.toLowerCase())
    ).toList();
    update();
  }
  void clearSearch() {
    search.clear();
    update();
  }
}