import 'package:bwa_masteringflutter/ui/pages/credit_page/widget/topup_button.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import '../../../../shared/theme.dart';
import '../credit_controller.dart';

class CreditContent extends StatelessWidget {
  const CreditContent({Key? key, required this.controller}) : super(key: key);

  final CreditController controller;
  @override
  Widget build(BuildContext context) {
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
}
