import 'package:bwa_masteringflutter/models/news.dart';
import 'package:bwa_masteringflutter/shared/theme.dart';
import 'package:bwa_masteringflutter/ui/pages/news_page/news_page_controller.dart';
import 'package:bwa_masteringflutter/ui/pages/news_page_detail/detail_news.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

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
          padding: EdgeInsets.all(15),
          margin: EdgeInsets.only(bottom: 15),
          width: double.infinity,
          decoration: BoxDecoration(
              color: whiteColor,
              borderRadius: BorderRadius.circular(14),
              border: Border.all(color: greyColor.withOpacity(0.3))),
          child: Row(
            children: [
              Container(
                height: 100,
                width: 100,
                margin: EdgeInsets.only(right: 6),
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(15),
                    image: DecorationImage(
                      image: NetworkImage(news.imageUrl),
                      fit: BoxFit.cover,
                    )),
              ),
              Expanded(
                flex: 2,
                child: Column(
                  children: [
                    Text(
                      news.title,
                      style: blackTextStyle.copyWith(fontWeight: semiBold),
                      // overflow: TextOverflow.ellipsis,
                      maxLines: 2,
                    ),
                    SizedBox(height: 5,),
                    Text(
                      news.Content,
                      style: greyTextStyle.copyWith(fontSize: 10),
                      overflow: TextOverflow.ellipsis,
                      maxLines: 2,
                    )
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
