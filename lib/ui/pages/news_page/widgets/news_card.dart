import 'package:bwa_masteringflutter/models/news.dart';
import 'package:bwa_masteringflutter/shared/theme.dart';
import 'package:bwa_masteringflutter/ui/pages/news_page/news_page_controller.dart';
import 'package:bwa_masteringflutter/ui/pages/news_page_detail/detail_news.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class NewsCard extends StatelessWidget {
  const NewsCard(this.news, {Key? key}) : super(key: key);

  final NewsModel news;

  @override
  Widget build(BuildContext context) {
    return GetBuilder<NewsController>(
      builder: (controller) => GestureDetector(
        onTap: () {
          Get.toNamed(DetailNewsPage.routeName, arguments: news);
        },
        child: Container(
          margin: EdgeInsets.only(
              top: 6, left: defaultMargin, right: defaultMargin),
          width: double.infinity,
          decoration: BoxDecoration(
              color: whiteColor,
              borderRadius: BorderRadius.circular(10),
              border: Border.all(color: greyColor.withOpacity(0.3))),
          child: Column(
            children: [
              Container(
                padding: EdgeInsets.all(5),
                child: Text(
                  news.title,
                  textAlign: TextAlign.center,
                  style:
                      blackTextStyle.copyWith(fontSize: 18, fontWeight: semiBold),
                ),
              ),
              SizedBox(
                height: 20,
              ),
              Container(
                  width: double.infinity,
                  height: 150,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.only(
                          bottomLeft: Radius.circular(10),
                          bottomRight: Radius.circular(10)),
                      image: DecorationImage(
                          image: NetworkImage(news.imageUrl),
                          fit: BoxFit.cover))),
              Container(
                padding: EdgeInsets.only(left: 10, right: 5),
                margin: EdgeInsets.only(top: 20),
                height: 50,
                child: Text(
                  news.Content,
                  overflow: TextOverflow.ellipsis,
                  maxLines: 2,
                  style: blackTextStyle.copyWith(fontWeight: light),
                ),
              ),
              Align(
                  alignment: Alignment.bottomRight,
                  child: Text(
                    news.date.toString(),
                    style: greyTextStyle,
                  )),
              SizedBox(height: 10,)
            ],
          ),
        ),
      ),
    );
  }
}
