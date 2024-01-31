import 'package:flutter/material.dart';

import '../../shared/theme.dart';

class CustomBottomNavbar extends StatelessWidget {
  CustomBottomNavbar({Key? key, required this.image, this.isSelected = false, required this.onTap}) : super(key: key);

  final String image;
  final bool isSelected;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          SizedBox(),
          Container(
            width: 24,
            height: 24,
            decoration: BoxDecoration(
                image: DecorationImage(
                    image: AssetImage(image)
                )
            ),
          ),
          Container(
            width: 30,
            height: 2,
            decoration: BoxDecoration(
                color: isSelected ? primaryColor : Colors.transparent,
                borderRadius: BorderRadius.circular(defaultRadius)
            ),
          )
        ],
      ),
    );
  }
}
