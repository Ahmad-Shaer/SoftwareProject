import 'dart:convert';
import 'package:provider/provider.dart';
import 'package:traveler_nest/providers/user_provider.dart';
import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_calendar/calendar.dart';
import 'package:http/http.dart' as http;
import '../model/reservation.dart';

class CalenderPage extends StatefulWidget {
  const CalenderPage({super.key});

  @override
  State<CalenderPage> createState() => _CalenderPageState();
}

class _CalenderPageState extends State<CalenderPage> {
  @override
  void initState() {
    super.initState();
    fetchReservations(context);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Column(
          key: UniqueKey(),
          mainAxisSize: MainAxisSize.min,
          children: [
            Stack(
              children: [
                Opacity(
                  opacity: 0.2,
                  child: ClipPath(
                    clipper: WaveClipper(),
                    child: Container(
                      height: 305,
                      decoration:
                          const BoxDecoration(color: Colors.black, boxShadow: [
                        BoxShadow(
                          color: Colors.black,
                          blurRadius: 3.0,
                          spreadRadius: 20.0,
                          blurStyle: BlurStyle.solid,
                        )
                      ]),
                    ),
                  ),
                ),
                ClipPath(
                  clipper: WaveClipper(),
                  child: Container(
                    decoration: const BoxDecoration(
                      color: Colors.deepOrange,
                      image: DecorationImage(
                        image: AssetImage("assets/calender_bg.jpg"),
                        fit: BoxFit.cover,
                      ),
                    ),
                    height: 300,
                  ),
                ),
                Positioned(
                  top: 240,
                  left: MediaQuery.of(context).size.width / 2.15,
                  child: const Text(
                    "Calender",
                    style: TextStyle(
                      fontFamily: "Caveat",
                      fontSize: 40.0,
                      letterSpacing: 2.0,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ],
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
                todayHighlightColor: const Color(0xFFf4955c),
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
                    trailingDatesBackgroundColor: Colors.grey.withOpacity(0.4),
                    leadingDatesBackgroundColor: Colors.grey.withOpacity(0.4),
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
   List<Reservation>  reservations= [] ;
  List<Reservation> _getDataSource() {
    return reservations;
  }

  void fetchReservations(BuildContext context) async {
    List<Reservation> reservationsTemp = [];
    try {
      final email = context.read<UserProvider>().currentUser.email;
      final response = await http.post(
        Uri.parse('http://192.168.1.10:8000/myBookings'),
        headers: <String, String>{
          'Content-Type': 'application/json',
        },
        body: json.encode({'email': email}),
      );

      if (response.statusCode == 200) {
        List<dynamic> bookingList = json.decode(response.body);
        for (var bookingData in bookingList) {
          Reservation bookingInstance = Reservation.fromJSON(json.encode(bookingData));
          reservationsTemp.add(bookingInstance);
        }
        setState(() {
          reservations = reservationsTemp;
        });
      } else {
        print('Failed to fetch bookings. Status code: ${response.statusCode}');
      }
    } catch (e) {
      print('Error: $e');
    }

  }

}


class WaveClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    var path = Path();
    path.lineTo(0, size.height);

    var firstPointStart = Offset(size.width / 5, size.height);
    var firstPointEnd = Offset(size.width / 2.25, size.height - 50.0);

    path.quadraticBezierTo(firstPointStart.dx, firstPointStart.dy,
        firstPointEnd.dx, firstPointEnd.dy);

    var secondPointStart =
        Offset(size.width - (size.width / 3.24), size.height - 105);
    var secondPointEnd = Offset(size.width, size.height - 10.0);

    path.quadraticBezierTo(secondPointStart.dx, secondPointStart.dy,
        secondPointEnd.dx, secondPointEnd.dy);

    path.lineTo(size.width, 0);
    path.close();

    return path;
  }

  @override
  bool shouldReclip(covariant CustomClipper<Path> oldClipper) {
    return true;
  }
}
