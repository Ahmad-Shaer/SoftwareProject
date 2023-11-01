import 'package:arrrrrrrrrrrrrrrrra/RegistrationPage.dart';
import 'package:arrrrrrrrrrrrrrrrra/RegistrationPage.dart';
import 'package:arrrrrrrrrrrrrrrrra/UserProfilePage.dart'; // Import your
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class UserProfilePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('User Profile'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              Icons.person, // User icon
              size: 100.0,
              color: Colors.blue,
            ),
            Text(
              'User Name', // Replace with the actual user's name
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            // Add more user-related information here
          ],
        ),
      ),
    );
  }
}
