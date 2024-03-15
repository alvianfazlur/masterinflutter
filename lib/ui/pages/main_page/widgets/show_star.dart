import 'package:flutter/material.dart';

class ShowStar extends StatelessWidget {
  const ShowStar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 15,
      height: 15,
      decoration: BoxDecoration(
          image: DecorationImage(image: AssetImage("assets/images/Star.png"))
      ),
    );
  }
}
