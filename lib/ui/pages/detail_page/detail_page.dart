import 'package:bwa_masteringflutter/shared/theme.dart';
import 'package:bwa_masteringflutter/ui/pages/detail_page/detail_page_controller.dart';
import 'package:bwa_masteringflutter/ui/pages/detail_page/widgets/background_image.dart';
import 'package:bwa_masteringflutter/ui/pages/detail_page/widgets/detail_page_content.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class DetailPage extends GetView<DetailPageController> {
  const DetailPage({Key? key}) : super(key: key);
  static const routeName = "/detail";

  @override
  Widget build(BuildContext context) {

    return GetBuilder<DetailPageController>(
      builder: (controller) => Scaffold(
        backgroundColor: backgroundColor,
        body: SingleChildScrollView(
          child: Stack(
            children: [
              BackgroundImage(controller: controller),
              DetailPageContent(controller: controller),
            ],
          ),
        ),
      ),
    );
  }
}
