import 'package:bwa_masteringflutter/shared/theme.dart';
import 'package:bwa_masteringflutter/ui/pages/login/login_page.dart';
import 'package:bwa_masteringflutter/ui/pages/sign_up/sign_up_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'widgets/input_section.dart';

class SignUpScreen extends GetView<SignUpController> {
  static const routeName = "/signup";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: backgroundColor,
      body: SafeArea(
          child: ListView(
        padding: EdgeInsets.symmetric(horizontal: defaultMargin),
        children: [
          Container(
            child: Text(
              "Join us and get\nyour next journey",
              style:
                  blackTextStyle.copyWith(fontWeight: semiBold, fontSize: 24),
            ),
          ),
          InputSection(),
          Container(
            child: TextButton(
              style: TextButton.styleFrom(
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(17))),
              onPressed: () {
                Get.toNamed(LoginPage.routeName);
              },
              child: Text(
                'Have an Account? Sign In',
                style: greyTextStyle.copyWith(
                    fontWeight: light, fontSize: 16),
              ),
            ),
          ),
          TextButton(
            onPressed: () {
              Get.dialog(
                AlertDialog(
                  backgroundColor: Colors.white,
                  title: const Text("Terms and Conditions"),
                  content: const Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Text("Your terms and conditions here..."),
                    ],
                  ),
                  actions: [
                    TextButton(
                      onPressed: () {
                        Get.back();
                      },
                      child: const Text('Close'),
                    ),
                  ],
                ),
              );
            },
            child: Text(
              'Terms and Conditions',
              style: greyTextStyle.copyWith(fontWeight: light, fontSize: 16),
            ),
          ),
        ],
      )),
    );
  }
}
