import 'package:get/get.dart';

import '../../../models/destination.dart';

class SeatController extends GetxController{

  final List<String> seatOccupied = [];
  late final DestinationModel destination;

  @override
  void onInit() {
    destination = Get.arguments;
    super.onInit();
  }

  Future<void> selectSeat(String id) async {
    if(!isSelected(id)){
      seatOccupied.add(id);
      update();
    }else{
      seatOccupied.remove(id);
      update();
    }
    print(seatOccupied);
    update();
  }

  bool isSelected(String id){
    int index = seatOccupied.indexOf(id);
    if(index == -1){
      return false;
    }
    else
      return true;
  }
}