import 'package:bwa_masteringflutter/models/destination.dart';
import 'package:bwa_masteringflutter/ui/pages/detail_page/detail_page.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

import '../../shared/theme.dart';

class DestinationCard extends StatelessWidget {
  const DestinationCard(this.destination,
      {Key? key,
      })
      : super(key: key);

  final DestinationModel destination;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: (){
        Get.toNamed(DetailPage.routeName, arguments: destination);
      },
      child: Container(
        margin: EdgeInsets.only(right: 20),
        width: 215,
        height: 310,
        padding: EdgeInsets.all(10),
        decoration: BoxDecoration(
          border: Border.all(color: greyHintTextColor.withOpacity(0.3)),
            borderRadius: BorderRadius.circular(18), color: whiteColor),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              width: 195,
              height: 180,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(defaultRadius),
                  image: DecorationImage(
                    fit: BoxFit.cover,
                      image:
                          NetworkImage(destination.imageurl))),
            ),
            SizedBox(
              height: 20,
            ),
            Container(
              margin: EdgeInsets.only(left: 10),
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
                        blackTextStyle.copyWith(fontWeight: semiBold, fontSize: 18),
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
            )
          ],
        ),
      ),
    );
  }
}
