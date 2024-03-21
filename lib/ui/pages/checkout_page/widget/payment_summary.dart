import 'package:bwa_masteringflutter/shared/theme.dart';
import 'package:bwa_masteringflutter/ui/pages/checkout_page/checkout_page_controller.dart';
import 'package:bwa_masteringflutter/ui/pages/checkout_page/widget/payment_summary_items.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class PaymentSummary extends StatelessWidget {
  const PaymentSummary({Key? key, required this.controller}) : super(key: key);

  final CheckOutPageController controller;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(left: 25, right: 25, bottom: 25),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "Payment Summary",
            style: blackTextStyle.copyWith(fontSize: 16, fontWeight: semiBold),
          ),
          SizedBox(height: 10),
          PaymentSummaryItems(
              title: "Total Tickets",
              content: "${controller.traveller} Person"),
          PaymentSummaryItems(
            title: "Ticket Price",
            content: NumberFormat.currency(
              locale: 'id',
              symbol: 'Rp ',
              decimalDigits: 0,
            ).format(controller.transactions.price),
          ),
          PaymentSummaryItems(
            title: "Voucher Discount",
            content: " - ",
          ),
          PaymentSummaryItems(
            title: "Payment Method",
            content: "Punggawa Pay",
          ),
          PaymentSummaryItems(
            title: "Admin Fee",
            content: "20%",
          ),
          Container(
            margin: EdgeInsets.only(bottom: 10),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "Total Price",
                  style: blackTextStyle.copyWith(fontWeight: bold, fontSize: 16),
                ),
                Text(
                  NumberFormat.currency(
                    locale: 'id',
                    symbol: 'Rp ',
                    decimalDigits: 0,
                  ).format(controller.transactions.grandTotal),
                  style: blackTextStyle.copyWith(fontWeight: bold, fontSize: 16),
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
