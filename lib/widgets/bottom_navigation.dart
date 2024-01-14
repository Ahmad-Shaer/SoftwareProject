import 'package:flutter/material.dart';

import '../CityPage.dart';


Widget customBottomNavBar(BuildContext context) {
  return BottomNavigationBar(
    items: const [
      BottomNavigationBarItem(
        icon: Icon(Icons.home),
        label: 'Home',
      ),
      BottomNavigationBarItem(
        icon: Icon(Icons.book),
        label: 'My Booking',
      ),
      BottomNavigationBarItem(
        icon: Icon(Icons.notifications),
        label: 'Notification',
      ),
      BottomNavigationBarItem(
        icon: Icon(Icons.search),
        label: 'Search',
      ),
      BottomNavigationBarItem(
        icon: Icon(Icons.chat),
        label: 'Chat',
      ),
    ],
    type: BottomNavigationBarType.fixed,
    onTap: (index) {
      if (index == 0) {
        // Navigate to the main screen (main.dart)
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(builder: (context) => HotelBookingApp()),
        );
      } else if (index == 1) {
        // Handle other navigation items if needed
      }
    },
  );
}