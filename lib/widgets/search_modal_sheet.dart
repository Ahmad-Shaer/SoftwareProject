import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:traveler_nest/widgets/custom_dialog.dart';
import 'package:provider/provider.dart';
import 'package:traveler_nest/providers/user_provider.dart';
import '../main.dart';
import '../model/hotel.dart';
import 'custom_cards.dart';
import 'package:http/http.dart' as http;

class SearchModalSheet extends StatefulWidget {
  List<String>? tags;
  SearchModalSheet({super.key, this.tags});

  @override
  State<SearchModalSheet> createState() => _SearchModalSheetState();
}

class _SearchModalSheetState extends State<SearchModalSheet> {
  List<String> tags = [];
  RangeValues range = const RangeValues(0, 2000);
  RangeValues rateRange = const RangeValues(1, 5);

  late bool isCollected;


  List<Hotel> hotels = [];
  late List<Hotel> selected = [];


  Future<List<Hotel>> fetchHotels() async {
    List<Hotel> hotels = [];
    try {
      final response = await http.post(
        Uri.parse('http://192.168.1.10:8000/hotel/all'),
        headers: <String, String>{
          'Content-Type': 'application/json',
        },
      );

      if (response.statusCode == 200) {
        List<dynamic> hotelList = json.decode(response.body);
        for (var hotelData in hotelList) {
          Hotel hotel = Hotel.fromJSON(json.encode(hotelData));
          hotels.add(hotel);
        }
      } else {
        print('Failed to fetch hotels. Status code: ${response.statusCode}');
      }
    } catch (e) {
      print('Error: $e');
    }

    return hotels;


  }

  void fillHotelsArray() async {
    hotels = await fetchHotels();
    selected = hotels;
    setState(() {
      isCollected = true;
      if (widget.tags != null && widget.tags!.isNotEmpty) {
        tags = widget.tags!;
        filterTags();
      }
    });
  }




  void search(String name) {
    setState(() {
      selected = selected
          .where((obj) => obj.hotelName
              .toLowerCase()
              .replaceAll("hotel", "")
              .contains(name.toLowerCase()))
          .toList();
    });
  }

  void filterCity(String cityName) {
    setState(() {
      selected = selected
          .where((obj) =>
              obj.city.toLowerCase().contains(cityName.trim().toLowerCase()))
          .toList();
    });
  }

  void filterPrice() {
    setState(() {
      selected = selected
          .where((obj) => (obj.price >= range.start && obj.price <= range.end))
          .toList();
    });
  }

  void filterRate() {
    setState(() {
      selected = selected
          .where((obj) =>
              (obj.rate >= rateRange.start && obj.rate <= rateRange.end))
          .toList();
    });
  }

  void filterTags() {
    RegExp cityRegex = RegExp(r'\w+');
    RegExp rangeRegex = RegExp(r'from ₪\d+ up to ₪\d+');
    RegExp rateRegex = RegExp(r'rated between ★\d+\.\d+ and ★\d+\.\d+');
    selected = hotels;
    tags.forEach((String element) {
      if (rateRegex.hasMatch(element)) {
        filterRate();
      } else if (rangeRegex.hasMatch(element)) {
        filterPrice();
      } else if (cityRegex.hasMatch(element)) {
        filterCity(element);
      }
    });
  }



  @override
  void initState() {
    isCollected = false;
    fillHotelsArray();


    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBody: true,
      backgroundColor: Colors.transparent, // change to transparent
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
            height: 80,
            child: Stack(
              children: [
                Padding(
                  padding: const EdgeInsets.only(top: 8.0),
                  child: Align(
                    alignment: Alignment.topCenter,
                    child: Container(
                      height: 8,
                      width: 60,
                      decoration: BoxDecoration(
                        color: Theme.of(context)
                            .extension<AppColors>()
                            ?.accentColor
                            .withOpacity(0.7),
                        borderRadius: BorderRadius.circular(4.0),
                      ),
                    ),
                  ),
                ),
                Positioned(
                  top: 30,
                  left: 20,
                  child: IconButton(
                    icon: Icon(
                      Icons.close_rounded,
                      size: 28.0,
                      color: Theme.of(context)
                          .extension<AppColors>()
                          ?.accentColor
                          .withOpacity(0.9),
                    ),
                    onPressed: () {
                      Navigator.pop(context);
                    },
                  ),
                ),
                Positioned(
                  right: 20,
                  top: 30,
                  child: IconButton(
                    icon: Icon(
                      Icons.filter_alt,
                      size: 28.0,
                      color: Theme.of(context)
                          .extension<AppColors>()
                          ?.accentColor
                          .withOpacity(0.9),
                    ),
                    onPressed: () async {
                      List vals = await showFilterDialog(context);
                      if (!vals.isEmpty) {
                        tags.clear();
                        selected = hotels;
                        tags.add(vals[0]);

                        range = vals[1];
                        String price =
                            "from ₪${range.start.round()} up to ₪${range.end.round()}";
                        tags.add(price);

                        rateRange = vals[2];
                        String rate =
                            "rated between ★${rateRange.start} and ★${rateRange.end}";
                        tags.add(rate);

                        filterTags();
                      }
                    },
                  ),
                ),
                const Padding(
                  padding: EdgeInsets.only(top: 40.0),
                  child: Align(
                    alignment: Alignment.center,
                    child: Text(
                      "Search",
                      style: TextStyle(
                        fontWeight: FontWeight.w600,
                        fontSize: 20.0,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(height: 30),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20.0),
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 12.0),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(30.0),
              ),
              child: TextField(
                cursorColor: Colors.black,
                style: const TextStyle(
                  color: Colors.black,
                ),
                decoration: const InputDecoration(
                  hintText: 'Search for Hotel ...',
                  icon: Icon(
                    Icons.search_rounded,
                    color: Colors.black,
                    size: 26.0,
                  ),
                  focusColor: Colors.black,
                  focusedBorder:
                      OutlineInputBorder(borderSide: BorderSide.none),
                  border: OutlineInputBorder(
                    borderSide: BorderSide.none,
                  ),
                ),
                onChanged: search,
              ),
            ),
          ),
          const SizedBox(height: 6.0),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20.0),
            child: Wrap(
                spacing: 4.0,
                direction: Axis.horizontal,
                alignment: WrapAlignment.start,
                children: List.generate(
                  tags.length,
                  (index) => FilterChip(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 10.0, vertical: 2),
                    labelPadding: EdgeInsets.zero,
                    elevation: 0,
                    backgroundColor: Colors.white,
                    side: const BorderSide(
                      color: Colors.transparent,
                    ),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(24.0),
                    ),
                    label: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        const Icon(
                          Icons.close_rounded,
                          color: Colors.black,
                          size: 18,
                        ),
                        const SizedBox(width: 5),
                        Text(
                          tags[index],
                          style: const TextStyle(
                            fontSize: 12.0,
                          ),
                        ),
                      ],
                    ),
                    onSelected: (bool value) {
                      setState(() {
                        tags.removeAt(index);
                        filterTags();
                      });
                    },
                  ),
                )),
          ),
          const SizedBox(height: 10.0),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20.0),
              child: isCollected ?  ListView.separated(
              scrollDirection: Axis.vertical,
              shrinkWrap: true,
              itemBuilder: (context, index) {
                return HomepageHotelCard(selected[index]);
              },
              separatorBuilder: (context, index) =>
              const SizedBox(height: 25),
              itemCount: selected.length,
            ) : SizedBox(),
            ),
          ),
        ],
      ),
    );
  }
}
