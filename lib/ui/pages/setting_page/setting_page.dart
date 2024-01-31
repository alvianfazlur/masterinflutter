import 'package:bwa_masteringflutter/ui/pages/setting_page/setting_page_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../shared/theme.dart';

class SettingPage extends GetView<SettingPageController> {
  const SettingPage({Key? key}) : super(key: key);
  static const routeName = "/setting";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(child: Container(
        margin: EdgeInsets.only(top: 50),
        width: 220,
        height: 55,
        child: TextButton(
          style: TextButton.styleFrom(
              backgroundColor: primaryColor,
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(17))),
          onPressed: () {
            controller.signOut();
          },
          child: Text(
            'Peace Out',
            style: whiteTextStyle.copyWith(
                fontWeight: medium, fontSize: 18),
          ),
        ),
      )),
    );
  }
}
