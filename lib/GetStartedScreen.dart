import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:arrrrrrrrrrrrrrrrra/SplashScreen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: GetStartedScreen(),
    );
  }
}

class GetStartedScreen extends StatefulWidget {
  @override
  _GetStartedScreenState createState() => _GetStartedScreenState();
}

class _GetStartedScreenState extends State<GetStartedScreen> {
  bool buttonClicked = false;
  bool isHovered = false;

  void handleButtonPress() {
    setState(() {
      buttonClicked = true;
      Navigator.of(context).pushReplacement(
        MaterialPageRoute(builder: (context) => SplashScreen()),
      );
    });

    // Navigate to the SplashScreen immediately

  }


  @override
  void initState() {
    super.initState();
    timeDilation = 1.5; // Button animation speed
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          // Background Image
          Container(
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage('assets/getstarted.png'),
                fit: BoxFit.cover,
              ),
            ),
          ),
          // Oval Shaped "Get Started" Button with Wavy Effect
          Align(
            alignment: Alignment.bottomLeft,
            child: AnimatedContainer(
              duration: Duration(seconds: 1),
              curve: Curves.elasticOut,
              height: 70,
              width: buttonClicked ? 200 : 150,
              child: InkWell(
                onHover: (isHovered) {
                  setState(() {
                    this.isHovered = isHovered;
                  });
                },
                onTap: buttonClicked ? null : handleButtonPress,
                child: Container(
                  decoration: BoxDecoration(
                    color: isHovered ? Colors.blueGrey : Colors.blue,
                    borderRadius: BorderRadius.only(
                      topRight: Radius.circular(100),
                      bottomRight: Radius.circular(100),
                    ),
                  ),
                  child: Stack(
                    children: [
                      Center(
                        child: Text(
                          buttonClicked ? 'Getting Started' : 'Get Started',
                          style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                            color: Colors.white,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),

          Align(
            alignment: Alignment.bottomRight,
            child: Stack(
              children: [
                Positioned(
                  right: 20,
                  bottom: 20,
                  child: Image.asset(
                    'assets/logoo.png',
                    width: 30,
                    height: 30,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

// class SplashScreen extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: Container(),
//     );
//   }
// }
