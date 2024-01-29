import 'package:flutter/material.dart';

class Photos extends StatelessWidget {
  const Photos({Key? key, required this.url}) : super(key: key);

  final String url;
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(right: 16),
      height: 70,
      width: 70,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(18),
          image: DecorationImage(
              fit: BoxFit.cover,
              image:
              AssetImage(url)
          )
      ),
    );
  }
}
