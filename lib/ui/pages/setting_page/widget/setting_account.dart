import 'package:bwa_masteringflutter/services/user_service.dart';
import 'package:bwa_masteringflutter/ui/pages/main_page/controller/homepage_controller.dart';
import 'package:bwa_masteringflutter/ui/pages/main_page/widgets/header.dart';
import 'package:bwa_masteringflutter/ui/pages/setting_page/setting_page_controller.dart';
import 'package:bwa_masteringflutter/ui/pages/setting_page/widget/content_widget.dart';
import 'package:bwa_masteringflutter/ui/pages/setting_page/widget/input_section.dart';
import 'package:bwa_masteringflutter/ui/pages/transaction_page/trannsaction_page.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../shared/theme.dart';

class SettingAccount extends StatelessWidget {
  const SettingAccount({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var homeController = Get.find<HomePageController>();
    return GetBuilder<SettingPageController>(
      builder: (SettingPageController controller) => SafeArea(
        child: ListView(
          physics: ScrollPhysics(),
          children: [
            Container(
              width: double.infinity,
              child: Column(
                children: [
                  HomePageHeader(controller: homeController),
                  Container(
                    padding: EdgeInsets.all(30),
                    margin: EdgeInsets.only(top: 30),
                    width: double.infinity,
                    height: MediaQuery.sizeOf(context).height - 200,
                    decoration: BoxDecoration(
                        color: whiteColor,
                        borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(20),
                            topRight: Radius.circular(20))),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "Account",
                          style: blackTextStyle.copyWith(
                              fontSize: 16, fontWeight: semiBold),
                        ),
                        ContentWidget(
                            title: "Edit Profile",
                            onTap: () {
                              print("object");
                            }),
                        ContentWidget(
                            title: "Your Orders",
                            onTap: () {
                              Get.toNamed(TransactionPage.routeName);
                            }),
                        ContentWidget(
                            title: "Help",
                            onTap: () {
                              print("help");
                            }),
                        SizedBox(
                          height: 30,
                        ),
                        Text(
                          "General",
                          style: blackTextStyle.copyWith(
                              fontSize: 16, fontWeight: semiBold),
                        ),
                        ContentWidget(
                            title: "Privacy & Policy",
                            onTap: () {
                              print("help");
                            }),
                        ContentWidget(
                            title: "Terms of Service",
                            onTap: () {
                              print("help");
                            }),
                        ContentWidget(
                            title: "Sign Out",
                            onTap: () {
                                Get.dialog(
                                  AlertDialog(
                                    backgroundColor: Colors.white,
                                    title: Text(
                                      "Ready to Logout?",
                                      style: blackTextStyle.copyWith(
                                          fontWeight: extraBold),
                                    ),
                                    content: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      mainAxisSize: MainAxisSize.min,
                                      children: [
                                        Text(
                                          "We'll Miss You 👋",
                                          style: blackTextStyle,
                                        ),
                                      ],
                                    ),
                                    actions: [
                                      TextButton(
                                        onPressed: () {
                                          Get.back();
                                        },
                                        child: Text(
                                          'Close',
                                          style: blackTextStyle,
                                        ),
                                      ),
                                      TextButton(
                                        onPressed: () async{
                                          await controller.signOut();
                                        },
                                        child: Text(
                                          'Sign Out',
                                          style: redTextStyle,
                                        ),
                                      ),
                                    ],
                                  ),
                                );
                            }),
                      ],
                    ),
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
