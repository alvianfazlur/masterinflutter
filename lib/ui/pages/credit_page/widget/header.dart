import 'package:bwa_masteringflutter/ui/order_history/order_history_page.dart';
import 'package:bwa_masteringflutter/ui/pages/credit_page/credit_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../shared/theme.dart';

class Header extends StatelessWidget {
  Header({Key? key}) : super(key: key);
  var controller = Get.find<CreditController>();

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: EdgeInsets.all(10),
      decoration: BoxDecoration(
        color: backgroundColor,
        border: Border(
          bottom: BorderSide(
            color: greyColor.withOpacity(0.2)
          )
        )
      ),
      child: Row(
        children: [
          Container(
            height: 50,
            width: 80,
            decoration: BoxDecoration(
                image: DecorationImage(
                    image: AssetImage('assets/images/logo_punggawa.ico'))),
          ),
          SizedBox(
            width: 6,
          ),
          Expanded(
            child: Container(
              height: 50,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Hai,",
                    style: blackTextStyle.copyWith(fontWeight: light),
                  ),
                  Text(
                    "${controller.user!.name.toUpperCase()}",
                    style: blackTextStyle.copyWith(fontWeight: bold),
                  ),
                ],
              ),
            ),
          ),
          GestureDetector(
            onTap: (){
              Get.toNamed(OrderHistoryPage.routeName);
            },
            child: Container(
              padding: EdgeInsets.all(10),
              height: 50,
              decoration: BoxDecoration(
                  color: whiteColor, borderRadius: BorderRadius.circular(10)),
              child: Row(
                children: [
                  Container(
                    margin: EdgeInsets.only(right: 6),
                    width: 24,
                    height: 24,
                    decoration: BoxDecoration(
                        image: DecorationImage(
                            image: AssetImage('assets/images/history.png'))),
                  ),
                ],
              ),
            ),
          )
        ],
      ),
    );;
  }
}
