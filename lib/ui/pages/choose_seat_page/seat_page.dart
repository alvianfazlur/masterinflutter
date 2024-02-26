import 'package:bwa_masteringflutter/shared/theme.dart';
import 'package:bwa_masteringflutter/ui/pages/checkout_page/checkout_page.dart';
import 'package:bwa_masteringflutter/ui/pages/choose_seat_page/seat_controller.dart';
import 'package:bwa_masteringflutter/ui/pages/detail_page/detail_page_controller.dart';
import 'package:bwa_masteringflutter/ui/widgets/seat_item.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

class ChooseSeatPage extends GetView<SeatController> {
  const ChooseSeatPage({Key? key}) : super(key: key);
  static const routeName = "/seat";

  @override
  Widget build(BuildContext context) {
    Widget title() {
      return Container(
        margin: EdgeInsets.only(top: 50),
        child: Text(
          "Select Your\nFavorite Seat",
          style: blackTextStyle.copyWith(fontSize: 24, fontWeight: semiBold),
        ),
      );
    }

    Widget seatStatus() {
      return Container(
        margin: const EdgeInsets.only(top: 30),
        child: Row(
          children: [
            Container(
              width: 16,
              height: 16,
              margin: EdgeInsets.only(right: 6),
              decoration: BoxDecoration(
                  image: DecorationImage(
                      image: AssetImage('assets/images/available.png'))),
            ),
            Text("Available", style: blackTextStyle),
            Container(
              width: 16,
              height: 16,
              margin: EdgeInsets.only(right: 6, left: 10),
              decoration: BoxDecoration(
                  image: DecorationImage(
                      image: AssetImage('assets/images/selected.png'))),
            ),
            Text("Selected", style: blackTextStyle),
            Container(
              width: 16,
              height: 16,
              margin: EdgeInsets.only(right: 6, left: 10),
              decoration: BoxDecoration(
                  image: DecorationImage(
                      image: AssetImage('assets/images/unavailable.png'))),
            ),
            Text("Unavailable", style: blackTextStyle)
          ],
        ),
      );
    }

    Widget selectedSeat() {
      return Container(
        margin: EdgeInsets.only(
          top: 30,
        ),
        width: double.infinity,
        padding: EdgeInsets.symmetric(horizontal: 22, vertical: 30),
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(18), color: whiteColor),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Container(
                    width: 48,
                    height: 48,
                    child: Center(
                      child: Text(
                        "A",
                        style: greyTextStyle.copyWith(fontSize: 16),
                      ),
                    )),
                Container(
                    width: 48,
                    height: 48,
                    child: Center(
                      child: Text(
                        "B",
                        style: greyTextStyle.copyWith(fontSize: 16),
                      ),
                    )),
                Container(
                    width: 48,
                    height: 48,
                    child: Center(
                      child: Text(
                        " ",
                        style: greyTextStyle.copyWith(fontSize: 16),
                      ),
                    )),
                Container(
                    width: 48,
                    height: 48,
                    child: Center(
                      child: Text(
                        "C",
                        style: greyTextStyle.copyWith(fontSize: 16),
                      ),
                    )),
                Container(
                    width: 48,
                    height: 48,
                    child: Center(
                      child: Text(
                        "D",
                        style: greyTextStyle.copyWith(fontSize: 16),
                      ),
                    ))
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                SeatItem(
                  id: 'A1',
                ),
                SeatItem(
                  id: 'B1',
                ),
                Container(
                  margin: EdgeInsets.only(top: 16),
                  width: 48,
                  height: 48,
                  decoration:
                      BoxDecoration(borderRadius: BorderRadius.circular(15)),
                  child: Center(
                      child: Text(
                    "1",
                    style: greyTextStyle.copyWith(fontSize: 16),
                  )),
                ),
                SeatItem(
                  id: 'C1',
                ),
                SeatItem(
                  id: 'D1',
                ),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                SeatItem(
                  id: 'A2',
                ),
                SeatItem(
                  id: 'B2',
                ),
                Container(
                  margin: EdgeInsets.only(top: 16),
                  width: 48,
                  height: 48,
                  decoration:
                      BoxDecoration(borderRadius: BorderRadius.circular(15)),
                  child: Center(
                      child: Text(
                    "2",
                    style: greyTextStyle.copyWith(fontSize: 16),
                  )),
                ),
                SeatItem(
                  id: 'C2',
                ),
                SeatItem(
                  id: 'D2',
                ),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                SeatItem(
                  id: 'A3',
                ),
                SeatItem(
                  id: 'B3',
                ),
                Container(
                  margin: EdgeInsets.only(top: 16),
                  width: 48,
                  height: 48,
                  decoration:
                      BoxDecoration(borderRadius: BorderRadius.circular(15)),
                  child: Center(
                      child: Text(
                    "3",
                    style: greyTextStyle.copyWith(fontSize: 16),
                  )),
                ),
                SeatItem(
                  id: 'C3',
                ),
                SeatItem(
                  id: 'D3',
                ),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                SeatItem(
                  id: 'A4',
                ),
                SeatItem(
                  id: 'B4',
                ),
                Container(
                  margin: EdgeInsets.only(top: 16),
                  width: 48,
                  height: 48,
                  decoration:
                      BoxDecoration(borderRadius: BorderRadius.circular(15)),
                  child: Center(
                      child: Text(
                    "4",
                    style: greyTextStyle.copyWith(fontSize: 16),
                  )),
                ),
                SeatItem(
                  id: 'C4',
                ),
                SeatItem(
                  id: 'D4',
                  isAvailable: false,
                ),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                SeatItem(
                  id: 'A5',
                ),
                SeatItem(
                  id: 'B5',
                ),
                Container(
                  margin: EdgeInsets.only(top: 16),
                  width: 48,
                  height: 48,
                  decoration:
                      BoxDecoration(borderRadius: BorderRadius.circular(15)),
                  child: Center(
                      child: Text(
                    "5",
                    style: greyTextStyle.copyWith(fontSize: 16),
                  )),
                ),
                SeatItem(
                  id: 'C5',
                ),
                SeatItem(
                  id: 'D5',
                ),
              ],
            ),
            Container(
              margin: EdgeInsets.only(top: 30),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "Your Seat",
                    style: greyTextStyle.copyWith(fontWeight: light),
                  ),
                  Container(
                    width: 200,
                    alignment: Alignment.centerRight,
                    child: Text(
                      controller.seatOccupied.join(', '),
                      style: blackTextStyle.copyWith(
                          fontWeight: medium, fontSize: 16),
                      overflow: TextOverflow.ellipsis,
                    ),
                  ),
                ],
              ),
            ),
            Container(
              margin: EdgeInsets.only(top: 16),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "Total",
                    style: greyTextStyle.copyWith(fontWeight: light),
                  ),
                  Text(
                    NumberFormat.currency(
                      locale: 'id',
                      symbol: 'IDR ',
                      decimalDigits: 0,
                    ).format(controller.seatOccupied.length *
                        controller.destination.price),
                    style: purpleTextStyle.copyWith(
                        fontWeight: semiBold, fontSize: 16),
                  ),
                ],
              ),
            )
          ],
        ),
      );
    }

    Widget checkoutButton() {
      return Container(
        margin: EdgeInsets.only(bottom: 46, top: 30),
        width: 327,
        height: 55,
        child: TextButton(
          style: TextButton.styleFrom(
              backgroundColor: primaryColor,
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(17))),
          onPressed: () {
            if (controller.seatOccupied.isEmpty) {
              Get.snackbar(
                'Empty Seat',
                'Please Select your Seat',
                backgroundColor: Colors.red,
                colorText: Colors.white,
                snackPosition: SnackPosition.TOP,
                duration: const Duration(seconds: 3),
              );
            } else {
              Get.toNamed(CheckoutPage.routeName, arguments: controller.destination);
            }
          },
          child: Text(
            'Continue to Checkout',
            style: whiteTextStyle.copyWith(fontWeight: medium, fontSize: 18),
          ),
        ),
      );
    }

    return GetBuilder(
      builder: (SeatController controller) => Scaffold(
        backgroundColor: backgroundColor,
        body: ListView(
          padding: EdgeInsets.symmetric(horizontal: 24),
          children: [title(), seatStatus(), selectedSeat(), checkoutButton()],
        ),
      ),
    );
  }
}
