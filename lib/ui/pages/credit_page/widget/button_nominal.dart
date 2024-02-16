import 'package:bwa_masteringflutter/shared/theme.dart';
import 'package:bwa_masteringflutter/ui/pages/credit_page/credit_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

class ButtonNominal extends StatelessWidget {
  ButtonNominal({
    Key? key,
    required this.nominal,
  }) : super(key: key);

  final int nominal;

  @override
  Widget build(BuildContext context) {
    return GetBuilder(
      builder: (CreditController controller) {
        bool isSelected = controller.isSelected(nominal);
       return GestureDetector(
          onTap: () {
            controller.selectNominal(nominal);
          },
          child: Container(
              alignment: Alignment.center,
              margin: EdgeInsets.only(bottom: 20, right: 10),
              width: 120,
              height: 40,
              decoration: BoxDecoration(
                  color: whiteColor,
                  border: Border.all(
                    color: isSelected ? Colors.blue : greyColor.withOpacity(
                        0.3),
                  ),
                  borderRadius: BorderRadius.circular(7)),
              child: Text(
                NumberFormat.currency(
                  locale: 'id',
                  symbol: 'Rp ',
                  decimalDigits: 0,
                ).format(nominal),
                style: blackTextStyle,
              )),
        );
      });
  }
}
