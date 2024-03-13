import 'package:bwa_masteringflutter/shared/theme.dart';
import 'package:bwa_masteringflutter/ui/pages/main_page/widgets/filter_item.dart';
import 'package:bwa_masteringflutter/ui/pages/main_page/widgets/header.dart';
import 'package:bwa_masteringflutter/ui/pages/main_page/widgets/new_destination.dart';
import 'package:bwa_masteringflutter/ui/pages/main_page/widgets/popular_destination.dart';
import 'package:bwa_masteringflutter/ui/pages/main_page/widgets/search_bar.dart';
import 'package:bwa_masteringflutter/ui/pages/main_page/widgets/user_card.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'destination_controller/homepage_controller.dart';

class HomePage extends GetView<HomePageController> {
  HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {

    return SafeArea(
        child: ListView(
          padding: EdgeInsets.only(left: 30, top: 10, right: 30),
          children: [
            HomePageHeader(),
            SearchBarWidget(),
            SizedBox(height: 30,),
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                children: [
                  FilterItem(controller: controller, category: "Town",),
                  FilterItem(controller: controller, category: "Nature",),
                  FilterItem(controller: controller, category: "Historic",),
                  FilterItem(controller: controller, category: "Mountain",),
                  FilterItem(controller: controller, category: "Beach",),
                ],
              ),
            ),
            UserCard(controller: controller,),
            SizedBox(height: 20,),
            Text(controller.displayDestinations.isNotEmpty ? "Popular Tour" : "", style: blackTextStyle.copyWith(fontWeight: semiBold, fontSize: 22),),
            SizedBox(height: 14,),
            PopularDestination(destinations: controller.displayDestinations),
            controller.displayDestinations.isNotEmpty ?
            Text(
              "New Arrivals",
              style:
                  blackTextStyle.copyWith(fontSize: 22, fontWeight: semiBold),
            ) : Center(child: Text("Kata Kunci Tidak Ditemukan", style: blackTextStyle.copyWith(fontSize: 24),)),
            NewDestinationCard(destinations: controller.displayDestinations)
          ],
        ),
    );
  }
}
