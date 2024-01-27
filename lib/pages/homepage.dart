import 'dart:ui';

import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:traveler_nest/model/hotel.dart';
import 'package:traveler_nest/pages/notifications_page.dart';

import '../main.dart';
import '../widgets/custom_cards.dart';
import '../widgets/search_modal_sheet.dart';

class HomePage extends StatelessWidget {
  final void Function() goToProfilePage;
  const HomePage(this.goToProfilePage, {super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).extension<AppColors>()?.lightColor,
      appBar: AppBar(
        surfaceTintColor: Colors.white,
        backgroundColor: Colors.transparent,
        foregroundColor: Colors.transparent,
        flexibleSpace: ClipRRect(
          borderRadius: const BorderRadius.only(
            bottomLeft: Radius.circular(42),
            bottomRight: Radius.circular(42),
          ),
          child: Container(
            decoration: BoxDecoration(
              color: Colors.transparent,
              image: DecorationImage(
                image: const AssetImage("assets/nablus_bg.jpg"),
                fit: BoxFit.fill,
                colorFilter: ColorFilter.mode(
                  Colors.black.withOpacity(0.38),
                  BlendMode.darken,
                ),
              ),
            ),
          ),
        ),
        title: const Row(
          children: [
            Icon(
              Icons.location_pin,
              color: Colors.white,
            ),
            SizedBox(
              width: 10,
            ),
            Text(
              'Nablus',
              style: TextStyle(
                fontSize: 18.0,
                color: Colors.white,
              ),
            ),
          ],
        ),
        actions: [
          IconButton(
            onPressed: () {
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
                builder: (BuildContext context) => const NotificationsPage(),
              );
            },
            padding: EdgeInsets.zero,
            icon: const Icon(
              Icons.notifications_none_rounded,
              color: Colors.white,
            ),
          ),
          IconButton(
            padding: EdgeInsets.zero,
            onPressed: () {
              goToProfilePage();
            },
            icon: const Icon(
              Icons.account_circle_outlined,
              color: Colors.white,
            ),
          ),
        ],
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.only(
            bottomLeft: Radius.circular(32),
            bottomRight: Radius.circular(32),
          ),
        ),
        bottom: PreferredSize(
          preferredSize: const Size.fromHeight(220),
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  "Hey, Ahmad! Tell us where you want to go",
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 28.0,
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                GestureDetector(
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
                      builder: (BuildContext context) => SearchModalSheet(),
                    );
                  },
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(24.0),
                    child: BackdropFilter(
                      filter: ImageFilter.blur(sigmaX: 10.0, sigmaY: 10.0),
                      child: Container(
                        padding: const EdgeInsets.symmetric(
                          horizontal: 20.0,
                          vertical: 8.0,
                        ),
                        color: Colors.grey.withOpacity(0.2),
                        child: Row(
                          children: [
                            const Icon(
                              Icons.search_rounded,
                              color: Colors.white,
                              size: 22.0,
                            ),
                            const SizedBox(
                              width: 15,
                            ),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                const Text(
                                  "Search places",
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 18.0,
                                  ),
                                ),
                                RichText(
                                  text: const TextSpan(
                                    children: [
                                      TextSpan(
                                        text: "Date range",
                                        style: TextStyle(color: Colors.grey),
                                      ),
                                      TextSpan(
                                        text: " · ",
                                        style: TextStyle(
                                          color: Colors.white70,
                                          letterSpacing: 1.0,
                                          fontWeight: FontWeight.w900,
                                        ),
                                      ),
                                      TextSpan(
                                        text: "Number of guests",
                                        style: TextStyle(color: Colors.grey),
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            )
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
                const SizedBox(
                  height: 25,
                ),
              ],
            ),
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: 20),
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 20.0, vertical: 4.0),
              child: Text(
                "The most relevant",
                style: TextStyle(fontSize: 18.0, fontWeight: FontWeight.bold),
              ),
            ),
            Container(
              width: double.infinity,
              child: CarouselSlider(
                options: CarouselOptions(
                  height: 320,
                  aspectRatio: 16 / 9,
                  viewportFraction: 0.82,
                  initialPage: 0,
                  enableInfiniteScroll: true,
                  autoPlayInterval: const Duration(seconds: 4),
                  reverse: false,
                  autoPlay: true,
                  autoPlayAnimationDuration: const Duration(milliseconds: 1200),
                  autoPlayCurve: Curves.ease,
                  enlargeCenterPage: true,
                  scrollDirection: Axis.horizontal,
                  pageSnapping: true,
                  pauseAutoPlayOnTouch: true,
                  animateToClosest: true,
                  enlargeFactor: 0.4,
                  enlargeStrategy: CenterPageEnlargeStrategy.zoom,
                ),
                items: [
                  HomepageHotelCard(
                    Hotel(
                      imageSrcPath: 'assets/hotels/nablus/gold_0.png',
                      hotelName: "The Golden Tree",
                      availableRooms: ["4 guests", "2 bedrooms", "2 beds"],
                      city: "Nablus",
                      address: "Beit-Wazan",
                      price: 316,
                      rate: 4.96,
                      numberOfRates: 218,
                    ),
                  ),
                  HomepageHotelCard(
                    Hotel(
                      imageSrcPath: 'assets/hotels/nablus/khan_0.png',
                      hotelName: "The Khan Hotel",
                      availableRooms: ["2 yards", "2 bedrooms", "1 pool"],
                      city: "Jenin",
                      address: "Beit-Wazan",
                      price: 510,
                      rate: 4.82,
                      numberOfRates: 137,
                    ),
                  ),
                  HomepageHotelCard(
                    Hotel(
                      imageSrcPath: 'assets/hotels/nablus/teba_0.png',
                      hotelName: "The Teba",
                      availableRooms: ["2 yards", "2 bedrooms", "1 pool"],
                      city: "Rammallah",
                      address: "Beit-Wazan",
                      price: 750,
                      rate: 4.21,
                      numberOfRates: 56,
                    ),
                  ),
                  HomepageHotelCard(
                    Hotel(
                      imageSrcPath: 'assets/hotels/nablus/yass_0.png',
                      hotelName: "The Teba",
                      availableRooms: ["2 yards", "2 bathrooms", "1 pool"],
                      city: "Rammallah",
                      price: 190,
                      rate: 3.89,
                      address: "Beit-Wazan",
                      numberOfRates: 164,
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 20),
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 20.0, vertical: 4.0),
              child: Text(
                "Discover new places",
                style: TextStyle(fontSize: 18.0, fontWeight: FontWeight.bold),
              ),
            ),
            Padding(
              padding:
                  const EdgeInsets.symmetric(horizontal: 20.0, vertical: 4.0),
              child: GridView(
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  crossAxisSpacing: 10.0,
                ),
                children: [
                  HomepageCityCard(cityName: 'jerusalem'),
                  HomepageCityCard(cityName: 'nablus'),
                  HomepageCityCard(cityName: 'jericho'),
                  HomepageCityCard(cityName: 'ramallah'),
                  HomepageCityCard(cityName: 'qalqilya'),
                  HomepageCityCard(cityName: 'hebron'),
                  HomepageCityCard(cityName: 'tulkarem'),
                  HomepageCityCard(cityName: 'jenin'),
                  HomepageCityCard(
                      cityName: 'al-birah', cityImageName: "al_birah"),
                  HomepageCityCard(cityName: 'tubas'),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
