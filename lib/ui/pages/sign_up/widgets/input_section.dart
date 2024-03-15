import 'package:bwa_masteringflutter/shared/theme.dart';
import 'package:bwa_masteringflutter/ui/pages/bonus_page/bonus_page.dart';
import 'package:bwa_masteringflutter/ui/pages/sign_up/sign_up_controller.dart';
import 'package:bwa_masteringflutter/ui/pages/sign_up/widgets/textfield_widgets.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../main_page/main_page.dart';

class InputSection extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GetBuilder<SignUpController>(
      builder: (controller) => Container(
        margin: EdgeInsets.only(top: 30),
        child: Column(
          children: [
            TextFieldWidget(
                title: "Full Name",
                controller: controller.nameController,
                imageAsset: "assets/images/username_icon.png",
                hintText: "Your Full Name"),
            SizedBox(height: 20,),
            TextFieldWidget(
                title: "Email Address",
                controller: controller.emailController,
                imageAsset: "assets/images/email_icon.png",
                hintText: "Your Email Address"),
            SizedBox(height: 20,),
            TextFieldWidget(
                title: "Password",
                controller: controller.passwordController,
                imageAsset: "assets/images/password_Icon.png",
                hintText: "Your Full Name"),
            SizedBox(height: 30,),
            Container(
              width: double.infinity,
              height: 50,
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
                  } else if (controller.status == AuthStatus.success) {
                    Get.offNamed(BonusPage.routeName, arguments: controller.user);
                  } else if (controller.status == AuthStatus.failed) {
                    ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                        content:
                        Text(controller.error ?? 'Unknown error')));
                  }
                },
                child: Text(
                  'Sign Up',
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
      ),
    );
  }
}
