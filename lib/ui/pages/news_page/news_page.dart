import 'package:bwa_masteringflutter/shared/theme.dart';
import 'package:bwa_masteringflutter/ui/pages/news_page/news_page_controller.dart';
import 'package:bwa_masteringflutter/ui/pages/news_page/widgets/show_news.dart';
import 'package:bwa_masteringflutter/ui/widgets/bottom_navbar.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';

class NewsPage extends GetView<NewsController> {
  const NewsPage({Key? key}) : super(key: key);
  static const routeName = '/news';

  @override
  Widget build(BuildContext context) {
    return GetBuilder(
      builder: (NewsController controller) => SafeArea(
        child: Scaffold(
          backgroundColor: primaryColor,
          body: Stack(
            children: [
              ListView(
                children: [
                  Container(
                    margin: EdgeInsets.only(
                        top: 25, left: 25, right: 25, bottom: 30),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "Promo & News",
                          style: whiteTextStyle.copyWith(
                              fontSize: 18, fontWeight: semiBold),
                        ),
                        Text("Join us and get your next journey",
                            style: whiteTextStyle.copyWith(
                                fontWeight: light,
                                color: whiteColor.withOpacity(0.4)))
                      ],
                    ),
                  ),
                  Container(
                    padding: EdgeInsets.only(
                        left: 25, right: 25, top: 25, bottom: 70),
                    width: double.infinity,
                    height: MediaQuery.sizeOf(context).height,
                    decoration: BoxDecoration(
                        color: whiteColor,
                        borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(20),
                            topRight: Radius.circular(20))),
                    child: Column(
                      children: [
                        Text(
                          "Limited Offers",
                          style: blackTextStyle.copyWith(
                              fontWeight: semiBold, fontSize: 18),
                        ),
                        Container(
                          width: double.infinity,
                          margin: EdgeInsets.only(top: 20, bottom: 25),
                          height: 100,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                              border: Border.all(
                                  color: blackColor.withOpacity(0.2)),
                              image: DecorationImage(
                                  image: AssetImage(
                                      "assets/images/promo_discount.png"),
                                  fit: BoxFit.cover)),
                        ),
                        Text(
                          "Tour Inspiration For You",
                          style: blackTextStyle.copyWith(
                              fontSize: 18, fontWeight: semiBold),
                        ),
                        SizedBox(
                          height: 15,
                        ),
                        ShowNews(news: controller.news),

                      ],
                    ),
                  ),
                ],
              ),
              BottomNavbar(
                isSelectedNews: true,
              )
            ],
          ),
        ),
      ),
    );
  }
}
