import 'package:flutter/cupertino.dart';

class Hotel {
  String imageSrcPath;
  String hotelName;
  List<String> availableRooms;
  List<String>? images;
  List<String>? tags;
  List<String>? features;
  String city;
  String address;
  double price;
  double rate;
  int numberOfRates;

  Hotel(
      {required this.imageSrcPath,
      required this.hotelName,
      required this.availableRooms,
      required this.city,
      required this.price,
      required this.rate,
      required this.numberOfRates,
      required this.address,
      this.images,
      this.tags,
      this.features});
}
