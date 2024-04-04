import 'package:bwa_masteringflutter/models/transaction.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class TransactionService {
  CollectionReference _transactionReference =
      FirebaseFirestore.instance.collection('transactions');

  Future<void> createTransaction(TransactionModel transaction) async {
    try {
      _transactionReference.add({
        'destination': transaction.destination.toJson(),
        'amountOfTraveler': transaction.amountOfTraveler,
        'insurance': transaction.insurance,
        'refundable': transaction.refundable,
        'vat': transaction.vat,
        'price': transaction.price,
        'grandTotal': transaction.grandTotal,
        'uid': transaction.uid,
        'date': transaction.date,
        'dateCreated': transaction.dateCreated
      });
    } catch (e) {
      throw e;
    }
  }

  Future<List<TransactionModel>> fetchTransaction(String uid) async {
    try {
      QuerySnapshot result = await _transactionReference
          .where('uid', isEqualTo: uid)
          .get();
      List<TransactionModel> transactions = result.docs.map((e) {
        return TransactionModel.fromJson(
            e.id, e.data() as Map<String, dynamic>);
      }).toList();
      transactions.sort((a, b) => b.dateCreated.compareTo(a.dateCreated));
      return transactions;
    } catch (e) {
      throw e;
    }
  }
}
