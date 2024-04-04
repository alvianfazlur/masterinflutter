import 'package:bwa_masteringflutter/shared/theme.dart';
import 'package:bwa_masteringflutter/ui/pages/news_page_detail/detail_news_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

class DetailNewsPage extends GetView<DetailNewsController> {
  const DetailNewsPage({Key? key}) : super(key: key);
  static const routeName = "/detail-news";

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          leading: IconButton(
              onPressed: () {
                Get.back();
              },
              icon: Image.asset("assets/images/back_button.png")),
          centerTitle: true,
          title: Text(
            "Detail News",
            style: blackTextStyle.copyWith(fontWeight: bold, fontSize: 18),
          ),
        ),
        body: ListView(
          physics: ScrollPhysics(),
          padding: EdgeInsets.only(left: 25, right: 25, bottom: 30, top: 30),
          children: [
            Container(
                width: double.infinity,
                child: Text(
                  controller.news.title,
                  textAlign: TextAlign.start,
                  style: blackTextStyle.copyWith(
                      fontWeight: extraBold, fontSize: 21),
                )),
            Row(
              children: [
                Text(
                  "By",
                  style: greyTextStyle.copyWith(fontSize: 12),
                ),
                SizedBox(
                  width: 6,
                ),
                Text(
                  "Punggawa Travel",
                  style: blackTextStyle.copyWith(fontSize: 12),
                ),
                SizedBox(
                  width: 15,
                ),
                Container(
                  width: 14,
                  height: 14,
                  decoration: BoxDecoration(
                    image: DecorationImage(image: AssetImage("assets/images/time_line.png"))
                  ),
                ),
                SizedBox(
                  width: 6,
                ),
                Text(
                  "${controller.news.date.day} ${DateFormat.MMMM().format(controller.news.date)} ${controller.news.date.year}",
                  style: greyTextStyle.copyWith(fontSize: 12),
                ),
              ],
            ),
            Container(
              margin: EdgeInsets.only(top: 20),
              height: 200,
              width: double.infinity,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(15),
                  image: DecorationImage(
                      image: NetworkImage(controller.news.imageUrl),
                      fit: BoxFit.fill)),
            ),
            Container(
              margin: EdgeInsets.only(top: 20),
              child: Text(
                controller.news.Content,
                textAlign: TextAlign.justify,
                style:
                    greyTextStyle.copyWith(fontSize: 13, fontWeight: semiBold),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
