import 'package:flutter/material.dart';
import '../../../../shared/theme.dart';
import '../controller/homepage_controller.dart';

class HomePageHeader extends StatelessWidget {
  const HomePageHeader({Key? key, required this.controller}) : super(key: key);

  final HomePageController controller;

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.topLeft,
      child: Container(
        margin: EdgeInsets.only(top: 30, left: 25),
        width: double.infinity,
        child: Row(
          children: [
            Container(
              margin: EdgeInsets.only(right: 20),
              width: 46,
              height: 46,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(30),
                color: whiteColor,
                image: DecorationImage(image: AssetImage("assets/images/dummy_pp.png"))
              ),
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  controller.user!.name,
                  style: whiteTextStyle.copyWith(
                      fontWeight: semiBold, fontSize: 18),
                ),
                Text(
                  "Surabaya, East Java",
                  style: whiteTextStyle.copyWith(
                      fontSize: 13, color: whiteColor.withOpacity(0.4)),
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}
