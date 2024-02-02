import 'package:get/get.dart';

class SeatController extends GetxController{

  final List<String> seatOccupied = [];

  Future<void> selectSeat(String id) async {
    if(!isSelected(id)){
      seatOccupied.add(id);
    }
    update();
  }

  bool isSelected(String id){
    int index = seatOccupied.indexOf(id);
    print(index);
    if(index == -1){
      return false;
    }
    else
      return true;
  }
}