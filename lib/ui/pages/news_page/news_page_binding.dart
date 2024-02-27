import 'package:bwa_masteringflutter/ui/pages/news_page/news_page_controller.dart';
import 'package:get/get.dart';

class NewsPageBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => NewsController());
  }
}