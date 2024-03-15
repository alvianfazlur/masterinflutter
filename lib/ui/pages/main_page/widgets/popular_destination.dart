import 'package:flutter/material.dart';

import '../../../../models/destination.dart';
import 'destination_card.dart';

class PopularDestination extends StatelessWidget {
  const PopularDestination({Key? key, required this.destinations}) : super(key: key);

  final List<DestinationModel> destinations;
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(bottom: 20),
      child: SingleChildScrollView(
        scrollDirection: Axis.horizontal,
        child: Row(
          children: destinations.map((DestinationModel destination) {
            return DestinationCard(destination);
          }).toList(),
        ),
      ),
    );
  }
}
