import 'package:flutter/material.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:arrrrrrrrrrrrrrrrra/LoginPage.dart';
import 'package:arrrrrrrrrrrrrrrrra/RegistrationPage.dart';


void main() {
  runApp(MyApp());
}
class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: SplashScreen(),
    );
  }
}

class SplashScreen extends StatefulWidget {
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  int currentPage = 0;
  List<String> imagePaths = [
    'assets/image1.png', // Replace with your image paths
    'assets/image2.png',
    'assets/image3.png',
  ];

  bool isLoginButtonHovered = false;
  bool isJoinUsButtonHovered = false;

  void nextPage() {
    setState(() {
      currentPage = (currentPage + 1) % imagePaths.length;
    });
  }

  void onJoinUs() {
    Navigator.of(context).push(
      MaterialPageRoute(
        builder: (context) => RegistrationPage(),
      ),
    );
  }

  void onLogin() {
    Navigator.of(context).push(
      MaterialPageRoute(
        builder: (context) => LoginPage(),
      ),
    );
  }



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.transparent, // Set the background color to transparent
      body: Container(
        //color: Colors.blue, // Background color for the page
        child: Column(
          children: [
            // Full-width Image in Oval Shape with Fade Animation
            GestureDetector(
              onTap: nextPage,
              child: AnimatedSwitcher(
                duration: Duration(seconds: 1), // Animation duration
                child: ClipOval(
                  key: ValueKey<int>(currentPage), // Key to identify the child
                  child: Image.asset(
                    imagePaths[currentPage],
                    fit: BoxFit.cover,
                    width: 500, // Adjust the image size as needed
                    height: 500, // Adjust the image size as needed
                  ),
                ),
              ),
            ),

            // "Join Us" and "Login" buttons with animation and oval shape
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                MouseRegion(
                  onEnter: (_) {
                    setState(() {
                      isJoinUsButtonHovered = true;
                    });
                  },
                  onExit: (_) {
                    setState(() {
                      isJoinUsButtonHovered = false;
                    });
                  },
                  child: GestureDetector(
                    onTap: onJoinUs,
                    child: ClipOval(
                      child: AnimatedContainer(
                        duration: Duration(seconds: 1),
                        curve: Curves.elasticOut,
                        height: 70,
                        width: 200,
                        decoration: BoxDecoration(
                          color: isJoinUsButtonHovered
                              ? Colors.blueGrey
                              : Colors.blue, // Change color when not hovered
                        ),
                        child: Center(
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Icon(
                                Icons.how_to_reg,
                                color: Colors.white,
                              ),
                              SizedBox(width: 10),
                              Text(
                                'Join Us',
                                style: TextStyle(
                                  fontSize: 24,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.white,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
                SizedBox(width: 20), // Add spacing between the buttons
                MouseRegion(
                  onEnter: (_) {
                    setState(() {
                      isLoginButtonHovered = true;
                    });
                  },
                  onExit: (_) {
                    setState(() {
                      isLoginButtonHovered = false;
                    });
                  },
                  child: GestureDetector(
                    onTap: onLogin,
                    child: ClipOval(
                      child: AnimatedContainer(
                        duration: Duration(seconds: 1),
                        curve: Curves.elasticOut,
                        height: 70,
                        width: 200,
                        decoration: BoxDecoration(
                          color: isLoginButtonHovered
                              ? Colors.blueGrey
                              : Colors.blue, // Change color when not hovered
                        ),
                        child: Center(
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Icon(
                                Icons.login,
                                color: Colors.white,
                              ),
                              SizedBox(width: 10),
                              Text(
                                'Login',
                                style: TextStyle(
                                  fontSize: 24,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.white,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}


