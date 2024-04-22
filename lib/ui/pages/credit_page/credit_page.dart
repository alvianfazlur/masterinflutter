import 'package:bwa_masteringflutter/shared/theme.dart';
import 'package:bwa_masteringflutter/ui/pages/credit_page/credit_controller.dart';
import 'package:bwa_masteringflutter/ui/pages/credit_page/widget/credit_content.dart';
import 'package:bwa_masteringflutter/ui/pages/credit_page/widget/display_topup.dart';
import 'package:bwa_masteringflutter/ui/pages/credit_page/widget/header.dart';
import 'package:bwa_masteringflutter/ui/widgets/bottom_navbar.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CreditPage extends GetView<CreditController> {
  const CreditPage({Key? key}) : super(key: key);
  static const routeName = '/credit';

  @override
  Widget build(BuildContext context) {
    return GetBuilder<CreditController>(
      builder: (controller) => Scaffold(
        resizeToAvoidBottomInset: false,
        backgroundColor: primaryColor,
        body: SafeArea(
          child: RefreshIndicator(
            onRefresh: () async {
              await controller.fetchBalance();
            },
            child: Stack(
              children: [
                Header(),
                Container(
                  margin: EdgeInsets.only(top: 100),
                  decoration: BoxDecoration(
                    color: whiteColor,
                    borderRadius: BorderRadius.only(topLeft: Radius.circular(20), topRight: Radius.circular(20))
                  ),
                  padding: EdgeInsets.only(bottom: 150),
                  child: ListView(
                    children: [
                      CreditContent(user: controller.user,),
                    ],
                  ),
                ),
                Positioned(
                  left: 30,
                  right: 30,
                  bottom: 100,
                  child: Container(
                    width: double.infinity,
                    height: 50,
                    child: TextButton(
                      style: TextButton.styleFrom(
                        backgroundColor: primaryColor,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(12),
                        ),
                      ),
                      onPressed: () {
                        Get.toNamed(DisplayTopUp.routeName);
                      },
                      child: Text(
                        'Top Up Now',
                        style: whiteTextStyle.copyWith(
                          fontWeight: medium,
                          fontSize: 18,
                        ),
                      ),
                    ),
                  ),
                ),
                BottomNavbar(
                  isSelectedSaldo: true, user: controller.user,
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
