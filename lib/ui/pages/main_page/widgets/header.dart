import 'package:bwa_masteringflutter/ui/pages/bonus_page/bonus_controller.dart';
import 'package:flutter/material.dart';

import '../../../../shared/theme.dart';

class HomePageHeader extends StatelessWidget {
  const HomePageHeader({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.topLeft,
      child: Container(
        margin: EdgeInsets.only(bottom: 30),
        width: 187,
        height: 33,
        decoration: BoxDecoration(
          image: DecorationImage(image: AssetImage("assets/images/punggawa_travel_icon.png"))
        ),
      ),
    );
  }
}
