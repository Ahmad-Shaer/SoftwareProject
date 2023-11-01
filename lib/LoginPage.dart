import 'package:arrrrrrrrrrrrrrrrra/RegistrationPage.dart';
import 'package:arrrrrrrrrrrrrrrrra/HomePage.dart';
import 'package:arrrrrrrrrrrrrrrrra/ResetPasswordPage.dart'; // Import your
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class LoginPage extends StatefulWidget {
  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginPage> {
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  bool _obscurePassword = true;

  get onJoinUs => null;

  Future<void> login() async {
    final String serverUrl = 'mongodb://localhost:27017/hoteldb'; // Replace with your server's IP address or domain

    final Map<String, String> body = {
      'email': emailController.text,
      'password': passwordController.text,
    };

    final response = await http.post(
      Uri.parse('$serverUrl/api/auth/login'), // Use your actual login route
      body: body,
    );

    if (response.statusCode == 200) {
      // Successful login
      final data = json.decode(response.body);
      final message = data['message'];

      // Implement logic here for a successful login, e.g., navigate to another screen
      // For example:
      Navigator.of(context).pushReplacement(MaterialPageRoute(
        builder: (context) => RegistrationPage(),
      ));
    } else if (response.statusCode == 404) {
      // Handle user not found error
      // Show an error message, e.g., using a Flutter toast or snackbar
      // For example:
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text('User not found. Please check your email.'),
        ),
      );
    } else if (response.statusCode == 401) {
      // Handle incorrect password error
      // Show an error message for incorrect password
      // For example:


      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text('Incorrect password. Please try again.'),
        ),
      );
    } else if (response.statusCode == 500) {
      // Handle server error
      // Show a generic error message for other errors
      // For example:
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text('Server error. Please try again later.'),
        ),
      );
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text('TRYYYYYYYYYYYYYYYYYYYYYYYYY.'),
        ),
      );
      // Handle other status codes if necessary
      // For example, if the server provides additional status codes
    }
  }
  void navigateToRegistrationPage() {
    Navigator.of(context).push(MaterialPageRoute(
      builder: (context) => RegistrationPage(),
    ));
  }

  Future<void> _launchFacebook() async {
    const url = 'https://www.facebook.com/'; // Replace with your Facebook URL
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      throw 'Could not launch $url';
    }
  }

  Future<void> _launchInstagram() async {
    const url = 'https://www.instagram.com/'; // Replace with your Instagram URL
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      throw 'Could not launch $url';
    }
  }

  Future<void> _launchGmail() async {
    const url = 'https://mail.google.com/'; // Replace with your Gmail URL
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      throw 'Could not launch $url';
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blue, // Set the background color to blue
      body: Center(
        child: Card(
          color: Colors.white.withOpacity(0.6), // Transparent white card
          child: Container(
            width: 500, // Set a fixed width
            padding: EdgeInsets.all(16),
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      'Welcome to Travel Nest',
                      style: TextStyle(
                        fontSize: 25, // Smaller font size
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(Icons.hotel, size: 90), // Hotel icon
                    SizedBox(width: 30), // Small space
                  ],
                ),
                SizedBox(height: 16), // Vertical space
                TextField(
                  controller: emailController,
                  decoration: InputDecoration(
                    labelText: 'Email',
                    icon: Icon(Icons.email),
                  ),
                ),

                SizedBox(height: 16), // Vertical space
                TextField(
                  controller: passwordController,
                  decoration: InputDecoration(
                    labelText: 'Password',
                    icon: Icon(Icons.lock),
                    suffixIcon: IconButton(
                      icon: Icon(
                        _obscurePassword
                            ? Icons.visibility
                            : Icons.visibility_off,
                      ),
                      onPressed: () {
                        setState(() {
                          _obscurePassword = !_obscurePassword;
                        });
                      },
                    ),
                  ),
                  obscureText: _obscurePassword,
                ),
                SizedBox(height: 16), // Vertical space
                Row(
                  children: [
                    Spacer(), // Move "Forgot Password" to the right
                    TextButton(
                      onPressed: () {
                        // Navigate to the Reset Password page
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => ResetPasswordPage()),
                        );
                      },
                      child: Text('Forgot Password?'),
                    ),
                  ],
                ),
                ElevatedButton(
                  onPressed: () {
                    // Navigate to the Reset Password page
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => HomePage()),
                    );
                  },
                  child: Text('Login', style: TextStyle(fontSize: 20)),
                ),
                SizedBox(height: 20), // Vertical space

                Container(
                  margin: EdgeInsets.symmetric(vertical: 8),
                  child: Row(
                    children: [
                      Expanded(
                        child: Container(
                          margin: EdgeInsets.only(right: 8),
                          color: Colors.grey, // Color of the line
                          height: 1, // Height of the line
                        ),
                      ),
                      Text(
                        'Join Us with',
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                      Expanded(
                        child: Container(
                          margin: EdgeInsets.only(left: 8),
                          color: Colors.grey, // Color of the line
                          height: 1, // Height of the line
                        ),
                      ),
                    ],
                  ),
                ),

                SizedBox(height: 12), // Vertical space

                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    IconButton(
                      icon: Icon(Icons.email , color: Colors.redAccent),
                      onPressed: _launchGmail,
                      iconSize: 40, // Increase icon size
                    ),
                    SizedBox(width: 8), // Small space
                    IconButton(
                      icon: Icon(Icons.facebook,color: Colors.blueAccent),
                      onPressed: _launchFacebook,
                      iconSize: 40, // Increase icon size
                    ),
                    SizedBox(width: 8), // Small space
                    IconButton(
                      icon: Icon(Icons.camera_alt,color: Colors.red,),
                      onPressed: _launchInstagram,
                      iconSize: 40, // Increase icon size
                    ),
                  ],
                ),
                SizedBox(height: 16), // Vertical space

                /////////

                // Add "Don't have an account yet? Register" text

                InkWell(
                  onTap: navigateToRegistrationPage,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(Icons.person_add, size: 30),
                      AnimatedDefaultTextStyle(
                        duration: Duration(milliseconds: 300),
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                          color: Colors.blue,
                        ),
                        child: Text(" Don't have an account yet? Register"),
                      ),
                    ],
                  ),
                ),
                /////////////////

              ],
            ),
          ),
        ),
      ),
    );
  }
}

void main() => runApp(MaterialApp(home: LoginPage()));
