import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_calendar/calendar.dart';

class CalenderPage extends StatefulWidget {
  const CalenderPage({super.key});

  @override
  State<CalenderPage> createState() => _CalenderPageState();
}

class _CalenderPageState extends State<CalenderPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Column(
          key: UniqueKey(),
          mainAxisSize: MainAxisSize.min,
          children: [
            Container(
              height: 20,
            ),
            Container(
              height: 800,
              child: SfCalendar(
                key: UniqueKey(),
                view: CalendarView.month,
                dataSource: ReservationDataSource(_getDataSource()),
                allowAppointmentResize: false,
                allowDragAndDrop: false,
                allowViewNavigation: false,
                firstDayOfWeek: 7,
                showTodayButton: true,
                showCurrentTimeIndicator: true,
                showNavigationArrow: true,
                onTap: (details) {
                  print("${details.appointments![0].hotelName}");
                },
                monthViewSettings: MonthViewSettings(
                  appointmentDisplayMode:
                      MonthAppointmentDisplayMode.appointment,
                  appointmentDisplayCount: 10,
                  showTrailingAndLeadingDates: true,
                  agendaViewHeight: 200,
                  agendaItemHeight: 40,
                  monthCellStyle: MonthCellStyle(
                    backgroundColor: Colors.white,
                    todayBackgroundColor: Colors.white,
                    trailingDatesBackgroundColor: Colors.grey.withOpacity(0.6),
                    leadingDatesBackgroundColor: Colors.grey.withOpacity(0.6),
                  ),
                  showAgenda: true,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  List<Reservation> _getDataSource() {
    final List<Reservation> reservations = <Reservation>[];
    final DateTime today = DateTime.now();
    DateTime startTime = DateTime(today.year, today.month, today.day, 9, 0, 0);
    startTime = startTime.add(Duration(days: 3));
    final DateTime endTime = startTime.add(const Duration(days: 2));

    reservations.add(Reservation('Golden Tree Hotel', startTime, endTime));
    return reservations;
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
    return Colors.black87;
  }

  @override
  bool isAllDay(int index) {
    return true;
  }
}

class Reservation {
  Reservation(this.hotelName, this.from, this.to);

  String hotelName;
  DateTime from;
  DateTime to;
}

// TODO: add reservation ID here to show it on tap in a dialog
