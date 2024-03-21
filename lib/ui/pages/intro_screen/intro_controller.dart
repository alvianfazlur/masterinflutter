
import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';

import '../../../models/user.dart';
import '../login/login_page.dart';
import '../main_page/get_user.dart';
import '../main_page/main_page.dart';

class IntroController extends GetxController{
  final getUser = Get.put(GetUser());

  Future<void> findUser() async{
    User? user = FirebaseAuth.instance.currentUser;

    if (user == null) {
      Get.offNamedUntil(LoginPage.routeName, (route) => false);
    } else {
      getUser.getCurrentUser(user.uid).then((userData user) {
        Get.offNamedUntil(MainPage.routeName, (route) => false,
            arguments: user);
      });
    }
  }
}