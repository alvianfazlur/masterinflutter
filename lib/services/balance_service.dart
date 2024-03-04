import 'package:cloud_firestore/cloud_firestore.dart';

class BalanceService{
  CollectionReference _userReference =
  FirebaseFirestore.instance.collection('users');

  Future<void> updateBalance (String id, int newBalance) async {
    try{
      await _userReference.doc(id).update({
        'balance': newBalance,
      });
    }catch(e){
      throw e;
    }
  }

  Future<int> fetchBalance(String id) async {
      DocumentSnapshot snapshot = await FirebaseFirestore.instance.collection('users').doc(id).get();
      int balance = snapshot['balance'] ?? 0;
      return balance;
  }
}