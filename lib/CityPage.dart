import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(HotelBookingApp());
}

class HotelBookingApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: MainPage(),
    );
  }
}

class MainPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Hello User!'),
      ),
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: <Widget>[
            ListTile(
              title: Row(
                children: [
                  CircleAvatar(
                    backgroundImage: AssetImage('assets/city_0.png'),
                  ),
                  SizedBox(width:30),
                  Text(
                    'Hello User',
                    style: TextStyle(fontSize: 18),
                  ),
                ],
              ),
            ),
            // DrawerHeader(
            SizedBox(height: 40),
            ListTile(
              leading: Icon(Icons.home),
              title: Text('Home'),
              onTap: () {
                // Handle Home menu item tap
              },
            ),
            ListTile(
              leading: Icon(Icons.favorite),
              title: Text('Favorite Booking'),
              onTap: () {
                // Handle Favorite Booking menu item tap
              },
            ),
            ListTile(
              leading: Icon(Icons.event),
              title: Text('My Booking'),
              onTap: () {
                // Handle My Booking menu item tap
              },
            ),
            ListTile(
              leading: Icon(Icons.person),
              title: Text('Profile'),
              onTap: () {
                // Handle Profile menu item tap
              },
            ),
            ListTile(
              leading: Icon(Icons.lock),
              title: Text('Change Password'),
              onTap: () {
                // Handle Change Password menu item tap
              },
            ),
            ListTile(
              leading: Icon(Icons.info),
              title: Text('About App'),
              onTap: () {
                // Handle About App menu item tap
              },
            ),
            ListTile(
              leading: Icon(Icons.feedback),
              title: Text('Feedback'),
              onTap: () {
                // Handle Feedback menu item tap
              },
            ),
          ],
        ),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: InkWell(
              onTap: () {
                Scaffold.of(context).openDrawer(); // Opens the drawer
              },
              child: Row(

              ),
            ),
          ),
          SizedBox(height: 20),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20.0),
            child: Text(
              'Cities',
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
          ),
          buildImageSlider('city', 12),
          SizedBox(height: 20),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20.0),
            child: Text(
              'Favorites',
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
          ),
          buildImageSlider('favorite', 3),
          SizedBox(height: 20),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20.0),
            child: Text(
              'Most Booked',
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
          ),
          buildImageSlider('booked', 2),
        ],
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.book),
            label: 'Booking',
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
      ),
    );
  }
}
////////slides
Widget buildImageSlider(String category, int count) {
  return CarouselSlider(
    options: CarouselOptions(
      height: 100,
      aspectRatio: 16 / 9,
      viewportFraction: 0.8,
      initialPage: 0,
      enableInfiniteScroll: true,
      reverse: false,
      autoPlay: true,
      autoPlayInterval: Duration(seconds: 3),
      autoPlayAnimationDuration: Duration(milliseconds: 800),
      autoPlayCurve: Curves.fastOutSlowIn,
      enlargeCenterPage: true,
      scrollDirection: Axis.horizontal,
    ),
    items: List.generate(
      count,
          (index) => Container(
        margin: EdgeInsets.all(5.0),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(8.0),
          image: DecorationImage(
            image: AssetImage('assets/${category}_$index.png'), // Corrected interpolation
            fit: BoxFit.cover,
          ),
        ),
      ),
    ),
  );
}
