import 'package:bwa_masteringflutter/shared/theme.dart';
import 'package:bwa_masteringflutter/ui/pages/detail_page/widgets/map_view.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:flutter_carousel_widget/flutter_carousel_widget.dart';
import 'package:maps_launcher/maps_launcher.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:webview_flutter/webview_flutter.dart';
import '../../checkout_page/checkout_page.dart';
import '../detail_page_controller.dart';

class DetailPageContent extends StatelessWidget {
  const DetailPageContent({Key? key, required this.controller})
      : super(key: key);

  final DetailPageController controller;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      child: Column(
        children: [
          Container(
            width: double.infinity,
            margin: EdgeInsets.only(top: 30),
            padding: EdgeInsets.only(top: 30),
            decoration: BoxDecoration(
                color: whiteColor, borderRadius: BorderRadius.circular(18)),
            child:
                Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
              FlutterCarousel(
                options: CarouselOptions(
                  height: 221,
                ),
                items: [1, 2, 3].map((i) {
                  return Builder(
                    builder: (BuildContext context) {
                      return Container(
                        width: 325,
                        height: 221,
                        margin: EdgeInsets.symmetric(horizontal: 20),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20),
                          image: DecorationImage(
                            image: AssetImage('assets/images/ciliwung$i.png'),
                            fit: BoxFit.cover,
                          ),
                        ),
                      );
                    },
                  );
                }).toList(),
              ),
              Container(
                margin: EdgeInsets.all(25),
                child: Column(
                  children: [
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                controller.destination.name,
                                style: blackTextStyle.copyWith(
                                    fontSize: 18, fontWeight: semiBold),
                              ),
                              Text(
                                controller.destination.city,
                                style: greyTextStyle,
                              )
                            ],
                          ),
                        ),
                        Column(
                          children: [
                            Text(
                              NumberFormat.currency(
                                locale: 'id',
                                symbol: 'Rp ',
                                decimalDigits: 0,
                              ).format(controller.price),
                              style: blackTextStyle.copyWith(
                                  fontWeight: extraBold, fontSize: 18),
                            ),
                            Text(
                              "${controller.traveller} Person",
                              style: greyTextStyle,
                            )
                          ],
                        ),
                      ],
                    ),
                    Container(
                      width: double.infinity,
                      height: 104,
                      padding: EdgeInsets.only(
                          left: 20, top: 20, bottom: 20, right: 15),
                      decoration: BoxDecoration(
                          border: Border.all(
                              color: greyColor.withOpacity(0.2), width: 2),
                          borderRadius: BorderRadius.circular(15)),
                      margin: EdgeInsets.only(top: 10, bottom: 10),
                      child: Row(
                        children: [
                          Column(
                            children: [
                              Text(
                                "Rating",
                                style: greyTextStyle.copyWith(
                                    fontSize: 16, fontWeight: medium),
                              ),
                              SizedBox(
                                height: 6,
                              ),
                              Row(
                                children: [
                                  Container(
                                    width: 18,
                                    height: 18,
                                    margin: EdgeInsets.only(right: 6),
                                    decoration: BoxDecoration(
                                        image: DecorationImage(
                                            image: AssetImage(
                                                "assets/images/Star.png"))),
                                  ),
                                  Text(
                                    controller.destination.rating.toString(),
                                    style: blackTextStyle.copyWith(
                                        fontWeight: semiBold, fontSize: 16),
                                  )
                                ],
                              )
                            ],
                          ),
                          SizedBox(
                            width: 30,
                          ),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                "Ticket Price",
                                style: greyTextStyle.copyWith(
                                    fontSize: 16, fontWeight: medium),
                              ),
                              SizedBox(
                                height: 6,
                              ),
                              Text(
                                NumberFormat.compactCurrency(
                                  locale: 'id',
                                  symbol: 'Rp ',
                                ).format(controller.destination.price),
                                style: blackTextStyle.copyWith(
                                    fontWeight: semiBold, fontSize: 16),
                              ),
                            ],
                          ),
                          SizedBox(
                            width: 20,
                          ),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                "Open Time",
                                style: greyTextStyle.copyWith(
                                    fontSize: 16, fontWeight: medium),
                              ),
                              SizedBox(
                                height: 6,
                              ),
                              Text(
                                "08:00 - 17:00",
                                style: greyTextStyle.copyWith(fontSize: 16),
                              )
                            ],
                          ),
                        ],
                      ),
                    ),
                    Text(
                      "Berada di jalur jalan provinsi yang menghubungkan Denpasar Singaraja serta letaknya yang dekat dengan Kebun Raya Eka Karya menjadikan tempat Bali.",
                      style: greyTextStyle.copyWith(
                          fontWeight: regular, height: 1.5),
                      textAlign: TextAlign.justify,
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    GestureDetector(
                      onTap: () async {
                        // await controller.launchUrl(Uri.parse('https://maps.app.goo.gl/XdmczbzuJyzBxkn39'));
                        MapsLauncher.launchQuery("${controller.destination.name}");
                        // Get.toNamed(MapViewPage.routeName);
                      },
                      child: Container(
                        height: 179,
                        width: 325,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(20),
                            image: DecorationImage(
                                image:
                                    AssetImage("assets/images/maps_point.png"),
                                fit: BoxFit.cover)),
                      ),
                    ),
                    Container(
                      margin: EdgeInsets.only(top: 40),
                      width: double.infinity,
                      height: 50,
                      child: TextButton(
                        style: TextButton.styleFrom(
                            backgroundColor: primaryColor,
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(17))),
                        onPressed: () {
                          Get.toNamed(CheckoutPage.routeName, arguments: {
                            'destination': controller.destination,
                            'traveller': controller.traveller,
                            'date': controller.selectedDate
                          });
                        },
                        child: Text(
                          'Book Ticket',
                          style: whiteTextStyle.copyWith(
                              fontWeight: medium, fontSize: 18),
                        ),
                      ),
                    )
                  ],
                ),
              ),
            ]),
          ),
        ],
      ),
    );
  }
}
