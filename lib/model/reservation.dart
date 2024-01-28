import 'dart:convert';
import 'dart:ui';

import 'package:syncfusion_flutter_calendar/calendar.dart';
import 'package:intl/intl.dart';


class Reservation {
  Reservation({required this.hotelName, required this.from, required this.to, required this.cost});

  String hotelName;
  double cost;
  DateTime from;
  DateTime to;

  static Reservation fromJSON(String jsonString) {
    Map<dynamic, dynamic> jsonMap = json.decode(jsonString);
    // DateTime fromDate = DateTime.parse(jsonMap['from']);
    // DateTime toDate = DateTime.parse(jsonMap['to']);
     DateTime fromDate = DateFormat("yyyy-MM-dd hh:mm:ss").parse(jsonMap['from']);
     DateTime toDate = DateFormat("yyyy-MM-dd hh:mm:ss").parse(jsonMap['to']);

    return Reservation(
      hotelName :  jsonMap['hotelName'],
      from : fromDate,
      to : toDate,
      cost: jsonMap['cost'].toDouble(),
    );
  }

}

class ReservationDataSource extends CalendarDataSource {
  ReservationDataSource(List<Reservation> source) {
    appointments = source;
  }

  @override
  DateTime getStartTime(int index) {
    return appointments![index].from;
  }

  @override
  DateTime getEndTime(int index) {
    return appointments![index].to;
  }

  @override
  String getSubject(int index) {
    return appointments![index].hotelName;
  }

  @override
  Color getColor(int index) {
    return const Color(0xFF497ac6);
  }

  @override
  bool isAllDay(int index) {
    return true;
  }
}

