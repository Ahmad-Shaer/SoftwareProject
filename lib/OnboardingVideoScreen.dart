import 'package:flutter/material.dart';
import 'login_screen.dart';
import 'signup_screen.dart';

class OnboardingVideoScreen extends StatefulWidget {
  @override
  _OnboardingVideoScreenState createState() => _OnboardingVideoScreenState();
}

class _OnboardingVideoScreenState extends State<OnboardingVideoScreen> {
  Color buttonColorLogin = Colors.lightBlueAccent;
  Color buttonColorSignUp = Colors.lightBlueAccent;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        fit: StackFit.expand,
        children: [
          Image.asset(
            'assets/welcom.gif',
            fit: BoxFit.cover,
          ),
          _buildOverlay(context),
        ],
      ),
    );
  }

  Widget _buildOverlay(BuildContext context) {
    return Center(
      child: Container(
        width: 500,
        height: 400,
        decoration: BoxDecoration(
          color: Colors.black.withOpacity(0.6),
          borderRadius: BorderRadius.circular(20),
        ),
        padding: EdgeInsets.all(20.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                CircleAvatar(
                  radius: 40,
                  backgroundImage: AssetImage('assets/logo2.png'),
                ),
                SizedBox(width: 20.0),
                Text(
                  'TRAVEL NEST',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 28.0,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
            SizedBox(height: 20.0),
            Divider(
              height: 30,
              color: Colors.white,
              thickness: 0.9,
            ),
            SizedBox(height: 20.0),
            _buildAnimatedButton(context, 'Login', LoginScreen(), buttonColorLogin),
            SizedBox(height: 10),
            _buildAnimatedButton(context, 'Sign Up', signup_screen(), buttonColorSignUp),
          ],
        ),
      ),
    );
  }

  Widget _buildAnimatedButton(BuildContext context, String text, Widget page, Color buttonColor) {
    return TweenAnimationBuilder<double>(
      tween: Tween<double>(begin: 0, end: 1),
      duration: Duration(milliseconds: 500),
      builder: (context, double value, child) {
        return MouseRegion(
          onEnter: (_) {
            setState(() {
              if (text == 'Login') {
                buttonColorLogin = Colors.grey;
              } else {
                buttonColorSignUp = Colors.grey;
              }
            });
          },
          onExit: (_) {
            setState(() {
              if (text == 'Login') {
                buttonColorLogin = Colors.lightBlueAccent;
              } else {
                buttonColorSignUp = Colors.lightBlueAccent;
              }
            });
          },
          child: GestureDetector(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => page),
              );
            },
            child: AnimatedContainer(
              duration: Duration(milliseconds: 300),
              width: 200,
              height: 50,
              decoration: BoxDecoration(
                color: buttonColor,
                borderRadius: BorderRadius.circular(25 * value),
              ),
              alignment: Alignment.center,
              child: Text(
                text,
                style: TextStyle(fontSize: 20, color: Colors.white),
              ),
            ),
          ),
        );
      },
    );
  }
}

void main() {
  runApp(MaterialApp(
    home: OnboardingVideoScreen(),
  ));
}
