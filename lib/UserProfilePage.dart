import 'package:flutter/material.dart';
import 'CityPage.dart';
class UserProfilePage extends StatelessWidget {
  const UserProfilePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false, // Set this to false to hide the debug banner
      home: Scaffold(
        appBar: null,
        body: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const CircleAvatar(
                radius: 50,
                backgroundImage: AssetImage('assets/logo1.png'),
              ),
              const SizedBox(height: 20),
              const Text(
                'User Name',
                style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 10),
              const Text(
                'useremail@example.com',
                style: TextStyle(fontSize: 16, color: Colors.grey),
              ),
              const SizedBox(height: 20),
              ElevatedButton(
                onPressed: () {
                  // Handle edit profile action
                },
                child: const Text('Edit Profile'),
              ),
              const SizedBox(height: 10),
              ElevatedButton(
                onPressed: () {
                  // Handle change password action
                },
                child: const Text('Change Password'),
              ),
              // Add more buttons for other actions if needed
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
        ),
      ),
    );
  }
}
