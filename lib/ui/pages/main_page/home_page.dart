import 'package:bwa_masteringflutter/destination_controller/destination_controller.dart';
import 'package:bwa_masteringflutter/shared/theme.dart';
import 'package:bwa_masteringflutter/ui/pages/bonus_page/bonus_controller.dart';
import 'package:bwa_masteringflutter/ui/pages/main_page/get_user.dart';
import 'package:bwa_masteringflutter/ui/widgets/destination_card.dart';
import 'package:bwa_masteringflutter/ui/widgets/new_destination.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HomePage extends GetView<DestinationController> {
  HomePage({Key? key}) : super(key: key);
  var userController = Get.put(BonusPageController());

  @override
  Widget build(BuildContext context) {
    Widget Header() {
      return Row(
        children: [
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Howdy,\n${userController.user.name}",
                  style: blackTextStyle.copyWith(
                      fontSize: 24, fontWeight: semiBold),
                  overflow: TextOverflow.ellipsis,
                ),
                const SizedBox(
                  height: 6,
                ),
                Text(
                  "Where to fly today?",
                  style:
                      greyTextStyle.copyWith(fontSize: 16, fontWeight: light),
                )
              ],
            ),
          ),
          Container(
            width: 60,
            height: 60,
            decoration: const BoxDecoration(
                image: DecorationImage(
                    image: AssetImage('assets/images/pic_filled.png'))),
          ),
        ],
      );
    }
    Widget popularDestination() {
      return Container(
        margin: EdgeInsets.only(top: 30),
        child: const SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: Row(
            children: [
              DestinationCard(
                title: 'Lake Ciliwung',
                city: 'Tangerang',
                rating: 4.8,
                url: 'assets/images/destination_image_1.png',
              ),
              DestinationCard(
                title: 'White Houses',
                city: 'Spain',
                rating: 4.7,
                url: 'assets/images/destination_image_2.png',
              ),
              DestinationCard(
                title: 'Hill Heyo',
                city: 'Monaco',
                rating: 4.8,
                url: 'assets/images/destination_image_3.png',
              ),
              DestinationCard(
                title: 'Menarra',
                city: 'Japan',
                rating: 5.0,
                url: 'assets/images/destination_image_4.png',
              ),
              DestinationCard(
                title: 'Payung Teduh',
                city: 'Singapore',
                rating: 4.8,
                url: 'assets/images/destination_image_5.png',
              ),
            ],
          ),
        ),
      );
    }
    Widget newDestination() {
      return Container(
        margin: EdgeInsets.only(top: 30, bottom: 120),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "New This Year",
              style:
                  blackTextStyle.copyWith(fontSize: 18, fontWeight: semiBold),
            ),
            NewDestination(
              name: 'Danau Beratan',
              city: 'Singaraja',
              rating: 4.5,
              url: 'assets/images/beratan.png',
            ),
            NewDestination(
              name: 'Sydney Opera',
              city: 'Australia',
              rating: 4.7,
              url: 'assets/images/opera.png',
            ),
            NewDestination(
              name: 'Roma',
              city: 'Italy',
              rating: 4.8,
              url: 'assets/images/roma.png',
            ),
            NewDestination(
              name: 'Payung Teduh',
              city: 'Singapore',
              rating: 4.5,
              url: 'assets/images/payung.png',
            ),
            NewDestination(
              name: 'Hill Hey',
              city: 'Monaco',
              rating: 4.7,
              url: 'assets/images/hill.png',
            ),
          ],
        ),
      );
    }

    return SafeArea(
      child: ListView(
        padding: EdgeInsets.only(left: defaultMargin, top: 30, right: 24),
        children: [Header(), popularDestination(), newDestination()],
      ),
    );
  }
}
