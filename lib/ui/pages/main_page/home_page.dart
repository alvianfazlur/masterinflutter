import 'package:bwa_masteringflutter/destination_controller/destination_controller.dart';
import 'package:bwa_masteringflutter/shared/theme.dart';
import 'package:bwa_masteringflutter/ui/pages/bonus_page/bonus_controller.dart';
import 'package:bwa_masteringflutter/ui/pages/main_page/widgets/header.dart';
import 'package:bwa_masteringflutter/ui/pages/main_page/widgets/new_destination.dart';
import 'package:bwa_masteringflutter/ui/pages/main_page/widgets/popular_destination.dart';
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

    return GetBuilder<DestinationController>(
      builder: (controller) => SafeArea(
        child: ListView(
          padding: EdgeInsets.only(left: defaultMargin, top: 30, right: 24),
          children: [
            HomePageHeader(userController: userController),
            PopularDestination(destinations: controller.destinations),
            Text(
              "New This Year",
              style:
                  blackTextStyle.copyWith(fontSize: 18, fontWeight: semiBold),
            ),
            NewDestinationCard(destinations: controller.destinations)
          ],
        ),
      ),
    );
  }
}
