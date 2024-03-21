import 'package:bwa_masteringflutter/ui/pages/credit_page/credit_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../../../../shared/theme.dart';

class InputSaldo extends StatelessWidget {
  const InputSaldo({Key? key, required this.controller}) : super(key: key);

  final CreditController controller;
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(top: 30, left: 25, right: 30),
      padding: EdgeInsets.only(left: 10, right: 5),
      decoration: BoxDecoration(
        color: whiteColor,
          borderRadius: BorderRadius.circular(10),
          border: Border.all(color: greyColor.withOpacity(0.3))
      ),
      child: TextFormField(
        style: blackTextStyle,
        onChanged: (value) {
          controller.selectNominal(int.tryParse(value) ?? 0);
        },
        controller: controller.search,
        autofocus: false,
        keyboardType: TextInputType.number,
        inputFormatters: <TextInputFormatter>[
          FilteringTextInputFormatter.digitsOnly,
        ],
        textInputAction: TextInputAction.done,
        decoration: InputDecoration(
          border: InputBorder.none,
          hintText: "Total Amount",
        ),
      ),
    );
  }
}
