import 'package:bwa_masteringflutter/shared/theme.dart';
import 'package:bwa_masteringflutter/ui/pages/main_page/widgets/header.dart';
import 'package:bwa_masteringflutter/ui/pages/main_page/widgets/new_destination.dart';
import 'package:bwa_masteringflutter/ui/pages/main_page/widgets/popular_destination.dart';
import 'package:bwa_masteringflutter/ui/pages/main_page/widgets/search_bar.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'destination_controller/homepage_controller.dart';

class HomePage extends GetView<HomePageController> {
  HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {

    return SafeArea(
        child: ListView(
          padding: EdgeInsets.only(left: defaultMargin, top: 10, right: 24),
          children: [
            HomePageHeader(name: controller.user!.name,),
            SearchBarWidget(),
            PopularDestination(destinations: controller.displayDestinations),
            controller.displayDestinations.isNotEmpty ?
            Text(
              "New This Year",
              style:
                  blackTextStyle.copyWith(fontSize: 18, fontWeight: semiBold),
            ) : Center(child: Text("Kata Kunci Tidak Ditemukan", style: blackTextStyle.copyWith(fontSize: 24),)),
            NewDestinationCard(destinations: controller.displayDestinations)
          ],
        ),
    );
  }
}
