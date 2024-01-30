import 'package:flutter/material.dart';

import '../../shared/theme.dart';

class BookingItem extends StatelessWidget {
  const BookingItem({Key? key, required this.title, required this.text, required this.valueColor}) : super(key: key);

  final String title;
  final String text;
  final Color valueColor;
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(bottom: 16),
      child: Row(
        children: [
          Expanded(
            child: Row(
              children: [
                Container(
                  width: 16,
                  height: 16,
                  margin: EdgeInsets.only(right: 6),
                  decoration: BoxDecoration(
                      image: DecorationImage(image: AssetImage('assets/images/fi_check.png'))
                  ),
                ),
                Text(title, style: blackTextStyle,),
              ],
            ),
          ),
          Text(text, style: blackTextStyle.copyWith(fontWeight: semiBold, color: valueColor),)
        ],
      ),
    );
  }
}
