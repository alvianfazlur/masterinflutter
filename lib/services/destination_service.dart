import 'package:bwa_masteringflutter/models/destination.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class DestinationService {
  CollectionReference _destinationref =
      FirebaseFirestore.instance.collection('destinations');

  Future<List<DestinationModel>> fetchData() async {
    try {
      QuerySnapshot result = await _destinationref.get();
      List<DestinationModel> destinations = result.docs.map((e) {
        return DestinationModel.fromJson(
            e.id, e.data() as Map<String, dynamic>);
      }).toList();

      return destinations;
    } catch (e) {
      throw e;
    }
  }
}
