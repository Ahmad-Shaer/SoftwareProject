import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'CityHotelPage.dart';
void main() {
  runApp(const HotelBookingApp());
}

class HotelBookingApp extends StatelessWidget {
  const HotelBookingApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: MainPage(),
    );
  }
}

class MainPage extends StatelessWidget {
  const MainPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Hello User!'),
      ),
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: <Widget>[
            const ListTile(
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
            const SizedBox(height: 40),
            ListTile(
              leading: const Icon(Icons.home),
              title: const Text('Home'),
              onTap: () {
                // Handle Home menu item tap
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
              leading: const Icon(Icons.event),
              title: const Text('My Booking'),
              onTap: () {
                // Handle My Booking menu item tap
              },
            ),
            ListTile(
              leading: const Icon(Icons.person),
              title: const Text('Profile'),
              onTap: () {
                // Handle Profile menu item tap
              },
            ),
            ListTile(
              leading: const Icon(Icons.lock),
              title: const Text('Change Password'),
              onTap: () {
                // Handle Change Password menu item tap
              },
            ),
            ListTile(
              leading: const Icon(Icons.settings
              ),
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
              leading: const Icon(Icons.feedback),
              title: const Text('Feedback'),
              onTap: () {
                // Handle Feedback menu item tap
              },
            ),

            ListTile(
              leading: const Icon(Icons.logout),
              title: const Text(' Log Out'),
              onTap: () {
                // Handle About App menu item tap
              },
            ),

          ],
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: InkWell(
                onTap: () {
                  Scaffold.of(context).openDrawer(); // Opens the drawer
                },
                child: const Row(
                ),
              ),
            ),
            //SizedBox(height: 20),
            const SizedBox(height: 20),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20.0),
              child: SizedBox(
                height: 40,
                child: Row(
                  children: [
                    Expanded(
                      child: TextFormField(
                        decoration: const InputDecoration(
                          labelText: 'Search',
                          border: OutlineInputBorder(),
                        ),
                      ),
                    ),
                    const SizedBox(width: 10),
                    ElevatedButton(
                      onPressed: () {
                        // Add functionality for the "Go" button
                      },
                      child: const Text('Go'),
                    ),
                  ],
                ),
              ),
            ),
            const SizedBox(height: 20),

            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 20.0),
              child: Text(
                'Cities',
                style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
              ),
            ),
            buildImageSlider(context, 'city', 12),
            const SizedBox(height: 20),
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 20.0),
              child: Text(
                'Favorites',
                style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
              ),
            ),
            buildImageSlider(context, 'favorite', 3),
            const SizedBox(height: 20),
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 20.0),
              child: Text(
                'Most Booked',
                style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
              ),
            ),
            buildImageSlider(context, 'booked', 2),


          ],
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
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
      ),
    );
  }
}
////////slides
Widget buildImageSlider(BuildContext context, String category, int count) {
  Map<String, String> slideTexts = {
    'city_0.png': 'Welcome to Al-Bireh',
    'city_1.png': 'Welcome to Bethlehem',
    'city_2.png': 'Welcome to Hebron',
    'city_3.png': 'Welcome to Jenin',
    'city_4.png': 'Welcome to Jerusalem',
    'city_5.png': 'Welcome to Jericho',
    'city_6.png': 'Welcome to Nablus',
    'city_7.png': 'Welcome to Qalqilya',
    'city_8.png': 'Welcome to Ramallah',
    'city_9.png': 'Welcome to Salfit',
    'city_10.png': 'Welcome to Tubas',
    'city_11.png': 'Welcome to Tulkarm',
    // Add mappings for each image accordingly
  };

  return SizedBox(
    width: 450,
    child: CarouselSlider(
      options: CarouselOptions(
        height: 200,
        aspectRatio: 16 / 9,
        viewportFraction: 0.8,
        initialPage: 0,
        enableInfiniteScroll: true,
        reverse: false,
        autoPlay: false,
        autoPlayAnimationDuration: const Duration(milliseconds: 800),
        autoPlayCurve: Curves.fastOutSlowIn,
        enlargeCenterPage: true,
        scrollDirection: Axis.horizontal,
      ),
      items: List.generate(
        count,
            (index) => InkWell(
          onTap: () {
            if (index == 6) { // Check if it's the Nablus slide
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const CityHotelPage()), // Ensure correct widget name
              );
            }
          },
          child: Stack(
            children: [
              Container(
                margin: const EdgeInsets.all(5.0),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(8.0),
                  image: DecorationImage(
                    image: AssetImage('assets/${category}_$index.png'),
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              Positioned(
                bottom: 8.0,
                left: 8.0,
                child: Text(
                  slideTexts['${category}_$index.png'] ?? '',
                  style: const TextStyle(
                    color: Colors.white,
                    fontSize: 16.0,
                    fontWeight: FontWeight.bold,
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
