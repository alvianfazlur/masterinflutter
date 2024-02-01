import 'package:equatable/equatable.dart';

class DestinationModel extends Equatable {
  final String id;
  final String name;
  final String city;
  final String imageurl;
  final double rating;
  final int price;

  DestinationModel({required this.id,
    required this.name,
    required this.city,
    required this.imageurl,
    this.rating = 0,
    required this.price});

  factory DestinationModel.fromJson(String id, Map<String, dynamic> json) =>
      DestinationModel(id: id,
          name: json['name'],
          city: json['city'],
          imageurl: json['imageurl'],
          rating: json['rating'],
          price: json['price']
      );

  @override
  List<Object?> get props => [id, name, imageurl, rating, price];
}
