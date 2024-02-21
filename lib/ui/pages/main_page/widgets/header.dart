import 'package:bwa_masteringflutter/ui/pages/bonus_page/bonus_controller.dart';
import 'package:flutter/material.dart';

import '../../../../shared/theme.dart';

class HomePageHeader extends StatelessWidget {
  const HomePageHeader({Key? key, required this.userController}) : super(key: key);

  final BonusPageController userController;
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "Howdy,\n${userController.user!.name.toUpperCase()}",
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
}
