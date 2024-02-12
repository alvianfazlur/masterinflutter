import 'package:bwa_masteringflutter/destination_controller/destination_controller.dart';
import 'package:bwa_masteringflutter/shared/theme.dart';
import 'package:bwa_masteringflutter/ui/pages/bonus_page/bonus_controller.dart';
import 'package:bwa_masteringflutter/ui/widgets/destination_card.dart';
import 'package:bwa_masteringflutter/ui/widgets/new_destination.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../models/destination.dart';

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

    Widget popularDestination(List<DestinationModel> destinations) {
      return Container(
        margin: EdgeInsets.only(top: 30, bottom: 20),
        child: SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: Row(
            children: destinations.map((DestinationModel destination) {
              return DestinationCard(destination);
            }).toList(),
          ),
        ),
      );
    }

    Widget newDestination(List<DestinationModel> destinations) {
      return Container(
        margin: EdgeInsets.only(bottom: 120),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children:
           destinations.map((DestinationModel destination) {
             return NewDestination(destination);
           }).toList(),
        ),
      );
    }

    return GetBuilder<DestinationController>(
      builder: (controller) => SafeArea(
        child: ListView(
          padding: EdgeInsets.only(left: defaultMargin, top: 30, right: 24),
          children: [
            Header(),
            popularDestination(controller.destinations),
            Text(
              "New This Year",
              style:
                  blackTextStyle.copyWith(fontSize: 18, fontWeight: semiBold),
            ),
            newDestination(controller.destinations)
          ],
        ),
      ),
    );
  }
}
