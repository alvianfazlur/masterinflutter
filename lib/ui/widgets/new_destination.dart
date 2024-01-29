import 'package:bwa_masteringflutter/shared/theme.dart';
import 'package:flutter/material.dart';

class NewDestination extends StatelessWidget {
  const NewDestination({Key? key, required this.name, required this.city, required this.rating, required this.url}) : super(key: key);
  final String name;
  final String city;
  final double rating;
  final String url;


  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(top: 16),
      padding: EdgeInsets.all(10),
      decoration: BoxDecoration(
        color: whiteColor,
        borderRadius: BorderRadius.circular(18),
      ),
      child: Row(
        children: [
          Container(
            width: 70,
            height: 70,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(18),
                image: DecorationImage(
                  fit: BoxFit.cover,
                    image: AssetImage(url))),
          ),
          Expanded(
            child: Container(
              width: 138,
              height: 53,
              margin: EdgeInsets.only(left: 16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    name,
                    style: blackTextStyle.copyWith(fontSize: 18, fontWeight: medium),
                  ),
                  Text(
                    city,
                    style: greyTextStyle.copyWith(fontWeight: light),
                  )
                ],
              ),
            ),
          ),
          Container(
            width: 46,
            height: 24,
            child: Row(
              children: [
                Container(
                  width: 24,
                  height: 24,
                  decoration: BoxDecoration(
                    image: DecorationImage(image: AssetImage('assets/images/Star.png'))
                  ),
                ),
                Text(rating.toString(), style: blackTextStyle.copyWith(fontWeight: medium),)
              ],
            ),
          ),
        ],
      ),
    );
  }
}
