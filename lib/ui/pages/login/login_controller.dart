import 'package:bwa_masteringflutter/models/user.dart';
import 'package:bwa_masteringflutter/services/auth_service.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

enum AuthStatus { loading, success, failed }

class LoginController extends GetxController{

  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  Rx<AuthStatus> status = AuthStatus.loading.obs;
  userData? user;
  String? error;

  Future<void> signIn({required String email, required String password}) async {
    try {
      user = await AuthService().signIn(email: email, password: password);
      status = AuthStatus.success.obs;
      update();
    } catch (e) {
      status = AuthStatus.failed.obs;
      error = e.toString();
      update();
    }
  }
  Future<void> signInWithGoogle() async {
    try {
      status = AuthStatus.loading.obs;
      user = await AuthService().signInWithGoogle();
      status = AuthStatus.success.obs;
      update();
    } catch (e) {
      status = AuthStatus.failed.obs;
      error = e.toString();
      update();
    }
  }
}