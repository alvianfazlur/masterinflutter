import 'package:bwa_masteringflutter/shared/theme.dart';
import 'package:bwa_masteringflutter/ui/pages/login/login_controller.dart';
import 'package:bwa_masteringflutter/ui/pages/main_page/home_page.dart';
import 'package:bwa_masteringflutter/ui/pages/main_page/main_page.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../bonus_page/bonus_page.dart';

class LoginPage extends GetView<LoginController> {
  const LoginPage({Key? key}) : super(key: key);
  static const routeName = '/login';

  @override
  Widget build(BuildContext context) {
    Widget LoginForm() {
      return GetBuilder<LoginController>(
        builder: (controller) =>
            Container(
              margin: EdgeInsets.only(top: 10),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text("Email Address", style: blackTextStyle,),
                  SizedBox(
                    height: 6,
                  ),
                  TextFormField(
                    controller: controller.emailController,
                    decoration: InputDecoration(
                        hintText: "ex : xxxx@gmail.com",
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(defaultRadius)),
                        focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(defaultRadius),
                            borderSide: BorderSide(color: primaryColor))),
                  ),
                  SizedBox(height: 10,),
                  Text("Password", style: blackTextStyle,),
                  SizedBox(
                    height: 6,
                  ),
                  TextFormField(
                    controller: controller.passwordController,
                    obscureText: true,
                    decoration: InputDecoration(
                        hintText: "Your Password",
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(defaultRadius)),
                        focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(defaultRadius),
                            borderSide: BorderSide(color: primaryColor))),
                  ),
                  Container(
                    margin: EdgeInsets.only(top: 30),
                    width: double.infinity,
                    height: 55,
                    child: TextButton(
                      style: TextButton.styleFrom(
                          backgroundColor: primaryColor,
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(17))),
                      onPressed: () async {
                        await controller.signIn(
                            email: controller.emailController.text,
                            password: controller.passwordController.text);
                        if (controller.status == AuthStatus.loading) {
                        } else if (controller.status == AuthStatus.success) {
                          Get.offNamedUntil(MainPage.routeName, (route) => false,
                              arguments: controller.user);
                        } else if (controller.status == AuthStatus.failed) {
                          ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                              content:
                              Text(controller.error ?? 'Unknown error')));
                        }
                      },
                      child: Text(
                        'Login',
                        style: whiteTextStyle.copyWith(
                            fontWeight: medium, fontSize: 18),
                      ),
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.only(top: 10),
                    width: double.infinity,
                    height: 55,
                    child: TextButton(
                      style: TextButton.styleFrom(
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(17))),
                      onPressed: () {
                        Get.back();
                      },
                      child: Text(
                        "Don't have account? Sign Up",
                        style: greyTextStyle.copyWith(
                            fontWeight: light, fontSize: 16),
                      ),
                    ),
                  )
                ],
              ),
            ),
      );
    }

    return Scaffold(
        backgroundColor: backgroundColor,
        body: ListView(
          children: [
            Container(
              width: double.infinity,
              padding: EdgeInsets.only(
                  left: defaultMargin, top: 30, right: defaultMargin),
              margin: EdgeInsets.symmetric(horizontal: 30, vertical: 150),
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(18), color: whiteColor),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Book and Travel\nWith your account",
                    style:
                    blackTextStyle.copyWith(fontSize: 24, fontWeight: semiBold),
                  ),
                  LoginForm()
                ],
              ),
            ),
          ],
        ));
  }
}
