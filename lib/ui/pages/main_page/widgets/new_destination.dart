import 'package:flutter/material.dart';
import '../../../../models/destination.dart';
import '../../../widgets/new_destination.dart';

class NewDestinationCard extends StatelessWidget {
  const NewDestinationCard({Key? key, required this.destinations}) : super(key: key);

  final List<DestinationModel> destinations;
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(bottom: 100),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children:
        destinations.map((DestinationModel destination) {
          return NewDestination(destination);
        }).toList(),
      ),
    );
  }
}
