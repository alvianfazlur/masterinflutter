import 'package:bwa_masteringflutter/models/user.dart';
import 'package:flutter/material.dart';
import '../../../../shared/theme.dart';

class HomePageHeader extends StatelessWidget {
  const HomePageHeader({Key? key, required this.user}) : super(key: key);

  final userData? user;

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
                  user!.name,
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
