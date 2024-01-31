import 'package:bwa_masteringflutter/ui/pages/detail_page/detail_page.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../shared/theme.dart';

class DestinationCard extends StatelessWidget {
  const DestinationCard(
      {Key? key,
      required this.title,
      required this.city,
      required this.url,
      required this.rating})
      : super(key: key);

  final String title;
  final String city;
  final String url;
  final double rating;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: (){
        Get.toNamed(DetailPage.routeName);
      },
      child: Container(
        width: 200,
        height: 323,
        padding: EdgeInsets.all(10),
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(18), color: whiteColor),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              width: 180,
              height: 220,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(defaultRadius),
                  image: DecorationImage(
                      image:
                          AssetImage(url))),
              child: Align(
                alignment: Alignment.topRight,
                child: Container(
                  width: 55,
                  height: 30,
                  decoration: BoxDecoration(
                      color: whiteColor,
                      borderRadius:
                          BorderRadius.only(bottomLeft: Radius.circular(18))),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Container(
                          width: 20,
                          height: 24,
                          decoration: BoxDecoration(
                              image: DecorationImage(
                                  image: AssetImage('assets/images/Star.png')))),
                      Text(
                        rating.toString(),
                        style: blackTextStyle.copyWith(fontWeight: medium),
                      )
                    ],
                  ),
                ),
              ),
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
                    title,
                    style:
                        blackTextStyle.copyWith(fontWeight: medium, fontSize: 18),
                  ),
                  SizedBox(
                    height: 5,
                  ),
                  Text(
                    city,
                    style:
                        greyTextStyle.copyWith(fontSize: 14, fontWeight: light),
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
