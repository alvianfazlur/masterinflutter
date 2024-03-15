import 'package:bwa_masteringflutter/models/user.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class userService {
  CollectionReference _userReference =
      FirebaseFirestore.instance.collection('users');

  Future<void> setUser(userData user) async {
    try {
      final DocumentSnapshot userDoc = await _userReference.doc(user.id).get();

      if (userDoc.exists) {
        print("Pengguna dengan ID ${user.id} sudah ada di database.");
        return;
      }

      // Jika tidak, tambahkan pengguna baru ke database
      await _userReference.doc(user.id).set({
        'email': user.email,
        'name': user.name,
        'hobby': user.hobby,
        'balance': user.balance
      });

      print("Pengguna baru berhasil ditambahkan ke database.");
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

  Future<void> updateUser (String id, String name, String hobby) async {
    try{
      await _userReference.doc(id).update({
        'name': name,
        'hobby': hobby,
      });
    }catch(e){
      throw e;
    }
  }
}
