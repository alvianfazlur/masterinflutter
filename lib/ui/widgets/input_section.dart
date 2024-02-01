import 'package:bwa_masteringflutter/shared/theme.dart';
import 'package:bwa_masteringflutter/ui/pages/bonus_page/bonus_page.dart';
import 'package:bwa_masteringflutter/ui/pages/sign_up/sign_up_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class InputSection extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return GetBuilder<SignUpController>(
      builder: (controller) => Container(
        margin: EdgeInsets.only(top: 30),
        padding: EdgeInsets.symmetric(horizontal: 20),
        child: Column(
          children: [
            Container(
              margin: EdgeInsets.only(bottom: 20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text("Full Name"),
                  SizedBox(
                    height: 6,
                  ),
                  TextFormField(
                    controller: controller.nameController,
                    decoration: InputDecoration(
                        hintText: "Masukkan Nama Lengkap",
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(defaultRadius)),
                        focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(defaultRadius),
                            borderSide: BorderSide(color: primaryColor))),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Text("Email Address"),
                  SizedBox(
                    height: 6,
                  ),
                  TextFormField(
                    controller: controller.emailController,
                    decoration: InputDecoration(
                        hintText: "Masukkan Email",
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(defaultRadius)),
                        focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(defaultRadius),
                            borderSide: BorderSide(color: primaryColor))),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Text("Password"),
                  SizedBox(
                    height: 6,
                  ),
                  TextFormField(
                    controller: controller.passwordController,
                    obscureText: true,
                    decoration: InputDecoration(
                        hintText: "Masukkan Password",
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(defaultRadius)),
                        focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(defaultRadius),
                            borderSide: BorderSide(color: primaryColor))),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Text("Hobby"),
                  SizedBox(
                    height: 6,
                  ),
                  TextFormField(
                    controller: controller.hobbyController,
                    decoration: InputDecoration(
                        hintText: "Hobby",
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(defaultRadius)),
                        focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(defaultRadius),
                            borderSide: BorderSide(color: primaryColor))),
                  ),
                  SizedBox(
                    height: 30,
                  ),
                  Container(
                    width: double.infinity,
                    height: 55,
                    child: TextButton(
                      style: TextButton.styleFrom(
                          backgroundColor: primaryColor,
                          shape: RoundedRectangleBorder(
                              borderRadius:
                                  BorderRadius.circular(defaultRadius))),
                      onPressed: () async {
                        await controller.signup(
                            email: controller.emailController.text,
                            password: controller.passwordController.text,
                            name: controller.nameController.text,
                            hobby: controller.hobbyController.text);
                        if (controller.status == AuthStatus.loading) {
                          print("Loading");
                        } else if (controller.status == AuthStatus.success) {
                          print("Success");
                          Get.offNamed(BonusPage.routeName);
                        } else if (controller.status == AuthStatus.failed) {
                          print("Failed");
                          ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                              content:
                                  Text(controller.error ?? 'Unknown error')));
                        }
                      },
                      child: Text(
                        'Get Started',
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
