import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: HomePage(),
    );
  }
}

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Menu'),
        // actions: [
        //   IconButton(
        //     icon: Icon(Icons.menu), // Add a menu icon button
        //     onPressed: () {
        //       // Open the navigation menu or navigate to a menu page
        //     },
        //   ),
        // ],
      ),
      body: Center(
        child: Container(
          width: double.infinity, // Set the width of the container
          height: 2000,
          color: Colors.blue, // Set background color with opacity (0.5 for 50% opacity)
          child: Column(
            children: [
              SizedBox(height: 50),
              // Use a Row to group two buttons in one row
              CustomRow(
                children: [
                  InkWell(
                    onTap: () {
                      // navigateToPage(context, FlightsPage());
                    },
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(
                          Icons.menu_rounded,
                          size: 40,

                        ),
                        SizedBox(width: 10),
                        Text(
                          'Welcome to the main page',
                          style: TextStyle(fontSize: 14),
                        ),
                      ],
                    ),
                  ),
                ],
              ),

          Divider( // Add a separator line
            color: Colors.grey,
            height: 1,
            thickness: 1,
          ),
              CustomRow(
                children: [
                  CustomButton(
                    icon: Icons.person,
                    text: 'My Profile',
                    onPressed: () {
                      // navigateToPage(context, MyProfilePage());
                    },
                  ),
                  CustomButton(
                    icon: Icons.hotel,
                    text: 'Hotels',
                    onPressed: () {
                      // navigateToPage(context, HotelsPage());
                    },
                  ),
                ],
              ),
              CustomRow(
                children: [
                  CustomButton(
                    icon: Icons.flight,
                    text: 'Flights',
                    onPressed: () {
                      // navigateToPage(context, FlightsPage());
                    },
                  ),
                  CustomButton(
                    icon: Icons.book,
                    text: 'My Booking',
                    onPressed: () {
                      // navigateToPage(context, MyBookingPage());
                    },
                  ),
                ],
              ),
              CustomRow(
                children: [
                  CustomButton(
                    icon: Icons.image,
                    text: 'Gallery',
                    onPressed: () {
                      // navigateToPage(context, GalleryPage());
                    },
                  ),
                  CustomButton(
                    icon: Icons.local_offer,
                    text: 'Special Offer',
                    onPressed: () {
                      // navigateToPage(context, SpecialOfferPage());
                    },
                  ),
                ],
              ),
              CustomRow(
                children: [
                  CustomButton(
                    icon: Icons.location_on,
                    text: 'Destination',
                    onPressed: () {
                      // navigateToPage(context, Destination());
                    },
                  ),
                  CustomButton(
                    icon: Icons.logout,
                    text: 'Logout',
                    onPressed: () {
                      // navigateToPage(context, LogoutPage());
                    },
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  //0

  // ...

  void navigateToPage(BuildContext context, Widget page) {
    Navigator.of(context).push(
      MaterialPageRoute(
        builder: (context) => page,
      ),
    );
  }
}

class CustomRow extends StatelessWidget {
  final List<Widget> children;

  CustomRow({required this.children});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white.withOpacity(0.6), // Transparent white card
      padding: EdgeInsets.all(16), // Add padding for spacing
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: children,
      ),
    );
  }
}

class CustomButton extends StatefulWidget {
  final IconData icon;
  final String text;
  final VoidCallback onPressed;

  CustomButton({
    required this.icon,
    required this.text,
    required this.onPressed,
  });

  @override
  _CustomButtonState createState() => _CustomButtonState();
}

class _CustomButtonState extends State<CustomButton> {
  bool isHovered = false;

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      onEnter: (event) {
        setState(() {
          isHovered = true;
        });
      },
      onExit: (event) {
        setState(() {
          isHovered = false;
        });
      },
      child: InkWell(
        onTap: widget.onPressed,
        child: Column(
          children: [
            Icon(
              widget.icon,
              size: 40,
              color: isHovered ? Colors.red : Colors.black, // Change color on hover
            ),
            SizedBox(height: 10),
            Text(
              widget.text,
              style: TextStyle(fontSize: 14),
            ),
          ],
        ),
      ),
    );
  }
}

// Define your page classes here...
