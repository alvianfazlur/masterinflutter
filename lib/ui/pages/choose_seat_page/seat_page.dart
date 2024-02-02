import 'package:bwa_masteringflutter/shared/theme.dart';
import 'package:bwa_masteringflutter/ui/pages/checkout_page/checkout_page.dart';
import 'package:bwa_masteringflutter/ui/widgets/seat_item.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ChooseSeatPage extends StatelessWidget {
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
                  status: 2,
                ),
                SeatItem(
                  id: 'B1',
                  status: 2,
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
                  status: 0, id: 'C1',
                ),
                SeatItem(
                  status: 2, id: 'D1',
                ),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                SeatItem(
                  status: 0, id: 'A2',
                ),
                SeatItem(
                  status: 0, id: 'B2',
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
                  status: 0, id: 'C2',
                ),
                SeatItem(
                  status: 2, id: 'D2',
                ),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                SeatItem(
                  status: 1, id: 'A3',
                ),
                SeatItem(
                  status: 1, id: 'B3',
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
                  status: 0, id: 'C3',
                ),
                SeatItem(
                  status: 0, id: 'D3',
                ),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                SeatItem(
                  status: 0, id: 'A4',
                ),
                SeatItem(
                  status: 2, id: 'B4',
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
                  status: 0, id: 'C4',
                ),
                SeatItem(
                  status: 0, id: 'D4',
                ),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                SeatItem(
                  status: 0, id: 'A5',
                ),
                SeatItem(
                  status: 0, id: 'B5',
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
                  status: 2, id: 'C5',
                ),
                SeatItem(
                  status: 0, id: 'D5',
                ),
              ],
            ),
            Container(
              margin: EdgeInsets.only(top: 30),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text("Your Seat", style: greyTextStyle.copyWith(fontWeight: light),),
                  Text("A3,B3", style: blackTextStyle.copyWith(fontWeight: medium, fontSize: 16),),
                ],
              ),
            ),
            Container(
              margin: EdgeInsets.only(top: 16),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text("Total", style: greyTextStyle.copyWith(fontWeight: light),),
                  Text("IDR 540.000.000", style: purpleTextStyle.copyWith(fontWeight: semiBold, fontSize: 16),),
                ],
              ),
            )
          ],
        ),
      );
    }
    Widget checkoutButton(){
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
            Get.toNamed(CheckoutPage.routeName);
          },
          child: Text(
            'Continue to Checkout',
            style: whiteTextStyle.copyWith(
                fontWeight: medium, fontSize: 18),
          ),
        ),
      );
    }

    return Scaffold(
      backgroundColor: backgroundColor,
      body: ListView(
        padding: EdgeInsets.symmetric(horizontal: 24),
        children: [title(), seatStatus(), selectedSeat(), checkoutButton()],
      ),
    );
  }
}
