import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'CityHotelPage.dart';

void main() {
  runApp(CityHotelPage());
}

class CityHotelPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: MainPage(),
    );
  }
}

class MainPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
                child: Row(),
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
                'All',
                style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
              ),
            ),
            buildImageSlider(context, 'nab', 5),
            SizedBox(height: 20),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20.0),
              child: Text(
                'Favorites',
                style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
              ),
            ),
            buildImageSlider(context, 'nab', 3),

            SizedBox(height: 20),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20.0),
              child: Text(
                'Most Booked',
                style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
              ),
            ),
            buildImageSlider(context, 'nab', 2),
          ],
        ),
      ),
    );
  }
}

////gold hotel
class Golden_Tree extends StatelessWidget {
  Widget _buildFacilityIcons() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          _buildFacilityIcon(Icons.wifi, 'Wifi'),
          _buildFacilityIcon(Icons.local_parking, 'Parking'),
          _buildFacilityIcon(Icons.restaurant, 'Restaurant'),
          _buildFacilityIcon(Icons.ac_unit, 'Air Conditioning'),
          // _buildFacilityIcon(Icons.wb_sunny, 'Heater'),
          // _buildFacilityIcon(Icons.tv, 'TV'),
          _buildFacilityIcon(Icons.security, 'Security'),
        ],
      ),
    );
  }

  Widget _buildFacilityIcon(IconData icon, String label) {
    return Column(
      children: [
        Icon(icon),
        SizedBox(height: 8),
        Text(label),
      ],
    );
  }

  Widget _buildSectionButtonsRow() {
    return SizedBox(
      height: 40,
      child: ListView(
        scrollDirection: Axis.horizontal,
        children: [
          _buildSectionButton('Overview'),
          _buildSectionButton('Information and prices'),
          _buildSectionButton('Accompanying'),
          _buildSectionButton('Information of interest to you'),
          _buildSectionButton('Guest reviews'),
        ],
      ),
    );
  }

  Widget _buildActionButtons(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          IconButton(
            icon: Icon(Icons.favorite_border),
            onPressed: () {
              // Handle favorite icon tap
            },
          ),
          IconButton(
            icon: Icon(Icons.share),
            onPressed: () {
              // Handle share icon tap
            },
          ),
          ElevatedButton(
            onPressed: () {
              // Navigate to Booking class on 'Book Now' button tap
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => Booking()),
              );
            },
            child: Text('Book Now'),
          ),
        ],
      ),
    );
  }

  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: AppBar(
      //   title: Text(''), // Set the title for this specific hotel page
      // ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: 20),
            _buildSectionButtonsRow(),
            SizedBox(height: 10),
            buildImageSlider(context, 'gold', 3),
            SizedBox(height: 20),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 20.0),
              child: Text(
                'Golden_Tree Hotel',
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
            ),
            SizedBox(height: 15),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 20.0),
              child: Text(
                'Description: ',
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
            ),
            SizedBox(height: 10),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20.0),
              child: Text(
                ' The accommodation is located steps from East Cemetery and'
                    ' 0.1 miles from the city center. Great Mosque of Nablus can be found '
                    '100 feet from the Hotel. You can easily find Herzelia located close by. '
                    'This property is very near to Lev HaMifrats train station.',
                style: TextStyle(fontSize: 14, fontWeight: FontWeight.w100),
              ),
            ),
            SizedBox(height: 15),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20.0),
              child: Text(
                'Facilities',
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
            ),
            SizedBox(height: 15),
            _buildFacilityIcons(),
            SizedBox(height: 20),
            _buildActionButtons(context),
          ],
        ),
      ),
    );
  }

  Widget _buildSectionButton(String title) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8.0),
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          color: Colors.grey,
        ),
        child: Material(
          color: Colors.transparent,
          child: InkWell(
            borderRadius: BorderRadius.circular(20),
            onTap: () {
              // Handle button tap accordingly
            },
            child: Padding(
              padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 16),
              child: Text(
                title,
                style: TextStyle(fontSize: 16),
              ),
            ),
          ),
        ),
      ),
    );
  }
}

