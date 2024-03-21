import 'package:bwa_masteringflutter/shared/theme.dart';
import 'package:bwa_masteringflutter/ui/pages/intro_screen/intro_controller.dart';
import 'package:bwa_masteringflutter/ui/pages/intro_screen/list_pages.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:introduction_screen/introduction_screen.dart';

import '../main_page/get_user.dart';

class IntroScreen extends GetView<IntroController> {
  const IntroScreen({Key? key}) : super(key: key);
  static const routeName = '/intro';

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      body: IntroductionScreen(
        pages: listPageView,
        autoScrollDuration: 5000,
        showNextButton: false,
        showSkipButton: false,
        showDoneButton: false,
        infiniteAutoScroll: true,
        dotsDecorator: DotsDecorator(
          size: const Size.square(10.0),
          activeSize: const Size(20.0, 10.0),
          activeColor: Theme.of(context).colorScheme.primary,
          spacing: const EdgeInsets.symmetric(horizontal: 10.0),
          activeShape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(15.0),
          ),
        ),
        baseBtnStyle: TextButton.styleFrom(
          textStyle: purpleTextStyle
        ),
        globalFooter: Padding(
          padding: EdgeInsets.only(left: 40, right: 40, bottom: 30, top: 20),
          child: Container(
            height: 50,
            child: ElevatedButton(
                onPressed: () async {
                  await controller.findUser();
                },
                child: Center(
                  child: Text("Get Started", style: blackTextStyle.copyWith(fontSize: 16),),
                )),
          ),
        ),
      ),
    );
  }
}
