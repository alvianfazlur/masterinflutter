import 'package:bwa_masteringflutter/models/destination.dart';
import 'package:bwa_masteringflutter/shared/theme.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

import '../pages/detail_page/detail_page.dart';

class NewDestination extends StatelessWidget {
  const NewDestination(this.destinations,
      {Key? key,
      })
      : super(key: key);
  final DestinationModel destinations;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Get.toNamed(DetailPage.routeName, arguments: destinations);
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
              width: 70,
              height: 70,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(18),
                  image: DecorationImage(
                      fit: BoxFit.cover, image: NetworkImage(destinations.imageurl))),
            ),
            Expanded(
              child: Container(
                width: 138,
                height: 53,
                margin: EdgeInsets.only(left: 16),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      destinations.name,
                      style: blackTextStyle.copyWith(
                          fontSize: 18, fontWeight: medium),
                    ),
                    Text(
                      destinations.city,
                      style: greyTextStyle.copyWith(fontWeight: light),
                    )
                  ],
                ),
              ),
            ),
            Container(
              width: 46,
              height: 24,
              child: Row(
                children: [
                  Container(
                    width: 24,
                    height: 24,
                    decoration: BoxDecoration(
                        image: DecorationImage(
                            image: AssetImage('assets/images/Star.png'))),
                  ),
                  Text(
                    destinations.rating.toString(),
                    style: blackTextStyle.copyWith(fontWeight: medium),
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