////Khan_Alwakala
class Khan_Alwakala extends StatelessWidget {
  Widget _buildFacilityIcons() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          _buildFacilityIcon(Icons.wifi, 'Wifi'),
          // _buildFacilityIcon(Icons.local_parking, 'Parking'),
          _buildFacilityIcon(Icons.restaurant, 'Restaurant'),
          _buildFacilityIcon(Icons.ac_unit, 'Air Conditioning'),
          _buildFacilityIcon(Icons.wb_sunny, 'Heater'),
          //_buildFacilityIcon(Icons.tv, 'TV'),
          _buildFacilityIcon(Icons.security, 'Security'),
        ],
      ),
    );
  }

  Widget _buildFacilityIcon(IconData icon, String label) {
    return Column(
      children: [
        Icon(icon),
        SizedBox(height: 8),
        Text(label),
      ],
    );
  }

  Widget _buildSectionButtonsRow() {
    return SizedBox(
      height: 40,
      child: ListView(
        scrollDirection: Axis.horizontal,
        children: [
          _buildSectionButton('Overview'),
          _buildSectionButton('Information and prices'),
          _buildSectionButton('Accompanying'),
          _buildSectionButton('Information of interest to you'),
          _buildSectionButton('Guest reviews'),
        ],
      ),
    );
  }

  Widget _buildActionButtons(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          IconButton(
            icon: Icon(Icons.favorite_border),
            onPressed: () {
              // Handle favorite icon tap
            },
          ),
          IconButton(
            icon: Icon(Icons.share),
            onPressed: () {
              // Handle share icon tap
            },
          ),
          ElevatedButton(
            onPressed: () {
              // Navigate to Booking class on 'Book Now' button tap
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => Booking()),
              );
            },
            child: Text('Book Now'),
          ),
        ],
      ),
    );
  }

  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: AppBar(
      //   title: Text(''), // Set the title for this specific hotel page
      // ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: 20),
            _buildSectionButtonsRow(),
            SizedBox(height: 10),
            buildImageSlider(context, 'khan', 3),
            SizedBox(height: 20),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 20.0),
              child: Text(
                'Khan_Alwakala Hotel',
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
            ),
            SizedBox(height: 15),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 20.0),
              child: Text(
                'Description: ',
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
            ),
            SizedBox(height: 10),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20.0),
              child: Text(
                ' The accommodation is located steps from East Cemetery and'
                    ' 0.1 miles from the city center. Great Mosque of Nablus can be found '
                    '100 feet from the Hotel. You can easily find Herzelia located close by. '
                    'This property is very near to Lev HaMifrats train station.',
                style: TextStyle(fontSize: 14, fontWeight: FontWeight.w100),
              ),
            ),
            SizedBox(height: 15),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20.0),
              child: Text(
                'Facilities',
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
            ),
            SizedBox(height: 15),
            _buildFacilityIcons(),
            SizedBox(height: 20),
            _buildActionButtons(context),
          ],
        ),
      ),
    );
  }

  Widget _buildSectionButton(String title) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8.0),
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          color: Colors.grey,
        ),
        child: Material(
          color: Colors.transparent,
          child: InkWell(
            borderRadius: BorderRadius.circular(20),
            onTap: () {
              // Handle button tap accordingly
            },
            child: Padding(
              padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 16),
              child: Text(
                title,
                style: TextStyle(fontSize: 16),
              ),
            ),
          ),
        ),
      ),
    );
  }
}

