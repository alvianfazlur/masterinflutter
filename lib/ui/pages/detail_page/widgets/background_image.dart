import 'package:bwa_masteringflutter/ui/pages/detail_page/detail_page_controller.dart';
import 'package:flutter/material.dart';

class BackgroundImage extends StatelessWidget {
  const BackgroundImage({Key? key, required this.controller}) : super(key: key);

  final DetailPageController controller;
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 450,
      width: double.infinity,
      decoration: BoxDecoration(
          image: DecorationImage(
              fit: BoxFit.cover,
              image: NetworkImage(controller.destination.imageurl))),
    );
  }
}
