import 'package:bwa_masteringflutter/models/news.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class NewsService{
  CollectionReference _newsReference =
  FirebaseFirestore.instance.collection('articles');

  Future<List<NewsModel>> fetchNews() async {
    try {
      QuerySnapshot result = await _newsReference.orderBy('date', descending: true).get();
      List<NewsModel> news = result.docs.map((e) {
        return NewsModel.fromJson(e.data() as Map<String, dynamic>);
      }).toList();
      return news;
    } catch (e) {
      throw e;
    }
  }
}