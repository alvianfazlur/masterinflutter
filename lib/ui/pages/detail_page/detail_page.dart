import 'package:bwa_masteringflutter/shared/theme.dart';
import 'package:bwa_masteringflutter/ui/widgets/detail_photos.dart';
import 'package:bwa_masteringflutter/ui/widgets/interests_item.dart';
import 'package:flutter/material.dart';

class DetailPage extends StatelessWidget {
  const DetailPage({Key? key}) : super(key: key);
  static const routeName = "/detail";

  @override
  Widget build(BuildContext context) {
    Widget BackgroundImage() {
      return Container(
        height: 450,
        width: double.infinity,
        decoration: BoxDecoration(
            image: DecorationImage(
                fit: BoxFit.cover,
                image: AssetImage('assets/images/destination_image_1.png'))),
      );
    }

    Widget content() {
      return Container(
        margin: EdgeInsets.only(
            left: defaultMargin, top: 286, right: defaultMargin),
        width: double.infinity,
        child: Column(
          children: [
            Row(
              children: [
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Lake Ciliwung",
                        style: whiteTextStyle.copyWith(
                            fontSize: 24, fontWeight: semiBold),
                      ),
                      Text(
                        "Tangerang",
                        style: whiteTextStyle.copyWith(
                            fontSize: 16, fontWeight: light),
                      )
                    ],
                  ),
                ),
                Container(
                  width: 24,
                  height: 24,
                  decoration: BoxDecoration(
                      image: DecorationImage(
                          image: AssetImage('assets/images/Star.png'))),
                ),
                Text(
                  "4,8",
                  style: whiteTextStyle.copyWith(fontWeight: medium),
                )
              ],
            ),
            Container(
              width: double.infinity,
              margin: EdgeInsets.only(top: 30),
              padding: EdgeInsets.symmetric(vertical: 30, horizontal: 20),
              decoration: BoxDecoration(
                  color: whiteColor, borderRadius: BorderRadius.circular(18)),
              child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "About",
                      style: blackTextStyle.copyWith(
                          fontSize: 16, fontWeight: semiBold),
                    ),
                    SizedBox(
                      height: 6,
                    ),
                    Text(
                      "Berada di jalur jalan provinsi yang menghubungkan Denpasar Singaraja serta letaknya yang dekat dengan Kebun Raya Eka Karya menjadikan tempat Bali.",
                      style: blackTextStyle.copyWith(
                          fontWeight: regular, height: 1.5),
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    Text(
                      "Photos",
                      style: blackTextStyle.copyWith(
                          fontSize: 16, fontWeight: semiBold),
                    ),
                    SizedBox(
                      height: 6,
                    ),
                    Row(
                      children: [
                        Photos(
                          url: 'assets/images/ciliwung1.png',
                        ),
                        Photos(
                          url: 'assets/images/ciliwung2.png',
                        ),
                        Photos(
                          url: 'assets/images/ciliwung3.png',
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    Text(
                      "Interests",
                      style: blackTextStyle.copyWith(
                          fontWeight: semiBold, fontSize: 16),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Row(
                      children: [
                        InterestItem(Interest: 'Kids Park',),
                        InterestItem(Interest: 'Honor Bridge',),
                      ],
                    ),
                    SizedBox(height: 10,),
                    Row(
                      children: [
                        InterestItem(Interest: 'City Museum',),
                        InterestItem(Interest: 'Central Mall',)
                      ],
                    )
                  ]),
            ),
          ],
        ),
      );
    }

    return Scaffold(
      backgroundColor: backgroundColor,
      body: Stack(
        children: [
          BackgroundImage(),
          content(),
        ],
      ),
    );
  }
}
