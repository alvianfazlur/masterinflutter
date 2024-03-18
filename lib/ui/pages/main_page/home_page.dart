import 'package:bwa_masteringflutter/shared/theme.dart';
import 'package:bwa_masteringflutter/ui/pages/main_page/widgets/date_picker.dart';
import 'package:bwa_masteringflutter/ui/pages/main_page/widgets/filter_item.dart';
import 'package:bwa_masteringflutter/ui/pages/main_page/widgets/header.dart';
import 'package:bwa_masteringflutter/ui/pages/main_page/widgets/new_destination.dart';
import 'package:bwa_masteringflutter/ui/pages/main_page/widgets/popular_destination.dart';
import 'package:bwa_masteringflutter/ui/pages/main_page/widgets/search_bar.dart';
import 'package:bwa_masteringflutter/ui/pages/main_page/widgets/user_card.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'controller/homepage_controller.dart';

class HomePage extends GetView<HomePageController> {
  HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: ListView(
        padding: EdgeInsets.only(top: 10, bottom: 20),
        children: [
          HomePageHeader(
            controller: controller,
          ),
          SizedBox(
            height: 30,
          ),
          SingleChildScrollView(
            padding: EdgeInsets.only(left: 10),
            scrollDirection: Axis.horizontal,
            child: Row(
              children: [
                FilterItem(
                  controller: controller,
                  category: "Town",
                ),
                FilterItem(
                  controller: controller,
                  category: "Nature",
                ),
                FilterItem(
                  controller: controller,
                  category: "Historic",
                ),
                FilterItem(
                  controller: controller,
                  category: "Mountain",
                ),
                FilterItem(
                  controller: controller,
                  category: "Beach",
                ),
              ],
            ),
          ),
          SizedBox(
            height: 20,
          ),
          Container(
            padding: EdgeInsets.all(25),
              decoration: BoxDecoration(
                  color: whiteColor,
                  borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(20),
                      topRight: Radius.circular(20))),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Find a Tourist Destination",
                    style: blackTextStyle.copyWith(
                        fontWeight: bold, fontSize: 18),
                  ),
                  Container(
                    margin: EdgeInsets.only(top: 15),
                    padding: EdgeInsets.all(15),
                    width: double.infinity,
                    decoration: BoxDecoration(
                      border: Border.all(color: greyColor.withOpacity(0.2), width: 2),
                      borderRadius: BorderRadius.circular(15)
                    ),
                    child: Column(
                      children: [
                        SearchBarWidget(),
                        DatePickerBar(),
                        Container(
                          margin: EdgeInsets.only(top: 20),
                          width: double.infinity,
                          height: 50,
                          child: TextButton(
                            style: TextButton.styleFrom(
                                backgroundColor: primaryColor,
                                shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(10))),
                            onPressed: () {},
                            child: Text(
                              'Search',
                              style: whiteTextStyle.copyWith(
                                  fontWeight: medium, fontSize: 18),
                            ),
                          ),
                        )
                      ],
                    ),
                  ),
                  SizedBox(height: 25,),
                  Text("Available Place", style: blackTextStyle.copyWith(fontWeight: semiBold, fontSize: 18),),
                  NewDestinationCard(
                      destinations: controller.displayDestinations),
                ],
              )),
        ],
      ),
    );
  }
}
