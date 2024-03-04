import 'package:bwa_masteringflutter/shared/theme.dart';
import 'package:bwa_masteringflutter/ui/pages/credit_page/credit_controller.dart';
import 'package:bwa_masteringflutter/ui/pages/credit_page/widget/credit_content.dart';
import 'package:bwa_masteringflutter/ui/pages/credit_page/widget/display_topup.dart';
import 'package:bwa_masteringflutter/ui/pages/credit_page/widget/header.dart';
import 'package:bwa_masteringflutter/ui/widgets/bottom_navbar.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CreditPage extends GetView<CreditController> {
  const CreditPage({Key? key}) : super(key: key);
  static const routeName = '/credit';

  @override
  Widget build(BuildContext context) {

    return GetBuilder<CreditController>(
      builder: (controller) =>
          Scaffold(
            resizeToAvoidBottomInset: false,
            backgroundColor: backgroundColor,
            body: SafeArea(
                child: RefreshIndicator(
                  onRefresh: () async {
                   await controller.fetchBalance();
                  },
                  child: Stack(
                    children: [
                      ListView(
                        children: [
                          CreditContent(controller: controller),
                          DisplayTopUp()
                        ],
                      ),
                      Header(),
                      BottomNavbar(
                        isSelectedSaldo: true,
                      )
                    ],
                  ),
                )),
          ),
    );
  }
}
