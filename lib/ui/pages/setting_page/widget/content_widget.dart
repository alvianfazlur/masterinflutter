import 'package:bwa_masteringflutter/shared/theme.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ContentWidget extends StatelessWidget {
  const ContentWidget({Key? key, required this.title, required this.onTap}) : super(key: key);

  final String title;
  final VoidCallback onTap;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        margin: EdgeInsets.only(top: 20),
        child: Row(
          children: [
            Expanded(child: Text(title, style: greyTextStyle.copyWith(),)),
            Container(
              width: 10,
              height: 10,
              decoration: BoxDecoration(
                image: DecorationImage(image: AssetImage("assets/images/arrow.png"))
              ),
            )
          ],
        ),
      ),
    );
  }
}
