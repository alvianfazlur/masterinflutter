import 'package:bwa_masteringflutter/models/news.dart';
import 'package:bwa_masteringflutter/ui/pages/news_page/news_page_controller.dart';
import 'package:bwa_masteringflutter/ui/pages/news_page/widgets/news_card.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../shared/theme.dart';

class ShowNews extends StatelessWidget {
  const ShowNews({Key? key, required this.news}) : super(key: key);

  final List<NewsModel> news;

  @override
  Widget build(BuildContext context) {
    return GetBuilder(
      builder: (NewsController controller) => Container(
        width: double.infinity,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: news.map((NewsModel article) {
            return NewsCard(article);
          }).toList(),
        ),
      ),
    );
  }
}
