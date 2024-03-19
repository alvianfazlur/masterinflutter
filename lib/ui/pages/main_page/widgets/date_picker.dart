import 'package:bwa_masteringflutter/shared/theme.dart';
import 'package:bwa_masteringflutter/ui/pages/main_page/controller/homepage_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

class DatePickerBar extends StatelessWidget {
  const DatePickerBar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<HomePageController>(
      builder: (controller) => GestureDetector(
        onTap: (){
          controller.selectDate(context);
        },
        child: Container(
          margin: EdgeInsets.only(top: 10),
          height: 50,
          decoration: BoxDecoration(
            border: Border.all(color: greyColor.withOpacity(0.2),),
            borderRadius: BorderRadius.circular(10),
            color: backgroundColor
          ),
          child: Row(
            children: [
              Container(
                margin: EdgeInsets.only(left: 22),
                height: 18,
                width: 18,
                decoration: BoxDecoration(image: DecorationImage(image: AssetImage("assets/images/calendar_icon.png"))),
              ),
              SizedBox(width: 10),
              Text(
                "${controller.selectedDate.value.day} ${DateFormat.MMMM().format(controller.selectedDate.value)} ${controller.selectedDate.value.year}",
                style: blackTextStyle.copyWith(fontWeight: semiBold),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