/////Taybeh Golden
class Taybeh_Golden extends StatelessWidget {
  Widget _buildFacilityIcons() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          _buildFacilityIcon(Icons.wifi, 'Wifi'),
          // _buildFacilityIcon(Icons.local_parking, 'Parking'),
          _buildFacilityIcon(Icons.restaurant, 'Restaurant'),
          _buildFacilityIcon(Icons.ac_unit, 'Air Conditioning'),
          _buildFacilityIcon(Icons.wb_sunny, 'Heater'),
          //_buildFacilityIcon(Icons.tv, 'TV'),
          _buildFacilityIcon(Icons.security, 'Security'),
        ],
      ),
    );
  }

  Widget _buildFacilityIcon(IconData icon, String label) {
    return Column(
      children: [
        Icon(icon),
        SizedBox(height: 8),
        Text(label),
      ],
    );
  }

  Widget _buildSectionButtonsRow() {
    return SizedBox(
      height: 40,
      child: ListView(
        scrollDirection: Axis.horizontal,
        children: [
          _buildSectionButton('Overview'),
          _buildSectionButton('Information and prices'),
          _buildSectionButton('Accompanying'),
          _buildSectionButton('Information of interest to you'),
          _buildSectionButton('Guest reviews'),
        ],
      ),
    );
  }

  Widget _buildActionButtons(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          IconButton(
            icon: Icon(Icons.favorite_border),
            onPressed: () {
              // Handle favorite icon tap
            },
          ),
          IconButton(
            icon: Icon(Icons.share),
            onPressed: () {
              // Handle share icon tap
            },
          ),
          ElevatedButton(
            onPressed: () {
              // Navigate to Booking class on 'Book Now' button tap
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => Booking()),
              );
            },
            child: Text('Book Now'),
          ),
        ],
      ),
    );
  }

  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: AppBar(
      //   title: Text(''), // Set the title for this specific hotel page
      // ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: 20),
            _buildSectionButtonsRow(),
            SizedBox(height: 10),
            buildImageSlider(context, 'teba', 3),
            SizedBox(height: 20),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 20.0),
              child: Text(
                'Taybeh Golden Hotel',
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
            ),
            SizedBox(height: 15),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 20.0),
              child: Text(
                'Description: ',
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
            ),
            SizedBox(height: 10),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20.0),
              child: Text(
                ' The accommodation is located steps from East Cemetery and'
                    ' 0.1 miles from the city center. Great Mosque of Nablus can be found '
                    '100 feet from the Hotel. You can easily find Herzelia located close by. '
                    'This property is very near to Lev HaMifrats train station.',
                style: TextStyle(fontSize: 14, fontWeight: FontWeight.w100),
              ),
            ),
            SizedBox(height: 15),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20.0),
              child: Text(
                'Facilities',
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
            ),
            SizedBox(height: 15),
            _buildFacilityIcons(),
            SizedBox(height: 20),
            _buildActionButtons(context),
          ],
        ),
      ),
    );
  }

  Widget _buildSectionButton(String title) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8.0),
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          color: Colors.grey,
        ),
        child: Material(
          color: Colors.transparent,
          child: InkWell(
            borderRadius: BorderRadius.circular(20),
            onTap: () {
              // Handle button tap accordingly
            },
            child: Padding(
              padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 16),
              child: Text(
                title,
                style: TextStyle(fontSize: 16),
              ),
            ),
          ),
        ),
      ),
    );
  }
}

//////////
////Al Yasmeen Hotel
class Al_Yasmeen_Hotel extends StatelessWidget {
  Widget _buildFacilityIcons() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          _buildFacilityIcon(Icons.wifi, 'Wifi'),
          // _buildFacilityIcon(Icons.local_parking, 'Parking'),
          _buildFacilityIcon(Icons.restaurant, 'Restaurant'),
          _buildFacilityIcon(Icons.ac_unit, 'Air Conditioning'),
          _buildFacilityIcon(Icons.wb_sunny, 'Heater'),
          //_buildFacilityIcon(Icons.tv, 'TV'),
          _buildFacilityIcon(Icons.security, 'Security'),
        ],
      ),
    );
  }

  Widget _buildFacilityIcon(IconData icon, String label) {
    return Column(
      children: [
        Icon(icon),
        SizedBox(height: 8),
        Text(label),
      ],
    );
  }

  Widget _buildSectionButtonsRow() {
    return SizedBox(
      height: 40,
      child: ListView(
        scrollDirection: Axis.horizontal,
        children: [
          _buildSectionButton('Overview'),
          _buildSectionButton('Information and prices'),
          _buildSectionButton('Accompanying'),
          _buildSectionButton('Information of interest to you'),
          _buildSectionButton('Guest reviews'),
        ],
      ),
    );
  }

  Widget _buildActionButtons(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          IconButton(
            icon: Icon(Icons.favorite_border),
            onPressed: () {
              // Handle favorite icon tap
            },
          ),
          IconButton(
            icon: Icon(Icons.share),
            onPressed: () {
              // Handle share icon tap
            },
          ),
          ElevatedButton(
            onPressed: () {
              // Navigate to Booking class on 'Book Now' button tap
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => Booking()),
              );
            },
            child: Text('Book Now'),
          ),
        ],
      ),
    );
  }

  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: AppBar(
      //   title: Text(''), // Set the title for this specific hotel page
      // ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: 20),
            _buildSectionButtonsRow(),
            SizedBox(height: 10),
            buildImageSlider(context, 'yass', 3),
            SizedBox(height: 20),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 20.0),
              child: Text(
                'Al Yasmeen Hotel ',
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
            ),
            SizedBox(height: 15),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 20.0),
              child: Text(
                'Description: ',
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
            ),
            SizedBox(height: 10),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20.0),
              child: Text(
                ' The accommodation is located steps from East Cemetery and'
                    ' 0.1 miles from the city center. Great Mosque of Nablus can be found '
                    '100 feet from the Hotel. You can easily find Herzelia located close by. '
                    'This property is very near to Lev HaMifrats train station.',
                style: TextStyle(fontSize: 14, fontWeight: FontWeight.w100),
              ),
            ),
            SizedBox(height: 15),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20.0),
              child: Text(
                'Facilities',
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
            ),
            SizedBox(height: 15),
            _buildFacilityIcons(),
            SizedBox(height: 20),
            _buildActionButtons(context),
          ],
        ),
      ),
    );
  }

  Widget _buildSectionButton(String title) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8.0),
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          color: Colors.grey,
        ),
        child: Material(
          color: Colors.transparent,
          child: InkWell(
            borderRadius: BorderRadius.circular(20),
            onTap: () {
              // Handle button tap accordingly
            },
            child: Padding(
              padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 16),
              child: Text(
                title,
                style: TextStyle(fontSize: 16),
              ),
            ),
          ),
        ),
      ),
    );
  }
}

