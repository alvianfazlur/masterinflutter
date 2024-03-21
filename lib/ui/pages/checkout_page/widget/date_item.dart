import 'dart:ffi';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

import '../../../../shared/theme.dart';
import '../checkout_page_controller.dart';

class DateItem extends StatelessWidget {
  const DateItem({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<CheckOutPageController>(
      builder: (controller) => Container(
        margin: EdgeInsets.only(bottom: 15, right: 15),
        child: Row(
          children: [
            Expanded(
              child: Row(
                children: [
                  Container(
                    width: 16,
                    height: 16,
                    margin: EdgeInsets.only(right: 6, left: 15),
                    decoration: BoxDecoration(
                        image: DecorationImage(
                            image:
                                AssetImage('assets/images/calendar_fill.png'))),
                  ),
                  Text(
                    "Date",
                    style: blackTextStyle.copyWith(fontWeight: semiBold),
                  ),
                ],
              ),
            ),
            Text(
                "${controller.selectedDate.value.day} ${DateFormat.MMMM().format(controller.selectedDate.value)} ${controller.selectedDate.value.year}",
                style: greyTextStyle)
          ],
        ),
      ),
    );
  }
}
