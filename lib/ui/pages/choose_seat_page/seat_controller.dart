import 'package:get/get.dart';

class SeatController extends GetxController{

  final List<String> seatOccupied = [];

  Future<void> selectSeat(String id) async {
    if(!isSelected(id)){
      seatOccupied.add(id);
      update();
    }else{
      seatOccupied.remove(id);
      update();
    }
    print(seatOccupied);
    var list = List.from(seatOccupied);
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