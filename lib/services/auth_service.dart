import 'package:bwa_masteringflutter/services/user_service.dart';
import 'package:firebase_auth/firebase_auth.dart';

import '../models/user.dart';

class AuthService {
  FirebaseAuth _auth = FirebaseAuth.instance;

  Future<userData> signUp(
      {required String email,
      required String password,
      required String name,
      String hobby = ''}) async {
    try {
      UserCredential userCredential = await _auth
          .createUserWithEmailAndPassword(email: email, password: password);
      userData user = userData(
          id: userCredential.user!.uid,
          email: email,
          name: name,
          hobby: hobby,
          balance: 280000000);
      await userService().setUser(user);
      return user;
    } catch (e) {throw e;}
  }
}
