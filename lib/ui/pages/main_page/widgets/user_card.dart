import 'package:bwa_masteringflutter/models/user.dart';
import 'package:bwa_masteringflutter/shared/theme.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class UserCard extends StatelessWidget {
  const UserCard({Key? key, required this.user}) : super(key: key);

  final userData? user;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 180,
      decoration: BoxDecoration(
          image: DecorationImage(
              image: AssetImage("assets/images/card_punggawapay.png"))),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            margin: EdgeInsets.only(left: 20, top: 30),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Total Balances",
                  style: whiteTextStyle.copyWith(fontSize: 13),
                ),
                SizedBox(
                  height: 5,
                ),
                Text(
                  NumberFormat.currency(
                    locale: 'id',
                    symbol: 'Rp ',
                    decimalDigits: 0,
                  ).format(user!.balance),
                  style:
                      whiteTextStyle.copyWith(fontWeight: bold, fontSize: 18),
                )
              ],
            ),
          ),
          Container(
            margin: EdgeInsets.only(top: 17, left: 20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Name",
                  style:
                      whiteTextStyle.copyWith(fontSize: 13, fontWeight: light),
                ),
                SizedBox(
                  height: 5,
                ),
                Text(
                  user!.name,
                  style:
                      whiteTextStyle.copyWith(fontSize: 15, fontWeight: bold),
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
