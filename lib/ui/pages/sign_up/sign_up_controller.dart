import 'package:bwa_masteringflutter/models/user.dart';
import 'package:bwa_masteringflutter/services/auth_service.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

enum AuthStatus { loading, success, failed }

class SignUpController extends GetxController with EquatableMixin {
  Rx<AuthStatus> status = AuthStatus.loading.obs;
  TextEditingController nameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController hobbyController = TextEditingController();

  userData? user;
  String? error;

  Future<void> signup({
    required String email,
    required String password,
    required String name,
    String hobby = "",
  }) async {
    try {
      user = await AuthService().signUp(
        email: email,
        password: password,
        name: name,
        hobby: hobby,
        balance: 280000000,
      );

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
      user = await AuthService().signInWithGoogle();
      status = AuthStatus.success.obs;
      update();
    } catch (e) {
      status = AuthStatus.failed.obs;
      error = e.toString();
      update();
    }
  }

  @override
  List<Object?> get props => [status, user, error];
}
