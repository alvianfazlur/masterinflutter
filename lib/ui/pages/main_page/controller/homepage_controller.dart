import 'package:bwa_masteringflutter/models/user.dart';
import 'package:bwa_masteringflutter/services/destination_service.dart';
import 'package:get/get.dart';
import '../../../../models/destination.dart';
import 'package:flutter/material.dart';

enum DestinationStatus { loading, success, failed }

class HomePageController extends GetxController {
  Rx<DestinationStatus> status = DestinationStatus.loading.obs;
  final TextEditingController search = TextEditingController();
  List<DestinationModel> destinations = [];
  List<DestinationModel> displayDestinations = [];
  final FocusNode searchPlaceFocus = FocusNode();
  final List<String> selectedFilter = [];
  userData? user;
  String? error;
  bool isFilter = true;

  @override
  void onInit() async {
    fetchDestinations();
    user = Get.arguments as userData;
    update();
    super.onInit();
  }

  Future<void> fetchDestinations() async {
    try {
      destinations = await DestinationService().fetchData();
      displayDestinations = destinations;
      status = DestinationStatus.success.obs;
      update();
    } catch (e) {
      status = DestinationStatus.failed.obs;
      error = e.toString();
      update();
    }
  }

  void updateList(String value) {
    if (selectedFilter.isNotEmpty) {
      displayDestinations = destinations
          .where((element) =>
              element.name.toLowerCase().contains(value.toLowerCase()) &&
              element.category
                  .toLowerCase()
                  .contains(selectedFilter.first.toLowerCase()))
          .toList();
    } else {
      displayDestinations = destinations
          .where((element) =>
              element.name.toLowerCase().contains(value.toLowerCase()))
          .toList();
    }
    update();
  }

  void filterList(String value) {
    if (search.text.isNotEmpty) {
      displayDestinations = destinations
          .where((element) =>
              element.category.toLowerCase().contains(value.toLowerCase()) &&
              element.name.toLowerCase().contains(search.text.toLowerCase()))
          .toList();
    }else{
      displayDestinations = destinations
          .where((element) =>
          element.category.toLowerCase().contains(value.toLowerCase())).toList();
    }
    update();
  }

  bool isSelected(String category){
    int index = selectedFilter.indexOf(category);
    if (index == -1) {
      return false;
    } else {
      return true;
    }
  }

  Future<void> selectCategory(String category) async {
    if (selectedFilter.isNotEmpty) {
      selectedFilter.clear();
    }
    selectedFilter.add(category);
    update();
  }

  void clearSearch() {
    search.clear();
    update();
  }
}
