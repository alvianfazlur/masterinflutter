import 'package:bwa_masteringflutter/services/auth_service.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_state_manager/src/simple/get_state.dart';

import '../../../../shared/theme.dart';
import '../../main_page/main_page.dart';
import '../login_controller.dart';

class LoginForm extends StatelessWidget {
  const LoginForm({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<LoginController>(
      builder: (controller) =>
          Container(
            margin: EdgeInsets.only(top: 30),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text("Email Address", style: blackTextStyle.copyWith(fontWeight: medium, fontSize: 16),),
                SizedBox(
                  height: 12,
                ),
                Container(
                  padding: EdgeInsets.only(left: 17),
                  width: double.infinity,
                  height: 50,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: whiteColor
                  ),
                  child: TextFormField(
                    controller: controller.emailController,
                    decoration: InputDecoration(
                      icon: Image.asset(
                        'assets/images/email_icon.png',
                      ),
                      hintText: "Your Email Address",
                      hintStyle: greyTextStyle.copyWith(fontWeight: light, color: greyHintTextColor, fontSize: 14),
                      border: InputBorder.none,
                    ),
                  ),
                ),
                SizedBox(height: 20,),
                Text("Password", style: blackTextStyle.copyWith(fontWeight: medium, fontSize: 16),),
                SizedBox(
                  height: 12,
                ),
                Container(
                  padding: EdgeInsets.only(left: 17),
                  width: double.infinity,
                  height: 50,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: whiteColor
                  ),
                  child: TextFormField(
                    obscureText: true,
                    controller: controller.passwordController,
                    decoration: InputDecoration(
                      icon: Image.asset(
                        'assets/images/password_Icon.png',
                        width: 17,
                        height: 18,
                      ),
                      hintText: "Your Password",
                      hintStyle: greyTextStyle.copyWith(fontWeight: light, color: greyHintTextColor, fontSize: 14),
                      border: InputBorder.none,
                    ),
                  ),
                ),
                Column(
                  children: [
                    Container(
                      margin: EdgeInsets.only(top: 30),
                      width: double.infinity,
                      height: 50,
                      child: TextButton(
                        style: TextButton.styleFrom(
                            backgroundColor: primaryColor,
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(12))),
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
                          'Sign In',
                          style: whiteTextStyle.copyWith(
                              fontWeight: medium, fontSize: 16),
                        ),
                      ),
                    ),
                    SizedBox(height: 10,),
                    Text("Or", style: blackTextStyle.copyWith(fontWeight: medium, fontSize: 16),),
                    SizedBox(height: 10,),
                    GestureDetector(
                      onTap: () async{
                        await controller.signInWithGoogle();
                        if (controller.status == AuthStatus.success) {
                          Get.offNamedUntil(
                              MainPage.routeName, (route) => false,
                              arguments: controller.user);
                        }
                      },
                      child: Container(
                        width: double.infinity,
                        height: 50,
                        decoration: BoxDecoration(
                          border: Border.all(color: greyColor.withOpacity(0.3), width: 2), 
                          borderRadius: BorderRadius.circular(12)
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Container(
                              margin: EdgeInsets.only(right: 15),
                              width: 25,
                              height: 25,
                              decoration: BoxDecoration(
                                image: DecorationImage(image: AssetImage("assets/images/google_icon.png"))
                              ),
                            ),
                            Text("Continue With Google", style: blackTextStyle.copyWith(fontSize: 16, fontWeight: medium),)
                          ],
                        ),
                      ),
                    )
                  ],
                ),
              ],
            ),
          ),
    );
  }
}
