import 'dart:convert';
import 'dart:math';
import '../providers/user_provider.dart';
import 'package:provider/provider.dart';
import 'package:awesome_bottom_bar/awesome_bottom_bar.dart';
import 'package:flutter/material.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import 'package:traveler_nest/model/hotel.dart';
import 'package:syncfusion_flutter_datepicker/datepicker.dart';
import 'package:http/http.dart' as http;
import '../main.dart';
import '../model/room.dart';

class HotelModalSheet extends StatefulWidget {
  final Hotel hotel;
  bool isFavourite;
  HotelModalSheet(this.hotel, {super.key, this.isFavourite = false});

  @override
  State<HotelModalSheet> createState() => _HotelModalSheetState();
}

class _HotelModalSheetState extends State<HotelModalSheet> {
  final controller = PageController(viewportFraction: 1, keepPage: true);
  late final Hotel hotel;
  bool isFavourite = false ;

  @override
  void initState() {
    hotel = widget.hotel;
    isFavourite = widget.isFavourite;
    super.initState();
  }


  void updateFavourite(BuildContext context) async{
    try {
      final email = context.read<UserProvider>().currentUser.email;
      final response = await http.post(
        Uri.parse('http://192.168.1.10:8000/addToFavourites'),
        headers: <String, String>{
          'Content-Type': 'application/json',
        },
        body: json.encode({'email': email,'hotelName': hotel.hotelName}),
      );


      if (response.statusCode == 200) {
        print(json.decode(response.body));
        setState(() {
          isFavourite = !isFavourite;
        });
      } else {
        print('Failed to fetch hotels. Status code: ${response.statusCode}');
      }
    } catch (e) {
      print('Error: $e');
    }
  }

