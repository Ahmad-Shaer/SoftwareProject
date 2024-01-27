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
}
