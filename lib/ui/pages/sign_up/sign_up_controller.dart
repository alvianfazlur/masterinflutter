import 'package:bwa_masteringflutter/models/user.dart';
import 'package:bwa_masteringflutter/services/auth_service.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

class SignUpController extends GetxController with EquatableMixin {

  TextEditingController nameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController hobbyController = TextEditingController();

  @override
  void onInit() {
    super.onInit();
  }

  Future<void> signup(
      {required String email,
      required String password,
      required String name,
      String hobby = ""}) async {
    try {
      AuthLoading();
      update();

      userData user = await AuthService()
          .signUp(email: email, password: password, name: name, hobby: hobby);
      AuthSuccess(user);
      update();
    } catch (e) {
      AuthFailed(e.toString());
    }
  }

  @override
  List<Object?> get props => [];
}

class AuthLoading extends SignUpController {}

class AuthSuccess extends SignUpController {
  final userData user;

  AuthSuccess(this.user);

  @override
  List<Object?> get props => [user];
}

class AuthFailed extends SignUpController {
  final String error;

  AuthFailed(this.error);

  @override
  // TODO: implement props
  List<Object?> get props => [error];
}
