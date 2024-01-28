import 'dart:convert';

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

  Hotel(
      {required this.imageSrcPath,
      required this.hotelName,
      required this.availableRooms,
      required this.city,
      required this.price,
      required this.rate,
      required this.address,
      this.images,
      this.tags,
      this.features});

  static Hotel fromJSON(String jsonString) {
    Map<String, dynamic> jsonMap = json.decode(jsonString);

    return Hotel(
      imageSrcPath: jsonMap['imageSrcPath'],
      hotelName: jsonMap['hotelName'],
      availableRooms: List<String>.from(jsonMap['availableRooms']),
      images: jsonMap['images'] != null
          ? List<String>.from(jsonMap['images'])
          : null,
      tags: jsonMap['tags'] != null ? List<String>.from(jsonMap['tags']) : null,
      features: jsonMap['features'] != null
          ? List<String>.from(jsonMap['features'])
          : null,
      city: jsonMap['city'],
      address: jsonMap['address'],
      price: jsonMap['price'].toDouble(),
      rate: jsonMap['rate'].toDouble(),
    );
  }
}

