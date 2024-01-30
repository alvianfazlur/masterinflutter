import 'package:bwa_masteringflutter/models/user.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
class userService{
  CollectionReference _userReference = FirebaseFirestore.instance.collection('users');

  Future<void> setUser(userData user) async {
    try{
      _userReference.doc(user.id).set({
        'email':user.email,
        'name':user.name,
        'hobby':user.hobby,
        'balance':user.balance
      });
    }catch(e){
      throw e;
    }
  }
}