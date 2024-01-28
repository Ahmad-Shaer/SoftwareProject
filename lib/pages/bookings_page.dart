import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_datepicker/datepicker.dart';
import 'package:traveler_nest/widgets/custom_list_tile.dart';
import 'package:http/http.dart' as http;
import '../model/reservation.dart';

class BookingsPage extends StatefulWidget {
  BookingsPage({super.key});

  @override
  State<BookingsPage> createState() => _BookingsPageState();
}

class _BookingsPageState extends State<BookingsPage> {
  List<Reservation> reservations = [
    // Reservation("Golden Tree", DateTime.now().add(Duration(days: 2)),
    //     DateTime.now(), 250.0),
    // Reservation("Teba Hotel", DateTime.now(), DateTime.now(), 750.0),
    // Reservation("Ain Alwad Hotel", DateTime.now().add(Duration(days: 2)),
    //     DateTime.now(), 190.0),
  ];

  @override
  void initState() {
    reservations.sort((a, b) => a.from.compareTo(b.from));
    super.initState();
  }

  Future <List<Reservation>> getReservations() async {
    List<Reservation> reservationsTemp = [];
    try {
      final email = "ahmad@gmail.com";
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
      } else {
        print('Failed to fetch bookings. Status code: ${response.statusCode}');
      }
    } catch (e) {
      print('Error: $e');
    }

    return reservationsTemp;

  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Column(
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
                    color: Colors.brown,
                    image: DecorationImage(
                      image: AssetImage("assets/reservations.jpg"),
                      fit: BoxFit.cover,
                    ),
                  ),
                  height: 300,
                ),
              ),
              Positioned(
                top: 245,
                left: MediaQuery.of(context).size.width / 2.25,
                child: const Text(
                  "Reservations",
                  style: TextStyle(
                    fontFamily: "Caveat",
                    fontSize: 32.0,
                    letterSpacing: 2.0,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ],
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20.0),
            child: FutureBuilder(
              future: getReservations(),
              builder: (context, snapshot) {
                if(snapshot.connectionState == ConnectionState.done){
                  reservations = snapshot.data!; // TODO
                  return ListView.separated(
                    shrinkWrap: true,
                    itemBuilder: (context, index) =>
                        reservationListTile(context, reservations[index]),
                    separatorBuilder: (context, index) => const SizedBox(height: 10),
                    itemCount: reservations.length,
                  );
                }
                return CircularProgressIndicator();
              },
            )
          )
        ],
      ),
    );
  }
}

// TODO: add reservation ID here to show it on tap in a dialog

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
