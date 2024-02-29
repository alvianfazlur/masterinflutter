import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';

import '../../../../shared/theme.dart';
import '../checkout_page_controller.dart';

class AddTraveller extends StatelessWidget {
  const AddTraveller({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<CheckOutPageController>(
      builder: (controller) => Container(
        margin: EdgeInsets.only(bottom: 16),
        child: Row(
          children: [
            Expanded(
              child: Row(
                children: [
                  Container(
                    width: 16,
                    height: 16,
                    margin: EdgeInsets.only(right: 6),
                    decoration: BoxDecoration(
                        image: DecorationImage(image: AssetImage('assets/images/fi_check.png'))
                    ),
                  ),
                  Text("Traveler", style: blackTextStyle,),
                ],
              ),
            ),
            Container(
              width: 35,
              height: 30,
              margin: EdgeInsets.only(left: 6, right: 6),
              decoration: BoxDecoration(
                border: Border.all()
              ),
              child: TextFormField(
                controller: controller.personController,
                style: blackTextStyle,
                textAlign: TextAlign.center,
                decoration: InputDecoration(
                  border: InputBorder.none,
                ),
                onChanged: (value) {
                  controller.updatePrice(value);
                },
                keyboardType: TextInputType.number,
                inputFormatters: <TextInputFormatter>[
                  FilteringTextInputFormatter.digitsOnly,
                  LengthLimitingTextInputFormatter(2),
                ],
              )
            ),
          ],
        ),
      ),
    );
  }
}
