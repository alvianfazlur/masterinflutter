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
      resizeToAvoidBottomInset: false,
      backgroundColor: backgroundColor,
      body: SafeArea(
          child: Stack(
        children: [
          ListView(
            padding: EdgeInsets.symmetric(horizontal: 30),
            children: [
              Container(
                margin: EdgeInsets.only(top: 30),
                child: Text(
                  "Sign Up",
                  style: blackTextStyle.copyWith(
                      fontWeight: semiBold, fontSize: 24),
                ),
              ),
              Container(
                margin: EdgeInsets.only(top: 5),
                child: Text(
                  "Join us and get your next journey",
                  style: greyTextStyle.copyWith(fontWeight: regular),
                ),
              ),
              InputSection(),
            ],
          ),
          Align(
              alignment: Alignment.bottomCenter,
              child: Container(
                  margin: EdgeInsets.only(bottom: 30),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text("Already have an account?", style: blackTextStyle.copyWith(fontSize: 12),),
                      GestureDetector(
                        onTap: (){
                          Get.offNamed(LoginPage.routeName);
                        },
                        child: Container(
                          child: Text(" Sign In", style: purpleTextStyle.copyWith(fontSize: 12),),
                        ),
                      )
                    ],
                  ))
          )
        ],

      )
      ),
    );
  }
}
