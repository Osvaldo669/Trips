import 'dart:convert';

class DataModel {
  String name, img, description, location;
  int price, people, stars;

  DataModel(
      {required this.description,
      required this.img,
      required this.location,
      required this.name,
      required this.price,
      required this.people,
      required this.stars});

  factory DataModel.fromJson(Map<String, dynamic> json) {
    return DataModel(
        description: json["description"],
        img: json['img'],
        location: json['location'],
        name: json['name'],
        price: json['price'],
        people: json['people'],
        stars: json['stars']);
  }
}
