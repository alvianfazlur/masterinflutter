import 'package:flutter/material.dart';

class InterestItem extends StatelessWidget {
  const InterestItem({Key? key, required this.Interest}) : super(key: key);

  final String Interest;
  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Row(
        children: [
          Container(
            margin: EdgeInsets.only(right: 6),
            width: 16,
            height: 16,
            decoration: BoxDecoration(
                image: DecorationImage(
                    fit: BoxFit.cover,
                    image:
                    AssetImage("assets/images/fi_check.png"))),
          ),
          Text(Interest)
        ],
      ),
    );
  }
}
