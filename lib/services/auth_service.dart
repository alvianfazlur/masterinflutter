import 'package:bwa_masteringflutter/services/data_user_service.dart';
import 'package:bwa_masteringflutter/services/user_service.dart';
import 'package:bwa_masteringflutter/shared/api_url.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';
import 'package:google_sign_in/google_sign_in.dart';

import '../models/user.dart';

class AuthService {
  FirebaseAuth _auth = FirebaseAuth.instance;

  Future<userData> signUp(
      {required String email,
      required String password,
      required String name,
      String hobby = '',
      required balance}) async {
    try {
      UserCredential userCredential = await _auth
          .createUserWithEmailAndPassword(email: email, password: password);
      userData user = userData(
          id: userCredential.user!.uid,
          email: email,
          name: name,
          hobby: hobby,
          balance: balance);
      await userService().setUser(user);
      return user;
    } catch (e) {
      throw e;
    }
  }

  Future<void> signOut() async {
    try {
      await _auth.signOut();
      final googleSignIn = GoogleSignIn();
      googleSignIn.disconnect();
    } catch (e) {
      throw e;
    }
  }

  Future<userData> signIn(
      {required String email, required String password}) async {
    try {
      UserCredential userCredential = await _auth.signInWithEmailAndPassword(
          email: email, password: password);
      userData user = await userService().getUserById(userCredential.user!.uid);
      return user;
    } catch (e) {
      throw e;
    }
  }

  Future<dynamic> signInWithGoogle() async {
    try {
      final GoogleSignInAccount? googleUser = await GoogleSignIn().signIn();
      if (googleUser == null) {
        throw Exception('Sign in with Google was canceled or failed.');
      }

      final GoogleSignInAuthentication? googleAuth =
          await googleUser?.authentication;

      final credential = GoogleAuthProvider.credential(
        accessToken: googleAuth?.accessToken,
        idToken: googleAuth?.idToken,
      );
      UserCredential userCredential =
          await _auth.signInWithCredential(credential);
      userData registUser = userData(
          id: userCredential.user!.uid,
          email: googleUser!.email,
          name: googleUser.displayName!,
          hobby: "",
          balance: 0);
      await userService().setUser(registUser);
      userData user = await userService().getUserById(userCredential.user!.uid);
      print(user.name);
      return user;
    } catch (e) {
      print('Error signing in with Google: $e');
      rethrow;
    }
  }
}
