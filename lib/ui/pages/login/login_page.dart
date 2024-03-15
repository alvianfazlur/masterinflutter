import 'package:bwa_masteringflutter/shared/theme.dart';
import 'package:bwa_masteringflutter/ui/pages/login/login_controller.dart';
import 'package:bwa_masteringflutter/ui/pages/login/widgets/login_form.dart';
import 'package:bwa_masteringflutter/ui/pages/sign_up/sign_up_screen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';

class LoginPage extends GetView<LoginController> {
  const LoginPage({Key? key}) : super(key: key);
  static const routeName = '/login';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: backgroundColor,
      body: Stack(
        children: [
          Container(
            width: double.infinity,
            margin: EdgeInsets.only(top: 60, left: 30, right: 30),
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(18)),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Login",
                  style: blackTextStyle.copyWith(
                      fontWeight: semiBold, fontSize: 24),
                ),
                SizedBox(
                  height: 5,
                ),
                Text(
                  "Book and Travel With your account",
                  style:
                      greyTextStyle.copyWith(fontSize: 14, fontWeight: regular),
                ),
                LoginForm(),
              ],
            ),
          ),
          Align(
            alignment: Alignment.bottomCenter,
              child: Container(
                margin: EdgeInsets.only(bottom: 30),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text("Don't have an account?", style: blackTextStyle.copyWith(fontSize: 12),),
                      GestureDetector(
                        onTap: (){
                          Get.offNamed(SignUpScreen.routeName);
                        },
                        child: Container(
                          child: Text(" Sign Up", style: purpleTextStyle.copyWith(fontSize: 12),),
                        ),
                      )
                    ],
                  ))
          )
        ],
      ),
    );
  }
}
