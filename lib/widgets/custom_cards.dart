import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:traveler_nest/model/hotel.dart';
import 'package:traveler_nest/widgets/hotel_modal_sheets.dart';
import 'package:traveler_nest/widgets/search_modal_sheet.dart';

import '../main.dart';

class HomepageHotelCard extends StatelessWidget {
  Hotel hotel;
  bool isFavourite;
  HomepageHotelCard(this.hotel, {super.key, this.isFavourite = false});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        showModalBottomSheet(
            context: context,
            isScrollControlled: true,
            elevation: 4,
            enableDrag: true,
            isDismissible: true,
            useSafeArea: true,
            builder: (BuildContext context) {
              return HotelModalSheet(
                hotel,
                isFavourite: isFavourite,
              );
            });
      },
      child: Card(
        elevation: 4.0,
        color: Colors.white,
        shape:
            RoundedRectangleBorder(borderRadius: BorderRadius.circular(16.0)),
        surfaceTintColor: Colors.white,
        child: Column(
          children: [
            Stack(
              children: [
                SizedBox(
                  height: 200.0,
                  width: double.infinity,
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(16.0),
                    child: Image.asset(
                      hotel.imageSrcPath,
                      fit: BoxFit.fill,
                    ),
                  ),
                ),
                Positioned(
                  right: 8.0,
                  top: 10.0,
                  child: IconButton(
                    onPressed: () {
                      // TODO: favorite this hotel
                    },
                    style: IconButton.styleFrom(
                      backgroundColor: Theme.of(context)
                          .extension<AppColors>()
                          ?.accentColor
                          .withOpacity(0.65),
                      elevation: 4.0,
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
                )
              ],
            ),
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "${hotel.hotelName} Hotel",
                        style: const TextStyle(
                          fontSize: 16.0,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Container(
                        child: Row(
                          children: [
                            const Icon(
                              Icons.star_rounded,
                              color: Colors.amber,
                            ),
                            const SizedBox(width: 5),
                            Text(
                              hotel.rate.toString(),
                              style: const TextStyle(
                                fontWeight: FontWeight.w600,
                              ),
                            ),

                          ],
                        ),
                      )
                    ],
                  ),
                  const SizedBox(height: 10.0),
                  RichText(
                    text: TextSpan(
                      style:
                          const TextStyle(color: Colors.grey, fontSize: 12.0),
                      children: List.generate(
                        hotel.availableRooms.length,
                        (index) {
                          return index == hotel.availableRooms.length - 1
                              ? TextSpan(
                                  text: hotel.availableRooms[index],
                                )
                              : TextSpan(
                                  children: [
                                    TextSpan(text: hotel.availableRooms[index]),
                                    const TextSpan(
                                      text: " · ",
                                      style: TextStyle(
                                        color: Colors.black45,
                                        letterSpacing: 1.0,
                                        fontWeight: FontWeight.w900,
                                      ),
                                    ),
                                  ],
                                );
                        },
                      ),
                    ),
                  ),
                  const SizedBox(height: 8.0),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        hotel.city,
                        style: const TextStyle(
                          fontWeight: FontWeight.w800,
                          fontSize: 14.0,
                        ),
                      ),
                      Text(
                        '₪${hotel.price.round()} night',
                        style: const TextStyle(
                          fontWeight: FontWeight.w800,
                          fontSize: 12.0,
                        ),
                      ),
                    ],
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class HomepageCityCard extends StatelessWidget {
  String cityName;
  String cityImageName;
  HomepageCityCard(
      {super.key, required this.cityName, this.cityImageName = ''});

  @override
  Widget build(BuildContext context) {
    if (cityImageName.isEmpty) cityImageName = cityName.toLowerCase();
    return GestureDetector(
      onTap: () {
        showModalBottomSheet(
          context: context,
          isScrollControlled: true,
          elevation: 4,
          enableDrag: true,
          isDismissible: true,
          useSafeArea: true,
          backgroundColor: Colors.white,
          shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.only(
              topRight: Radius.circular(40),
              topLeft: Radius.circular(40),
            ),
          ),
          builder: (BuildContext context) => SearchModalSheet(
            tags: ["${cityName[0].toUpperCase()}${cityName.substring(1)}"],
          ),
        );
      },
      child: Card(
        elevation: 4,
        color: Colors.transparent,
        child: Stack(
          children: [
            SizedBox(
              height: double.infinity,
              width: double.infinity,
              child: ClipRRect(
                borderRadius: BorderRadius.circular(16.0),
                child: Image.asset(
                  'assets/cities/${cityImageName.toLowerCase()}.jpg',
                  fit: BoxFit.cover,
                ),
              ),
            ),
            Positioned(
              bottom: 0,
              left: 0,
              right: 0,
              child: Container(
                height: 40,
                decoration: BoxDecoration(
                  color: Theme.of(context)
                      .extension<AppColors>()
                      ?.accentColor
                      .withOpacity(0.55),
                  borderRadius: const BorderRadius.only(
                      bottomLeft: Radius.circular(20.0),
                      bottomRight: Radius.circular(20.0)),
                ),
                child: Center(
                  child: Text(
                    cityName.toUpperCase(),
                    style: const TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                      letterSpacing: 2.0,
                    ),
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
