import 'package:bwa_masteringflutter/ui/pages/credit_page/credit_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../../shared/theme.dart';
import '../../order_history/order_history_page.dart';

class Header extends StatelessWidget {
  Header({Key? key}) : super(key: key);
  var controller = Get.find<CreditController>();

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(10),
      margin: EdgeInsets.only(left: 30, top: 20),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(
            child: Container(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Top Up",
                    style: blackTextStyle.copyWith(fontWeight: semiBold, fontSize: 24),
                  ),
                  SizedBox(height: 6,),
                  Text("Join us and get your next journey", style: greyTextStyle,)
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
    );
  }
}
