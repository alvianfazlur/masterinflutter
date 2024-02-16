import 'package:bwa_masteringflutter/shared/theme.dart';
import 'package:bwa_masteringflutter/ui/pages/credit_page/credit_controller.dart';
import 'package:bwa_masteringflutter/ui/pages/credit_page/widget/display_topup.dart';
import 'package:bwa_masteringflutter/ui/pages/credit_page/widget/header.dart';
import 'package:bwa_masteringflutter/ui/pages/credit_page/widget/topup_button.dart';
import 'package:bwa_masteringflutter/ui/widgets/bottom_navbar.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

class CreditPage extends GetView<CreditController> {
  const CreditPage({Key? key}) : super(key: key);
  static const routeName = '/credit';

  @override
  Widget build(BuildContext context) {

    Widget Content() {
      return Container(
        height: 200,
        margin: EdgeInsets.only(
            left: defaultMargin, top: 100, right: defaultMargin),
        padding: EdgeInsets.only(left: 20, top: 10, right: 24),
        decoration: BoxDecoration(
            color: whiteColor,
            border: Border.all(color: blackColor.withOpacity(0.1)),
            borderRadius: BorderRadius.circular(18)),
        width: double.infinity,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text("Saldo Rekening Utama", style: greyTextStyle.copyWith(fontWeight: medium),),
            SizedBox(height: 10,),
            Text(NumberFormat.currency(
              locale: 'id',
              symbol: 'Rp ',
              decimalDigits: 0,
            ).format(controller.user!.balance),
            style: blackTextStyle.copyWith(fontWeight: bold, fontSize: 20),),
            Container(
              margin: EdgeInsets.only(top: 20),
              color: greyColor.withOpacity(0.3),
              padding: EdgeInsets.all(1),
            ),
            TopUpButton(),
          ],
        ),
      );
    }

    return GetBuilder<CreditController>(
      builder: (controller) =>
          Scaffold(
            backgroundColor: backgroundColor,
            body: SafeArea(
                child: Stack(
                  children: [
                    ListView(
                      children: [
                        Content(),
                        DisplayTopUp()
                      ],
                    ),
                    Header(),
                    BottomNavbar(
                      isSelectedSaldo: true,
                    )
                  ],
                )),
          ),
    );
  }
}
