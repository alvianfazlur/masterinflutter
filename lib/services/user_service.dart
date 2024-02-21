import 'package:bwa_masteringflutter/models/user.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

import 'data_user_service.dart';

class userService {
  CollectionReference _userReference =
      FirebaseFirestore.instance.collection('users');

  Future<void> setUser(userData user) async {
    try {
      await DataUserService().storeUser(user.name, user.id, 280000000, user.hobby, user.email);
      _userReference.doc(user.id).set({
        'email': user.email,
        'name': user.name,
        'hobby': user.hobby,
        'balance': user.balance
      });
    } catch (e) {
      throw e;
    }
  }

  Future<userData> getUserById(String id) async {
    try {
      DocumentSnapshot snapshot = await _userReference.doc(id).get();
      return userData(
          id: id,
          email: snapshot['email'],
          name: snapshot['name'],
          hobby: snapshot['hobby'],
      balance: snapshot['balance']);
    } catch (e){
      throw e;
    }
  }

}
