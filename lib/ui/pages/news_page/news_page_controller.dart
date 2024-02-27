import 'package:bwa_masteringflutter/models/news.dart';
import 'package:bwa_masteringflutter/services/news_service.dart';
import 'package:get/get.dart';

class NewsController extends GetxController{
  List<NewsModel> news = [];

  @override
  void onInit(){
    fetchNews();
    super.onInit();
  }

  Future<void> fetchNews() async {
    try{
      news = await NewsService().fetchNews();
      update();
    }catch(e){
      update();
    }
  }
}