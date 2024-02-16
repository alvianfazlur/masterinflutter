import 'package:bwa_masteringflutter/ui/pages/setting_page/setting_page_controller.dart';
import 'package:bwa_masteringflutter/ui/pages/setting_page/widget/background.dart';
import 'package:bwa_masteringflutter/ui/pages/setting_page/widget/header_content.dart';
import 'package:bwa_masteringflutter/ui/widgets/bottom_navbar.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../shared/theme.dart';

class SettingPage extends GetView<SettingPageController> {
  const SettingPage({Key? key}) : super(key: key);
  static const routeName = "/setting";

  @override
  Widget build(BuildContext context) {
    return GetBuilder(
      builder: (SettingPageController controller) => Scaffold(
        body: Stack(
          children: [
            Background(),
            HeaderContent(controller: controller),
            BottomNavbar(isSelectedSetting: true),
          ],
        ),
      ),
    );
  }
}
