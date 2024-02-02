import 'package:bwa_masteringflutter/shared/theme.dart';
import 'package:bwa_masteringflutter/ui/pages/choose_seat_page/seat_controller.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SeatItem extends StatelessWidget {
  SeatItem({Key? key, required this.status, required this.id}) : super(key: key);

  //NOTE : 0 = Available, 1 = Selected, 2 = Unavailable
  final int status;
  final String id;
  var controller = Get.put(SeatController());

  @override
  Widget build(BuildContext context) {

    backgroundColor(){
      switch (status){
        case 0:
          return availableColor;
        case 1:
          return primaryColor;
        case 2:
          return CupertinoColors.systemGrey4;
        default:
          return CupertinoColors.systemGrey4;
      }
    }

    borderColor(){
      switch(status){
        case 0:
          return primaryColor;
        case 1:
          return primaryColor;
        case 2:
          return unavailableColor;
        default:
          return unavailableColor;
      }
    }
    child(){
      switch(status){
        case 0:
          return SizedBox();
        case 1:
          return  Center(child: Text("YOU", style: whiteTextStyle.copyWith(fontWeight: semiBold),));
        case 2:
          return  SizedBox();
        default:
          return  SizedBox();
      }
    }
    return GestureDetector(
      onTap: (){
        controller.selectSeat(id);
      },
      child: Container(
        margin: EdgeInsets.only(top: 16),
        width: 48,
        height: 48,
        decoration: BoxDecoration(
          border: Border.all(color: borderColor(),width: 2),
            color: backgroundColor(),
            borderRadius: BorderRadius.circular(15)),
        child: child()
      ),
    );
  }
}
