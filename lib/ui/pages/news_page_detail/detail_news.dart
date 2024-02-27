import 'package:bwa_masteringflutter/shared/theme.dart';
import 'package:bwa_masteringflutter/ui/pages/news_page_detail/detail_news_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class DetailNewsPage extends GetView<DetailNewsController> {
  const DetailNewsPage({Key? key}) : super(key: key);
  static const routeName = "/detail-news";

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: backgroundColor,
        body: ListView(
          children: [
            Container(
                margin: EdgeInsets.symmetric(horizontal: 24),
                width: double.infinity,
                child: Text(
                  controller.news.title,
                  textAlign: TextAlign.center,
                  style: blackTextStyle.copyWith(
                      fontWeight: extraBold, fontSize: 20),
                )),
            Container(
              margin: EdgeInsets.only(top: 20, right: 10, left: 10),
              height: 200,
              width: double.infinity,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(5),
                  image: DecorationImage(
                      image: NetworkImage(controller.news.imageUrl),
                      fit: BoxFit.fill)),
            ),
            Container(
              margin: EdgeInsets.symmetric(horizontal: 10, vertical: 30),
              child: Text(
                controller.news.Content,
                textAlign: TextAlign.justify,
                style: blackTextStyle,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
