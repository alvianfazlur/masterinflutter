import 'package:bwa_masteringflutter/ui/pages/news_page_detail/detail_news_controller.dart';
import 'package:get/get.dart';

class DetailNewsBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => DetailNewsController());
  }
}