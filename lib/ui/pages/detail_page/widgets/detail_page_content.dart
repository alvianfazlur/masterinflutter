import 'package:bwa_masteringflutter/ui/pages/checkout_page/checkout_page.dart';
import 'package:bwa_masteringflutter/ui/pages/detail_page/detail_page_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:intl/intl.dart';

import '../../../../shared/theme.dart';
import '../../../widgets/detail_photos.dart';
import '../../../widgets/interests_item.dart';
import '../../choose_seat_page/seat_page.dart';

class DetailPageContent extends StatelessWidget {
  const DetailPageContent({Key? key, required this.controller}) : super(key: key);

  final DetailPageController controller;
  @override
  Widget build(BuildContext context) {
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
                      controller.destination.name,
                      style: whiteTextStyle.copyWith(
                          fontSize: 24, fontWeight: semiBold),
                    ),
                    Text(
                      controller.destination.city,
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
                controller.destination.rating.toString(),
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
          Container(
            margin: EdgeInsets.symmetric(vertical: 30),
            width: double.infinity,
            child: Row(
              children: [
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        NumberFormat.currency(
                          locale: 'id',
                          symbol: 'IDR ',
                          decimalDigits: 0,
                        ).format(controller.destination.price), style: blackTextStyle.copyWith(fontWeight: medium, fontSize: 18),),
                      SizedBox(height: 5,),
                      Text("per orang", style: greyTextStyle.copyWith(fontWeight: light),)
                    ],
                  ),
                ),
                Container(
                  width: 170,
                  height: 55,
                  child: TextButton(
                    style: TextButton.styleFrom(
                        backgroundColor: primaryColor,
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(17))),
                    onPressed: () {
                      Get.toNamed(CheckoutPage.routeName, arguments: controller.destination);
                    },
                    child: Text(
                      'Book Now',
                      style: whiteTextStyle.copyWith(
                          fontWeight: medium, fontSize: 18),
                    ),
                  ),
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
