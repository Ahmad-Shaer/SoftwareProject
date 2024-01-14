import 'package:awesome_bottom_bar/awesome_bottom_bar.dart';
import 'package:flutter/material.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import 'package:traveler_nest/model/hotel.dart';

import '../main.dart';

class HotelModalSheet extends StatefulWidget {
  Hotel hotel;
  HotelModalSheet(this.hotel, {super.key});

  @override
  State<HotelModalSheet> createState() => _HotelModalSheetState();
}

class _HotelModalSheetState extends State<HotelModalSheet> {
  final controller = PageController(viewportFraction: 1, keepPage: true);
  late final Hotel hotel;
  @override
  void initState() {
    hotel = widget.hotel;
    super.initState();
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
      backgroundColor: Colors.transparent,
      extendBody: true,
      body: SingleChildScrollView(
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
                        // TODO: favorite this hotel
                      },
                      style: IconButton.styleFrom(
                        backgroundColor: Colors.grey.withOpacity(0.65),
                        elevation: 2.0,
                      ),
                      icon: Icon(
                        Icons.favorite_border_rounded,
                        color: Colors.white.withOpacity(0.7),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 20),
            Padding(
              padding:
                  const EdgeInsets.symmetric(vertical: 8.0, horizontal: 20.0),
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
                      const SizedBox(width: 3.0),
                      Text(
                        '(${hotel.numberOfRates} reviews)',
                        style: const TextStyle(
                          fontWeight: FontWeight.w600,
                          fontSize: 16.0,
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
                              backgroundColor: Colors.grey.withOpacity(0.2),
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
                            padding: const EdgeInsets.symmetric(vertical: 6.0),
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
                ],
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.only(bottom: 15, right: 20, left: 20),
        child: Container(
          decoration: BoxDecoration(
            color: Theme.of(context).extension<AppColors>()?.accentColor,
            borderRadius: BorderRadius.circular(36.0),
          ),
          child: Padding(
            padding:
                const EdgeInsets.symmetric(horizontal: 20.0, vertical: 12.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Text(
                      "1 night:",
                      style: TextStyle(
                        color: Colors.grey,
                      ),
                    ),
                    Text(
                      "₪${hotel.price.round()}",
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 18.0,
                      ),
                    )
                  ],
                ),
                ElevatedButton(
                  onPressed: () {},
                  child: Text(
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