/////Yildiz Hotel
class Yildiz_Hotel extends StatelessWidget {
  Widget _buildFacilityIcons() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          _buildFacilityIcon(Icons.wifi, 'Wifi'),
          // _buildFacilityIcon(Icons.local_parking, 'Parking'),
          _buildFacilityIcon(Icons.restaurant, 'Restaurant'),
          _buildFacilityIcon(Icons.ac_unit, 'Air Conditioning'),
          _buildFacilityIcon(Icons.wb_sunny, 'Heater'),
          //_buildFacilityIcon(Icons.tv, 'TV'),
          _buildFacilityIcon(Icons.security, 'Security'),
        ],
      ),
    );
  }

  Widget _buildFacilityIcon(IconData icon, String label) {
    return Column(
      children: [
        Icon(icon),
        SizedBox(height: 8),
        Text(label),
      ],
    );
  }

  Widget _buildSectionButtonsRow() {
    return SizedBox(
      height: 40,
      child: ListView(
        scrollDirection: Axis.horizontal,
        children: [
          _buildSectionButton('Overview'),
          _buildSectionButton('Information and prices'),
          _buildSectionButton('Accompanying'),
          _buildSectionButton('Information of interest to you'),
          _buildSectionButton('Guest reviews'),
        ],
      ),
    );
  }

  Widget _buildActionButtons(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          IconButton(
            icon: Icon(Icons.favorite_border),
            onPressed: () {
              // Handle favorite icon tap
            },
          ),
          IconButton(
            icon: Icon(Icons.share),
            onPressed: () {
              // Handle share icon tap
            },
          ),
          ElevatedButton(
            onPressed: () {
              // Navigate to Booking class on 'Book Now' button tap
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => Booking()),
              );
            },
            child: Text('Book Now'),
          ),
        ],
      ),
    );
  }

  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: AppBar(
      //   title: Text(''), // Set the title for this specific hotel page
      // ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: 20),
            _buildSectionButtonsRow(),
            SizedBox(height: 10),
            buildImageSlider(context, 'yldz', 4),
            SizedBox(height: 20),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 20.0),
              child: Text(
                'Yildiz Hotel ',
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
            ),
            SizedBox(height: 15),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 20.0),
              child: Text(
                'Description: ',
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
            ),
            SizedBox(height: 10),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20.0),
              child: Text(
                ' The accommodation is located steps from East Cemetery and'
                    ' 0.1 miles from the city center. Great Mosque of Nablus can be found '
                    '100 feet from the Hotel. You can easily find Herzelia located close by. '
                    'This property is very near to Lev HaMifrats train station.',
                style: TextStyle(fontSize: 14, fontWeight: FontWeight.w100),
              ),
            ),
            SizedBox(height: 15),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20.0),
              child: Text(
                'Facilities',
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
            ),
            SizedBox(height: 15),
            _buildFacilityIcons(),
            SizedBox(height: 20),
            _buildActionButtons(context),
          ],
        ),
      ),
    );
  }

  Widget _buildSectionButton(String title) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8.0),
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          color: Colors.grey,
        ),
        child: Material(
          color: Colors.transparent,
          child: InkWell(
            borderRadius: BorderRadius.circular(20),
            onTap: () {
              // Handle button tap accordingly
            },
            child: Padding(
              padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 16),
              child: Text(
                title,
                style: TextStyle(fontSize: 16),
              ),
            ),
          ),
        ),
      ),
    );
  }
}

