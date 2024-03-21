import 'package:flutter/material.dart';

import '../../../../shared/theme.dart';

class PaymentSummaryItems extends StatelessWidget {
  const PaymentSummaryItems({Key? key, required this.title, required this.content}) : super(key: key);

  final String title;
  final String content;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(bottom: 10),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(title, style: greyTextStyle,),
          Text(content, style: blackTextStyle,)
        ],
      ),
    );
  }
}
