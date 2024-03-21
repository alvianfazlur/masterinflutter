import 'package:bwa_masteringflutter/ui/pages/checkout_page/checkout_page_controller.dart';
import 'package:bwa_masteringflutter/ui/pages/checkout_page/widget/date_item.dart';
import 'package:flutter/material.dart';

import '../../../../shared/theme.dart';
import 'add_traveler.dart';

class DetailTicket extends StatelessWidget {
  const DetailTicket({Key? key, required this.controller}) : super(key: key);

  final CheckOutPageController controller;
  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: EdgeInsets.only(left: 25, right: 25, top: 30),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text("Details Ticket", style: blackTextStyle.copyWith(fontWeight: semiBold, fontSize: 16),),
          SizedBox(height: 15,),
          Container(
            decoration: BoxDecoration(
                border: Border.all(color: greyColor.withOpacity(0.3), width: 2),
              borderRadius: BorderRadius.circular(15)
            ),
            child: Column(
              children: [
                Row(
                  children: [
                    Container(
                      width: 60,
                      height: 60,
                      margin: EdgeInsets.only(right: 15, left: 15, top: 15),
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(18),
                          image: DecorationImage(
                              image: NetworkImage(
                                  controller.transactions.destination.imageurl),
                              fit: BoxFit.cover)),
                    ),
                    Container(
                      margin: EdgeInsets.only(top: 20),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            controller.transactions.destination.name,
                            style: blackTextStyle.copyWith(
                                fontWeight: semiBold, fontSize: 16),
                          ),
                          Text(
                            controller.transactions.destination.city,
                            style: greyTextStyle.copyWith(fontWeight: light, fontSize: 12),
                          )
                        ],
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  height: 20,
                ),
                Container(
                  decoration: BoxDecoration(
                    border: Border.all(color: greyColor.withOpacity(0.2))
                  ),
                ),
                SizedBox(height: 20,),
                AddTraveller(),
                DateItem(),
                SizedBox(height: 10,),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