  @override
  Widget build(BuildContext context) {
    final images = List.generate(
      hotel.images!.length,
          (index) => Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(40.0),
        ),
        child: ClipRRect(
          borderRadius: BorderRadius.circular(40.0),
          child: Image.asset(
            hotel.images![index],
            fit: BoxFit.fill,
          ),
        ),
      ),
    );

    return Scaffold(
      extendBody: true,
      backgroundColor: Colors.transparent,
      body: Container(
        decoration: const BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.only(
            topRight: Radius.circular(45),
            topLeft: Radius.circular(45),
          ),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            SizedBox(
              height: 300,
              child: Stack(
                children: [
                  PageView.builder(
                    pageSnapping: true,
                    padEnds: false,
                    controller: controller,
                    itemCount: images.length,
                    itemBuilder: (_, index) {
                      return images[index % images.length];
                    },
                  ),
                  Align(
                    alignment: Alignment.topCenter,
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Container(
                        width: 60,
                        height: 10,
                        decoration: BoxDecoration(
                          color: Colors.white70.withOpacity(0.85),
                          borderRadius: BorderRadius.circular(5.0),
                        ),
                      ),
                    ),
                  ),
                  Positioned(
                    left: 12.0,
                    top: 16.0,
                    child: IconButton(
                      onPressed: () {
                        Navigator.pop(context);
                      },
                      style: IconButton.styleFrom(
                        backgroundColor: Colors.grey.withOpacity(0.65),
                        elevation: 2.0,
                      ),
                      icon: Icon(
                        Icons.close,
                        color: Colors.white.withOpacity(0.7),
                        size: 24.0,
                      ),
                    ),
                  ),
                  Align(
                    alignment: Alignment.bottomCenter,
                    child: Padding(
                      padding: const EdgeInsets.all(12.0),
                      child: SmoothPageIndicator(
                        controller: controller,
                        count: images.length,
                        effect: const ScrollingDotsEffect(
                          dotHeight: 8,
                          dotWidth: 8,
                          dotColor: Colors.white54,
                          activeDotColor: Colors.white,
                        ),
                      ),
                    ),
                  ),
                  Positioned(
                    right: 10.0,
                    top: 16.0,
                    child: IconButton(
                      onPressed: () {
                        updateFavourite(context);
                      },
                      style: IconButton.styleFrom(
                        backgroundColor: Colors.grey.withOpacity(0.65),
                        elevation: 2.0,
                      ),
                      icon: Icon(
                        isFavourite
                            ? Icons.favorite_rounded
                            : Icons.favorite_border_rounded,
                        color: isFavourite
                            ? Colors.redAccent.withOpacity(0.9)
                            : Colors.white.withOpacity(0.7),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 20),
            Expanded(
              child: Padding(
                padding:
                const EdgeInsets.symmetric(vertical: 8.0, horizontal: 20.0),
                child: SingleChildScrollView(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "${hotel.hotelName} Hotel",
                        style: const TextStyle(
                          fontSize: 20.0,
                          fontWeight: FontWeight.w800,
                        ),
                      ),
                      const SizedBox(height: 8),
                      Row(
                        children: [
                          const Icon(
                            Icons.star_rounded,
                            color: Colors.black,
                            size: 32.0,
                          ),
                          const SizedBox(width: 5),
                          Text(
                            hotel.rate.toString(),
                            style: const TextStyle(
                              fontWeight: FontWeight.w600,
                              fontSize: 16.0,
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(height: 15.0),
                      Divider(
                        color: Colors.grey.withOpacity(0.5),
                        height: 2.0,
                      ),
                      const SizedBox(height: 15.0),
                      Text(
                        hotel.city,
                        style: const TextStyle(
                          fontSize: 18.0,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                      Text(
                        hotel.address,
                        style: const TextStyle(
                          fontWeight: FontWeight.w500,
                          color: Colors.grey,
                        ),
                      ),
                      const SizedBox(height: 15.0),
                      Divider(
                        color: Colors.grey.withOpacity(0.5),
                        height: 2.0,
                      ),
                      const SizedBox(height: 15.0),
                      const Text(
                        "Amenities",
                        style: TextStyle(
                          fontSize: 18.0,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                      Wrap(
                        spacing: 4.0,
                        direction: Axis.horizontal,
                        children: hotel.tags != null
                            ? List.generate(
                          hotel.tags!.length,
                              (index) => Chip(
                            padding: const EdgeInsets.symmetric(
                                horizontal: 10.0, vertical: 2),
                            labelPadding: EdgeInsets.zero,
                            elevation: 0,
                            backgroundColor:
                            Colors.grey.withOpacity(0.45),
                            side: const BorderSide(
                              color: Colors.transparent,
                            ),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(24.0),
                            ),
                            label: Text(
                              hotel.tags![index],
                              style: const TextStyle(
                                fontSize: 12.0,
                              ),
                            ),
                          ),
                        )
                            : [
                          const Text(
                            "none",
                            style: TextStyle(
                              fontSize: 16.0,
                              color: Colors.grey,
                            ),
                          )
                        ],
                      ),
                      const SizedBox(height: 15.0),
                      Divider(
                        color: Colors.grey.withOpacity(0.5),
                        height: 2.0,
                      ),
                      const SizedBox(height: 15.0),
                      ...(hotel.features != null
                          ? (List.generate(
                        hotel.features!.length,
                            (index) => Padding(
                          padding:
                          const EdgeInsets.symmetric(vertical: 6.0),
                          child: Row(
                            children: [
                              const Icon(
                                Icons.stars_rounded,
                                color: Colors.black,
                                size: 22.0,
                              ),
                              const SizedBox(width: 8),
                              Text(
                                hotel.features![index],
                                style: const TextStyle(
                                  fontWeight: FontWeight.w500,
                                  fontSize: 15.0,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ))
                          : [
                        const SizedBox(),
                      ]),
                      const SizedBox(height: 80.0),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.only(bottom: 15, right: 20, left: 20),
        child: Container(
          decoration: BoxDecoration(
            color: Theme.of(context)
                .extension<AppColors>()
                ?.accentColor
                .withOpacity(0.9),
            borderRadius: BorderRadius.circular(36.0),
          ),
          child: Padding(
            padding:
            const EdgeInsets.symmetric(horizontal: 20.0, vertical: 10.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    const Text(
                      "1 night:",
                      style: TextStyle(
                        color: Colors.grey,
                      ),
                    ),
                    Text(
                      "₪${hotel.price.round()}",
                      style: const TextStyle(
                        color: Colors.white,
                        fontSize: 18.0,
                      ),
                    )
                  ],
                ),
                ElevatedButton(
                  onPressed: () {
                    showDialog(
                      context: context,
                      useSafeArea: true,
                      builder: (context) => RoomPicker(hotel),
                    );
                  },
                  style:
                  ElevatedButton.styleFrom(backgroundColor: Colors.white),
                  child: const Text(
                    "Book now",
                    style: TextStyle(
                      color: Colors.black,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class RoomPicker extends StatefulWidget {
  Hotel hotel;
  RoomPicker( this.hotel, {super.key});

  @override
  State<RoomPicker> createState() => _RoomPickerState();
}


class _RoomPickerState extends State<RoomPicker> {
  int _selectedIndex = -1;
  late PickerDateRange range;
  int numbersDifference = 1;
  late Hotel hotel;
  List<Room> rooms = [
    Room(numberOfBeds: 3, price: 120.0),
    Room(numberOfBeds: 2, price: 70.0),
    Room(numberOfBeds: 4, price: 112.0),
    Room(numberOfBeds: 2, price: 92.0),
    Room(numberOfBeds: 2, price: 42.0),
  ];
  void bookRoom (BuildContext context)async {
    try {
      final email = context.read<UserProvider>().currentUser.email;
       final hotelName =hotel.hotelName ;
      final from = range.startDate ;
      final to = range.endDate ;
      final cost = rooms[_selectedIndex].price.round() * numbersDifference ;
      print(email + " " +  hotelName + " " + from.toString() + " " + to.toString() + " " + cost.toString());
      final response = await http.post(
        Uri.parse('http://192.168.1.10:8000/bookings'),
        headers: <String, String>{
          'Content-Type': 'application/json',
        },
        body: json.encode({'email': email,'hotelName' : hotelName, 'from' : from.toString(), 'to' : to.toString(), 'cost' : cost.toDouble()}),
      );



        setState(() {
        Navigator.pop(context);
        });

    } catch (e) {
      print('Error: $e');
    }
  }
  @override
  void initState() {
    hotel = widget.hotel;
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(
        horizontal: MediaQuery.of(context).size.width / 20,
        vertical: MediaQuery.of(context).size.height / 12,
      ),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16.0),
      ),
      width: 200,
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: SfDateRangePicker(
              enablePastDates: false,
              allowViewNavigation: true,
              selectionMode: DateRangePickerSelectionMode.range,
              onSelectionChanged: (args) {
                if(args.value != null && args.value.endDate != null && args.value.startDate != null){
                  range = args.value;
                  numbersDifference = max(range.endDate!.difference(range.startDate!).inDays, 1);
                  rooms.shuffle();

                }else {
                  numbersDifference = 1;
                }
                setState(() {
                });

              },
            ),
          ),
          const Divider(),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Center(
                    child: Text(
                      "Available Rooms",
                      style: TextStyle(
                        fontSize: 18.0,
                      ),
                    ),
                  ),
                  const SizedBox(height: 15),
                  Expanded(
                    child: ListView.separated(
                      scrollDirection: Axis.vertical,
                      itemBuilder: (context, index) => GestureDetector(
                        onTap: () {
                          setState(() {
                            _selectedIndex = index;
                          });
                        },
                        child: Container(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 20.0, vertical: 6.0),
                          decoration: BoxDecoration(
                            border: Border.all(
                              color: _selectedIndex == index
                                  ? Colors.purple
                                  : Colors.grey,
                              width: _selectedIndex == index ? 2 : 1,
                            ),
                            borderRadius: BorderRadius.circular(8),
                          ),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Column(
                                children: [
                                  Text("Room ${index + 1}"),
                                  Text(
                                    "${rooms[index].numberOfBeds} beds",
                                    style: TextStyle(color: Colors.grey),
                                  ),
                                ],
                              ),
                              Text("₪${rooms[index].price.round() * numbersDifference}"),
                            ],
                          ),
                        ),
                      ),
                      separatorBuilder: (_, index) =>
                      const SizedBox(height: 15),
                      itemCount: rooms.length,
                    ),
                  ),
                  const SizedBox(height: 15),
                  const Divider(),
                  const SizedBox(height: 5),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      ElevatedButton(
                        onPressed: () {
                          Navigator.pop(context);
                        },
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.transparent,
                          foregroundColor: Colors.transparent,
                          side: const BorderSide(color: Colors.purple),
                          shadowColor: Colors.transparent,
                        ),
                        child: const Text(
                          "cancel",
                          style: TextStyle(color: Colors.purple),
                        ),
                      ),
                      ElevatedButton(
                        onPressed: () {
                          bookRoom(context);
                        },
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.purple,
                        ),
                        child: const Text(
                          "Book Now!",
                          style: TextStyle(color: Colors.white),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