////////slides
Widget buildImageSlider(BuildContext context, String category, int count) {
  Map<String, String> slideTexts = {
    'nab_0.png': 'Welcome to Golden Tree Hotel',
    'nab_1.png': 'Welcome to Khan Alwakala Hotel',
    'nab_2.png': 'Welcome to Taybeh Golden Hotel',
    'nab_3.png': 'Welcome to Al Yasmeen Hotel',
    'nab_4.png': 'Welcome to Yildiz Hotel',

    // Add mappings for each image accordingly
  };
  List<bool> isFavorite = List.generate(5, (index) => false);

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
            (index) => InkWell(
          onTap: () {
            if (index == 0 && category == 'nab') {
              // Check if it's the Nablus slide
              Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) =>
                        Golden_Tree()), // Navigate to SpecificHotelPage
              );
            } else if (index == 1 && category == 'nab') {
              // Check if it's the Nablus slide
              Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) =>
                        Khan_Alwakala()), // Navigate to SpecificHotelPage
              );
            } else if (index == 2 && category == 'nab') {
              // Check if it's the Nablus slide
              Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) =>
                        Taybeh_Golden()), // Navigate to SpecificHotelPage
              );
            } else if (index == 3 && category == 'nab') {
              // Check if it's the Nablus slide
              Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) =>
                        Al_Yasmeen_Hotel()), // Navigate to SpecificHotelPage
              );
            } else if (index == 4 && category == 'nab') {
              // Check if it's the Nablus slide
              Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) =>
                        Golden_Tree()), // Navigate to SpecificHotelPage
              );
            }
          },
          child: Stack(
            children: [
              Container(
                margin: EdgeInsets.all(5.0),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(8.0),
                  image: DecorationImage(
                    image: AssetImage(
                        'assets/hotels/nablus/${category}_$index.png'),
                    fit: BoxFit.cover,
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
    ),
  );
}

class Booking extends StatefulWidget {
  @override
  _BookingState createState() => _BookingState();
}

class _BookingState extends State<Booking> {
  DateTime? checkInDate;
  DateTime? checkOutDate;
  int selectedPerson = 1;
  int selectedBedrooms = 1;

  Widget _buildDateField({
    required DateTime? date,
    required Function(DateTime?) onDateChanged,
  }) {
    return Expanded(
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: TextField(
          readOnly: true,
          controller: TextEditingController(
            text: date != null ? DateFormat.yMd().format(date) : '',
          ),
          onTap: () async {
            DateTime? picked = await showDatePicker(
              context: context,
              initialDate: date ?? DateTime.now(),
              firstDate: DateTime.now(),
              lastDate: DateTime(2050),
            );
            if (picked != null && picked != date) {
              onDateChanged(picked);
            }
          },
          decoration: InputDecoration(
            labelText: 'Select Date',
            border: OutlineInputBorder(),
          ),
        ),
      ),
    );
  }

  Widget _buildDropDownButton({
    required String label,
    required List<String> items,
    required Function(String) onChanged,
  }) {
    return Expanded(
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: DropdownButtonFormField<String>(
          decoration: InputDecoration(
            labelText: label,
            border: OutlineInputBorder(),
          ),
          value: items[selectedPerson - 1],
          items: items.map((item) {
            return DropdownMenuItem<String>(
              value: item,
              child: Text(item),
            );
          }).toList(),
          onChanged: (value) {
            onChanged(value!);
          },
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Booking'),
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Card(
              margin: EdgeInsets.all(16.0),
              child: Column(
                children: [
                  Image.asset('assets/bord1.png'), // Replace with your image
                  Row(
                    children: [
                      _buildDateField(
                        date: checkInDate,
                        onDateChanged: (value) {
                          setState(() {
                            checkInDate = value;
                          });
                        },
                      ),
                      _buildDateField(
                        date: checkOutDate,
                        onDateChanged: (value) {
                          setState(() {
                            checkOutDate = value;
                          });
                        },
                      ),
                    ],
                  ),
                  Row(
                    children: [
                      _buildDropDownButton(
                        label: 'Person',
                        items: List.generate(
                            10, (index) => (index + 1).toString()),
                        onChanged: (value) {
                          setState(() {
                            selectedPerson = int.parse(value);
                          });
                        },
                      ),
                      _buildDropDownButton(
                        label: 'Number of bedrooms',
                        items: ['1', '2', '3'],
                        onChanged: (value) {
                          setState(() {
                            selectedBedrooms = int.parse(value);
                          });
                        },
                      ),
                    ],
                  ),
                  ElevatedButton(
                    onPressed: () {
                      // Handle search button tap
                    },
                    child: Text('Search'),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
