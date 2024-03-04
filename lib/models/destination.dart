import 'package:equatable/equatable.dart';

class DestinationModel extends Equatable {
  final String id;
  final String name;
  final String city;
  final String imageurl;
  final int price;
  final String category;

  DestinationModel({required this.id,
    required this.name,
    required this.city,
    required this.category,
    required this.imageurl,
    required this.price});

  factory DestinationModel.fromJson(String id, Map<String, dynamic> json) =>
      DestinationModel(id: id,
          name: json['name'],
          city: json['city'],
          category: json['category'],
          imageurl: json['imageurl'],
          price: json['price']
      );
  Map<String, dynamic> toJson() => {
    'id': id,
    'name': name,
    'city': city,
    'imageurl': imageurl,
    'category':category,
    'price':price
  };

  @override
  List<Object?> get props => [id, name, imageurl, price];
}
