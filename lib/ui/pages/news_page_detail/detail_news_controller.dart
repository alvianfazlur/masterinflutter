
import 'package:bwa_masteringflutter/models/news.dart';
import 'package:get/get.dart';

class DetailNewsController extends GetxController{

  late final NewsModel news;
  @override
  void onInit() {
    news = Get.arguments;
    super.onInit();
  }
}