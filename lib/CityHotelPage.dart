import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';

import 'BookingScreen.dart';
void main() {
  runApp(const CityHotelPage());
}

class CityHotelPage extends StatelessWidget {
  const CityHotelPage({super.key});

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Padding(
            padding: EdgeInsets.all(20.0),
            child: Text(
              'Welcome to City Hotels',
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              AnimatedContainer(
                duration: const Duration(milliseconds: 300),
                width: 150, // Set button width
                height: 50, // Set button height
                child: ElevatedButton(
                  onPressed: () {
                    // Handle Hotels button tap
                  },
                  style: ButtonStyle(
                    backgroundColor: MaterialStateProperty.resolveWith<Color>(
                          (Set<MaterialState> states) {
                        if (states.contains(MaterialState.hovered)) {
                          return Colors.green; // Change color when hovered
                        } else {
                          return Colors.blue; // Default color
                        }
                      },
                    ),
                  ),
                  child: const Text('Hotels'),
                ),
              ),
              AnimatedContainer(
                duration: const Duration(milliseconds: 300),
                width: 150, // Set button width
                height: 50, // Set button height
                child: ElevatedButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => const VisaScreen()),
                    );
                  },
                  style: ButtonStyle(
                    backgroundColor: MaterialStateProperty.resolveWith<Color>(
                          (Set<MaterialState> states) {
                        if (states.contains(MaterialState.hovered)) {
                          return Colors.green; // Change color when hovered
                        } else {
                          return Colors.blue; // Default color
                        }
                      },
                    ),
                  ),
                  child: const Text('Payment'),
                ),
              ),
            ],
          ),
          Expanded(
            child: buildImageSlider(),
          ),
        ],
      ),
    );
  }




  Widget buildImageSlider() {
    List<String> slideImages = [
      'nablus_0.png', // Replace with your image paths
      'nablus_1.png',
      'nablus_2.png',
      'nablus_3.png',
    ];
    List<String> slideDescriptions = [
      'Saleem Afandi Hotel is located in Nablus and offers a fitness centre, garden, a shared lounge and terrace. Each accommodation at this 4-star hotel features city views.', // Replace with your descriptions
      'Featuring free WiFi and a restaurant, Khan Al Wakala Hotel offers accommodation in Nablus.',
      'Located in Nablus, 48 km from Birzeit University, Royal Suites Hotel is a 5-star accommodation featuring a terrace, a bar and a restaurant. This 5-star hotel offers free WiFi, a 24-hour front desk and room service. Some rooms include The accommodation has a balcony with a mountain view.',
      'Al Yasmeen Hotel is located in the center of Nablus and offers free Wi-Fi. This hotel was built to resemble the historic Arab rest houses that once existed on the Silk Road.',
    ];

    return SizedBox(
      width: double.infinity,
      child: CarouselSlider.builder(
        itemCount: slideImages.length,
        options: CarouselOptions(
          height: 400,
          aspectRatio: 9 / 16, // Set aspect ratio for vertical slides
          viewportFraction: 0.8,
          initialPage: 0,
          enableInfiniteScroll: true,
          reverse: false,
         // autoPlay: true,
          //autoPlayInterval: Duration(seconds: 3),
          autoPlayAnimationDuration: const Duration(milliseconds: 800),
          autoPlayCurve: Curves.fastOutSlowIn,
          enlargeCenterPage: true,
          scrollDirection: Axis.vertical, // Set slides to scroll vertically
        ),
        itemBuilder: (BuildContext context, int index, int realIndex) {
          return GestureDetector(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const BookingScreen()), // Replace BookingScreen with your desired screen
              );
            },
            child: Container(
              margin: const EdgeInsets.symmetric(horizontal: 5.0),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(8.0),
                image: DecorationImage(
                  image: AssetImage('assets/${slideImages[index]}'),
                  fit: BoxFit.cover,
                ),
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Container(
                    padding: const EdgeInsets.all(8.0),
                    color: Colors.black.withOpacity(0.5),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text(
                          'Rating: ⭐️⭐️⭐️⭐️⭐️',
                          style: TextStyle(color: Colors.white),
                        ),
                        const SizedBox(height: 5),
                        Text(
                          slideDescriptions[index],
                          style: const TextStyle(color: Colors.white),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
class VisaScreen extends StatelessWidget {
  const VisaScreen({super.key});


  @override
  Widget build(BuildContext context) {
    bool isChecked = true;
    return Scaffold(
      body: Container(
        color: Colors.grey.withOpacity(0.5),
        padding: const EdgeInsets.all(20),
        child: ListView(
          children: [
            const Center(
              child: Text(
                'Credit Card',
                textAlign: TextAlign.center,
                style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
              ),
            ),
            const SizedBox(height: 20),
            const Center(
              child: Icon(
                Icons.credit_card,
                size: 100,
              ),
            ),
            const SizedBox(height: 20),
            TextFormField(
              decoration: const InputDecoration(
                labelText: 'Card Number',
                border: OutlineInputBorder(),
              ),
            ),
            const SizedBox(height: 10),
            TextFormField(
              decoration: const InputDecoration(
                labelText: 'Card Name',
                border: OutlineInputBorder(),
              ),
            ),
            const SizedBox(height: 10),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Expanded(
                  child: TextFormField(
                    decoration: const InputDecoration(
                      labelText: 'Exp Month',
                      border: OutlineInputBorder(),
                    ),
                  ),
                ),
                const SizedBox(width: 10),
                Expanded(
                  child: TextFormField(
                    decoration: const InputDecoration(
                      labelText: 'Exp Year',
                      border: OutlineInputBorder(),
                    ),
                  ),
                ),
                const SizedBox(width: 10),
                Expanded(
                  child: TextFormField(
                    decoration: const InputDecoration(
                      labelText: 'CCN',
                      border: OutlineInputBorder(),
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 20),
            Row(
              children: [

            Checkbox(
            value: isChecked, // Define the initial value
              onChanged: (bool? value) {
                if (value != null) {
                  isChecked = value;
                  if (isChecked) {
                  } else {
                  }
                }
              },
            ),

            const Text('Save Card'),
              ],
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                // Handle payment logic
              },
              child: const Text('PAY'),
            ),
          ],
        ),
      ),
    );
  }
}
