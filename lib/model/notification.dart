import 'dart:convert';
import 'package:intl/intl.dart';

import 'package:flutter/material.dart';

class NotificationInstance {
  String title;
  String subtitle;
  IconData icon;
  DateTime date;

  NotificationInstance({
    required this.title,
    required this.subtitle,
    required this.date,
    this.icon = Icons.delete,
  });

  static NotificationInstance fromJSON(String data) {
    List<String> arr = jsonDecode(data).split(",");
    print(arr[0]);
    DateTime tempDate = DateFormat("yyyy-MM-dd hh:mm:ss").parse(arr[0]);

    return NotificationInstance(
      title: "Notification", // Replace 'title' with the actual key in your JSON
      date: tempDate,//parse(json[0] ?? '')
      subtitle: arr[1],//json[1] ?? ''
    );
  }

}
