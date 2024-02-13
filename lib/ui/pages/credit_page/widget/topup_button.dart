import 'package:bwa_masteringflutter/shared/theme.dart';
import 'package:bwa_masteringflutter/ui/pages/credit_page/credit_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class TopUpButton extends StatelessWidget {
  TopUpButton({Key? key}) : super(key: key);
  var controller = Get.find<CreditController>();

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(top: 20),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          GestureDetector(
            onTap: (){
              controller.topUp(id: controller.user!.id, balance: 10000);
            },
            child: Column(
              children: [
                Container(
                    width: 50,
                    height: 50,
                    margin: EdgeInsets.only(bottom: 6),
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(13),
                        color: Colors.blue,
                        image: DecorationImage(
                          opacity: 0.7,
                            image: AssetImage('assets/images/topup.png')))),
                Text("Top Up", style: blackTextStyle.copyWith(fontSize: 12, ),)
              ],
            ),
          )
        ],
      ),
    );
  }
}
