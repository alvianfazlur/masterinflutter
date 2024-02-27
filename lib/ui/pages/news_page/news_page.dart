import 'package:bwa_masteringflutter/shared/theme.dart';
import 'package:bwa_masteringflutter/ui/pages/news_page/news_page_controller.dart';
import 'package:bwa_masteringflutter/ui/pages/news_page/widgets/show_news.dart';
import 'package:bwa_masteringflutter/ui/widgets/bottom_navbar.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class NewsPage extends GetView<NewsController> {
  const NewsPage({Key? key}) : super(key: key);
  static const routeName = '/news';
  @override
  Widget build(BuildContext context) {
    return GetBuilder(
      builder: (NewsController controller) => SafeArea(
        child: Scaffold(
          backgroundColor: backgroundColor,
          body: Stack(
            children: [
              ListView(
                children: [
                  ShowNews(news: controller.news)
                ],
              ),
              Container(
                  alignment: Alignment.center,
                  width: double.infinity,
                  decoration: BoxDecoration(
                    color: backgroundColor,
                      border: Border(
                          bottom: BorderSide(
                              color: greyColor.withOpacity(0.5)
                          )
                      )
                  ),
                  height: 50,
                  child: Text(
                    "Seputar Wisata",
                    style:
                    blackTextStyle.copyWith(fontWeight: semiBold, fontSize: 28),
                  )),
              BottomNavbar(isSelectedNews: true,)
            ],
          ),
        ),
      ),
    );
  }
}
