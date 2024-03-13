import 'package:bwa_masteringflutter/models/destination.dart';
import 'package:bwa_masteringflutter/shared/theme.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:intl/intl.dart';

import '../pages/detail_page/detail_page.dart';

class NewDestination extends StatelessWidget {
  const NewDestination(this.destination,
      {Key? key,
      })
      : super(key: key);
  final DestinationModel destination;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Get.toNamed(DetailPage.routeName, arguments: destination);
      },
      child: Container(
        margin: EdgeInsets.only(top: 16),
        padding: EdgeInsets.all(10),
        decoration: BoxDecoration(
          color: whiteColor,
          borderRadius: BorderRadius.circular(18),
        ),
        child: Row(
          children: [
            Container(
              width: 112,
              height: 100,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(18),
                  image: DecorationImage(
                      fit: BoxFit.cover, image: NetworkImage(destination.imageurl))),
            ),
            Expanded(
              child: Container(
                margin: EdgeInsets.only(left: 16),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      destination.city,
                      style:
                      greyTextStyle.copyWith(fontSize: 12),
                    ),
                    SizedBox(height: 6,),
                    Text(
                      destination.name,
                      style:
                      blackTextStyle.copyWith(fontWeight: semiBold, fontSize: 16),
                    ),
                    SizedBox(height: 6,),
                    Text(NumberFormat.currency(
                      locale: 'id',
                      symbol: 'Rp ',
                      decimalDigits: 0,
                    ).format(destination.price),
                      style:
                      purpleTextStyle.copyWith(fontWeight: semiBold),
                    ),
                    SizedBox(
                      height: 5,
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
