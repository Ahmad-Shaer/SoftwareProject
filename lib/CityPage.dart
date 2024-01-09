import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'CityHotelPage.dart';

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
      //  backgroundColor: Colors.blue.shade50, // Set the background color here

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
              leading: Icon(Icons.settings
              ),
              title: Text('Setting'),
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

            ListTile(
              leading: Icon(Icons.logout),
              title: Text(' Log Out'),
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
                child: Row(
                ),
              ),
            ),
            //SizedBox(height: 20),
            SizedBox(height: 20),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20.0),
              child: SizedBox(
                height: 40,
                child: Row(
                  children: [
                    Expanded(
                      child: TextFormField(
                        decoration: InputDecoration(
                          labelText: 'Search',
                          border: OutlineInputBorder(),
                        ),
                      ),
                    ),
                    SizedBox(width: 10),
                    ElevatedButton(
                      onPressed: () {
                        // Add functionality for the "Go" button
                      },
                      child: Text('Go'),
                    ),
                  ],
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
            buildImageSlider(context, 'city', 12),
            SizedBox(height: 20),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20.0),
              child: Text(
                'Most Visited',
                style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
              ),
            ),
            buildImageSlider(context, 'favorite', 4),
            SizedBox(height: 20),
            // Padding(
            //   padding: const EdgeInsets.symmetric(horizontal: 20.0),
            //   child: Text(
            //     'Most Visited',
            //     style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            //   ),
            // ),
            // buildImageSlider(context, 'booked', 2),


          ],
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: [
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

  List<bool> isFavorite = List.generate(12, (index) => false);

  return Container(
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
        autoPlayAnimationDuration: Duration(milliseconds: 800),
        autoPlayCurve: Curves.fastOutSlowIn,
        enlargeCenterPage: true,
        scrollDirection: Axis.horizontal,
      ),
      items: List.generate(
        count,
            (index) => Stack(
          children: [
            InkWell(
              onTap: () {
                if (index >= 0 && index < 12) {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => CityHotelPage()),
                  );
                }
              },
              child: Container(
                margin: EdgeInsets.all(5.0),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(8.0),
                  image: DecorationImage(
                    image: AssetImage('assets/citypage/${category}_$index.png'),
                    fit: BoxFit.cover,
                  ),
                ),
              ),
            ),
            Positioned(
              bottom: 8.0,
              left: 8.0,
              child: Row(
                children: [
                  IconButton(
                    icon: Icon(
                      Icons.favorite,
                      color: isFavorite[index] ? Colors.red : Colors.grey,
                    ),
                    onPressed: () {
                      isFavorite[index] = !isFavorite[index];
                    },
                  ),
                  SizedBox(width: 8),
                  Text(
                    slideTexts['${category}_$index.png'] ?? '',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 16.0,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    ),
  );
}


