import 'package:bwa_masteringflutter/ui/pages/bonus_page/bonus_controller.dart';
import 'package:flutter/material.dart';

import '../../../../shared/theme.dart';

class HomePageHeader extends StatelessWidget {
  const HomePageHeader({Key? key, required this.name}) : super(key: key);

  final String name;
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "Howdy,\n${name.toUpperCase()}",
                style: blackTextStyle.copyWith(
                    fontSize: 24, fontWeight: semiBold),
                overflow: TextOverflow.ellipsis,
              ),
              const SizedBox(
                height: 6,
              ),
          SizedBox(height: 10,)
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
