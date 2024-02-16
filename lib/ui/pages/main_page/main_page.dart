import 'package:bwa_masteringflutter/shared/theme.dart';
import 'package:bwa_masteringflutter/ui/pages/main_page/home_page.dart';
import 'package:bwa_masteringflutter/ui/widgets/bottom_navbar.dart';
import 'package:flutter/material.dart';

class MainPage extends StatelessWidget {
  static const routeName = "/main";

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      backgroundColor: backgroundColor,
      body: Stack(
        children: [
          HomePage(),
          BottomNavbar(isSelectedHome: true,),
        ],
      ),
    );
  }
}
