import 'package:bwa_masteringflutter/services/user_service.dart';
import 'package:bwa_masteringflutter/ui/pages/setting_page/setting_page_controller.dart';
import 'package:bwa_masteringflutter/ui/pages/setting_page/widget/input_section.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../shared/theme.dart';

class SettingAccount extends StatelessWidget {
  const SettingAccount({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<SettingPageController>(
      builder: (SettingPageController controller) => SafeArea(
        child: ListView(
          children: [
            Container(
              margin: EdgeInsets.only(right: 20, left: 20),
              width: double.infinity,
              child: Column(
                children: [
                  Align(
                    alignment: Alignment.topCenter,
                    child: Container(
                      alignment: Alignment.center,
                      margin: EdgeInsets.only(top: 10),
                      width: 100,
                      height: 30,
                      decoration: BoxDecoration(
                          border: Border.all(
                              color: CupertinoColors.activeBlue, width: 2),
                          borderRadius: BorderRadius.circular(10),
                          color: Colors.lightBlue),
                      child: Text(
                        "Personal",
                        style: whiteTextStyle.copyWith(
                            fontSize: 12, fontWeight: medium),
                      ),
                    ),
                  ),
                  Container(
                    padding: EdgeInsets.all(20),
                    width: double.infinity,
                    margin: EdgeInsets.only(top: 100),
                    decoration: BoxDecoration(
                        border: Border.all(color: blackColor.withOpacity(0.2)),
                        borderRadius: BorderRadius.circular(10),
                        color: whiteColor),
                    child: Column(
                      children: [
                        InputSection(
                          textController: controller.name,
                          title: "Nama Pengguna",
                          hintText: "Masukkan nama",
                          style: blackTextStyle,
                        ),
                        InputSection(
                          textController: controller.id,
                          title: "ID Pengguna",
                          hintText: "",
                          readOnly: true,
                          style: greyTextStyle,
                        ),
                        InputSection(
                          textController: controller.hobby,
                          title: "Hobby",
                          hintText: "Masukkan Hobby",
                          style: blackTextStyle,
                        ),
                        Container(
                          margin: EdgeInsets.only(top: 50),
                          width: double.infinity,
                          height: 40,
                          child: TextButton(
                            style: TextButton.styleFrom(
                                backgroundColor: greenColor,
                                shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(10))),
                            onPressed: () {
                              if(controller.name.text.isEmpty || controller.hobby.text.isEmpty){
                                Get.snackbar(
                                  'Nama / Hobby Kosong',
                                  'Silahkan Mengisi Nama / Hobby Kamu Terlebih Dahulu',
                                  backgroundColor: Colors.red,
                                  colorText: Colors.white,
                                  snackPosition: SnackPosition.TOP,
                                  duration: const Duration(seconds: 3),
                                );
                              }
                              else if (controller.name.text !=
                                      controller.user!.name ||
                                  controller.hobby.text !=
                                          controller.user!.hobby) {
                                Get.dialog(
                                  AlertDialog(
                                    backgroundColor: Colors.white,
                                    title: Text(
                                      "Update Your Current Data?",
                                      style: blackTextStyle.copyWith(
                                          fontWeight: extraBold),
                                    ),
                                    content: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      mainAxisSize: MainAxisSize.min,
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
                                        onPressed: () async {
                                          await userService().updateUser(
                                              controller.id.text,
                                              controller.name.text,
                                              controller.hobby.text);
                                          Get.back();
                                          Get.snackbar(
                                            'Restart Application!',
                                            'Silahkan Restart Aplikasi untuk Melihat Perubahan',
                                            backgroundColor: Colors.green,
                                            colorText: Colors.white,
                                            snackPosition: SnackPosition.TOP,
                                            duration:
                                                const Duration(seconds: 3),
                                          );
                                        },
                                        child: Text(
                                          'Update',
                                          style: redTextStyle,
                                        ),
                                      ),
                                    ],
                                  ),
                                );
                              } else {
                                Get.snackbar(
                                  'Tidak Ada Perubahan Data',
                                  'Ubah Data Terlebih Dahulu',
                                  backgroundColor: Colors.red,
                                  colorText: Colors.white,
                                  snackPosition: SnackPosition.TOP,
                                  duration: const Duration(seconds: 3),
                                );
                              }
                            },
                            child: Text(
                              'Update Account',
                              style: whiteTextStyle.copyWith(
                                  fontWeight: medium, fontSize: 18),
                            ),
                          ),
                        )
                      ],
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.only(top: 50),
                    width: double.infinity,
                    height: 40,
                    child: TextButton(
                      style: TextButton.styleFrom(
                          backgroundColor: Colors.red,
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10))),
                      onPressed: () {
                        Get.dialog(
                          AlertDialog(
                            backgroundColor: Colors.white,
                            title: Text(
                              "Ready to Logout?",
                              style: blackTextStyle.copyWith(
                                  fontWeight: extraBold),
                            ),
                            content: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
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
                                onPressed: () {
                                  controller.signOut();
                                },
                                child: Text(
                                  'Sign Out',
                                  style: redTextStyle,
                                ),
                              ),
                            ],
                          ),
                        );
                      },
                      child: Text(
                        'Peace Out',
                        style: whiteTextStyle.copyWith(
                            fontWeight: medium, fontSize: 18),
                      ),
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
