import 'package:bwa_masteringflutter/shared/theme.dart';
import 'package:bwa_masteringflutter/ui/pages/choose_seat_page/seat_controller.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SeatItem extends StatelessWidget {
  SeatItem({Key? key, this.isAvailable = true, required this.id}) : super(key: key);

  //NOTE : 0 = Available, 1 = Selected, 2 = Unavailable
  final String id;
  final bool isAvailable;
  var controller = Get.put(SeatController());

  @override
  Widget build(BuildContext context) {

    return GetBuilder<SeatController>(
      builder: (controller) {
        bool isSelected = controller.isSelected(id);
        return GestureDetector(
          onTap: (){
            if(isAvailable){
              controller.selectSeat(id);
            }
          },
          child: Container(
            margin: EdgeInsets.only(top: 16),
            width: 48,
            height: 48,
            decoration: BoxDecoration(
                border: Border.all(color: borderColor(),width: 2),
                color: backgroundColor(),
                borderRadius: BorderRadius.circular(15)),
            child: isSelected ? Center(child: Text("YOU", style: whiteTextStyle.copyWith(fontWeight: semiBold),)) : SizedBox(),
          ),
        );
      },
    );
  }

  Color backgroundColor(){
    if(!isAvailable){
      return unavailableColor;
    } else{
      if(controller.isSelected(id)){
        return primaryColor;
      }
      else{
        return availableColor;
      }
    }
  }

  Color borderColor(){
    if(!isAvailable){
      return unavailableColor;
    } else{
      return primaryColor;
    }
  }
}
