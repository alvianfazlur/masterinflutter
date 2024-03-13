import 'package:flutter/material.dart';

import '../../../../shared/theme.dart';

class TextFieldWidget extends StatelessWidget {
  const TextFieldWidget({Key? key, required this.title, required this.controller, required this.imageAsset, required this.hintText}) : super(key: key);

  final String title;
  final TextEditingController controller;
  final String imageAsset;
  final String hintText;
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(title, style: blackTextStyle.copyWith(fontWeight: medium, fontSize: 16),),
          SizedBox(
            height: 12,
          ),
          Container(
            padding: EdgeInsets.only(left: 17),
            width: double.infinity,
            height: 50,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                color: greyInputColor
            ),
            child: TextFormField(
              controller: controller,
              decoration: InputDecoration(
                icon: Image.asset(
                  imageAsset,
                  width: 16,
                  height: 18,
                ),
                hintText: hintText,
                hintStyle: greyTextStyle.copyWith(fontWeight: light, color: greyHintTextColor, fontSize: 14),
                border: InputBorder.none,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
