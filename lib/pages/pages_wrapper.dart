import 'package:awesome_bottom_bar/awesome_bottom_bar.dart';
import 'package:flutter/material.dart';

import 'package:traveler_nest/pages/homepage.dart';
import 'package:traveler_nest/pages/profile_page.dart';
import 'package:traveler_nest/pages/sign_up_page.dart';

import '../main.dart';
import '../model/hotel.dart';
import '../widgets/modal_sheets.dart';
import 'my_bookings.dart';

enum _SelectedTab { home, calender, history, search, profile }

class PagesWrapper extends StatefulWidget {
  const PagesWrapper({super.key});

  @override
  State<PagesWrapper> createState() => _PagesWrapperState();
}

class _PagesWrapperState extends State<PagesWrapper> {
  var _selectedTab = _SelectedTab.home;

  void _handleIndexChanged(int i) {
    setState(() {
      _selectedTab = _SelectedTab.values[i];
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBody: true,
      resizeToAvoidBottomInset: true,
      drawer: Drawer(
        child: SafeArea(
          child: ListView(
            padding: EdgeInsets.zero,
            children: <Widget>[
              const ListTile(
                title: Row(
                  children: [
                    CircleAvatar(
                      backgroundImage: AssetImage('assets/city_0.png'),
                    ),
                    SizedBox(width: 30),
                    Text(
                      'Hello User',
                      style: TextStyle(fontSize: 18),
                    ),
                  ],
                ),
              ),
              // DrawerHeader(
              ListTile(
                leading: const Icon(Icons.person),
                title: const Text('Profile'),
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const UserProfilePage()),
                  );
                },
              ),
              ListTile(
                leading: const Icon(Icons.event),
                title: const Text('My Booking'),
                onTap: () {
                  Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(builder: (context) => const myBookings()),
                  );
                },
              ),
              ListTile(
                leading: const Icon(Icons.favorite),
                title: const Text('Favorite Booking'),
                onTap: () {
                  // Handle Favorite Booking menu item tap
                },
              ),

              ListTile(
                leading: const Icon(Icons.settings),
                title: const Text('Setting'),
                onTap: () {
                  // Handle Change Password menu item tap
                },
              ),

              ListTile(
                leading: const Icon(Icons.info),
                title: const Text('About App'),
                onTap: () {
                  // Handle About App menu item tap
                },
              ),
              ListTile(
                leading: const Icon(Icons.logout),
                title: const Text(' Log Out'),
                onTap: () {
                  // Navigate to the login screen when Log Out is pressed
                  Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const TravelNestApp()),
                  );
                },
              ),
            ],
          ),
        ),
      ),
      body: PageView(
        physics: const NeverScrollableScrollPhysics(),
        children: [
          HomePage(),
          UserProfilePage(),
        ],
      ),
      bottomNavigationBar: Container(
        padding: const EdgeInsets.only(bottom: 15, right: 20, left: 20),
        child: BottomBarFloating(
          backgroundColor: Theme.of(context)
              .extension<AppColors>()!
              .accentColor
              .withOpacity(0.88),
          color: Colors.white60,
          colorSelected: Colors.white,
          indexSelected: _SelectedTab.values.indexOf(_selectedTab),
          blur: 2,
          paddingVertical: 16,
          pad: 3,
          iconSize: 18.0,
          borderRadius: BorderRadius.circular(45.0),
          onTap: (index) => _handleIndexChanged(index),
          items: const [
            TabItem(
              icon: Icons.home,
              title: 'home',
            ),
            TabItem(
              icon: Icons.calendar_month_rounded,
              title: 'calender',
            ),
            TabItem(
              icon: Icons.book_rounded,
              title: 'bookings',
            ),
            TabItem(
              icon: Icons.search_rounded,
              title: 'search',
            ),
            TabItem(
              icon: Icons.account_circle_rounded,
              title: 'profile',
            ),
          ],
        ),
      ),
    );
  }
}
