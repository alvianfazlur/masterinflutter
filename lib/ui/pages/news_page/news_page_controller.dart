import 'package:bwa_masteringflutter/models/news.dart';
import 'package:bwa_masteringflutter/models/user.dart';
import 'package:bwa_masteringflutter/services/news_service.dart';
import 'package:get/get.dart';

class NewsController extends GetxController{
  List<NewsModel> news = [];
  userData? user;

  @override
  void onInit(){
    user = Get.arguments;
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