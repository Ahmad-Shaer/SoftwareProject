import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'dart:async';
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:traveler_nest/main.dart';
import 'login_page.dart';

class SignupPage extends StatelessWidget {
  final TextEditingController usernameController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController confirmPasswordController = TextEditingController();
  final TextEditingController countryController = TextEditingController();
  final TextEditingController cityController = TextEditingController();
  final TextEditingController phoneNumberController = TextEditingController();

  SignupPage({super.key});

  Future<void> signUp(BuildContext context) async {
    final String username = usernameController.text;
    final String email = emailController.text;
    final String password = passwordController.text;
    final String confirmPassword = confirmPasswordController.text;
    final String country = countryController.text;
    final String city = cityController.text;
    final String phoneNumber = phoneNumberController.text;

    if (username.isEmpty ||
        email.isEmpty ||
        password.isEmpty ||
        confirmPassword.isEmpty ||
        country.isEmpty ||
        city.isEmpty ||
        phoneNumber.isEmpty) {
      // Fields are empty, show a pop-up
      showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: const Text('Empty Fields'),
            content: const Text('Please fill in all fields.'),
            actions: <Widget>[
              TextButton(
                onPressed: () {
                  Navigator.of(context).pop();
                },
                child: const Text('OK'),
              ),
            ],
          );
        },
      );
      return;
    }

    // Regular expression for validating an Email
    final emailRegExp = RegExp(r"^[a-zA-Z0-9]+@[a-zA-Z.]+$");

    if (!emailRegExp.hasMatch(email)) {
      // Invalid email format, show a pop-up
      showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: const Text('Invalid Email'),
            content: const Text('Please enter a valid email address.'),
            actions: <Widget>[
              TextButton(
                onPressed: () {
                  Navigator.of(context).pop();
                },
                child: const Text('OK'),
              ),
            ],
          );
        },
      );
      return;
    }

    if (password != confirmPassword) {
      // Passwords do not match, show a pop-up
      showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: const Text('Password Mismatch'),
            content: const Text('Please check your password and confirm password.'),
            actions: <Widget>[
              TextButton(
                onPressed: () {
                  Navigator.of(context).pop();
                },
                child: const Text('OK'),
              ),
            ],
          );
        },
      );
      return;
    }

    final response = await http.post(

      Uri.parse("http://192.168.1.15:8000/user/signup"),

      headers: <String, String>{
        'Content-Type': 'application/json',
      },
      body: jsonEncode(<String, String>{
        'username': username,
        'email': email,
        'password': password,
        'country': country,
        'city': city,
        'phoneNumber': phoneNumber,
      }),
    );

    if (response.statusCode == 201) {
      // User signed up successfully
      showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: const Text('Registration Successful'),
            content: const Text('You have successfully registered.'),
            actions: <Widget>[
              TextButton(
                onPressed: () {
                  Navigator.of(context).pop(); // Close the dialog
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => const LoginPage()),
                  ); // Navigate to login screen
                },
                child: const Text('OK'),
              ),
            ],
          );
        },
      );
    } else {
      // Failed to sign up user, handle this case
      print('Failed to sign up user. Error: ${response.body}');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(

      body: Container(
        padding: const EdgeInsets.only(top: 100), // Adjust the top padding as needed
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage('assets/travel.jpg'),
            fit: BoxFit.cover,
          ),
        ),
        child: Center(
          child: Container(
            alignment: Alignment.topLeft,
            width: 350,
            height: 850,
            padding: const EdgeInsets.all(20.0),
            decoration: BoxDecoration(
              color: Colors.white.withOpacity(0.7),
              borderRadius: BorderRadius.circular(12),
            ),
            child: SingleChildScrollView(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Text(
                    'START NOW!',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: 32,
                      fontWeight: FontWeight.bold,
                      letterSpacing: 4.0,
                      color: Theme.of(context).extension<AppColors>()?.primaryColor,
                    ),
                  ),
                  const SizedBox(height: 12),
                  _buildInputField(Icons.person, 'User Name', controller: usernameController),
                  _buildInputField(Icons.email, 'Email', controller: emailController),
                  _buildInputField(Icons.lock, 'Password', isPassword: true, controller: passwordController),
                  _buildInputField(Icons.lock, 'Confirm Password', isPassword: true, controller: confirmPasswordController),
                  _buildInputField(Icons.location_on, 'Country', controller: countryController),
                  _buildInputField(Icons.location_city, 'City', controller: cityController),
                  _buildInputField(Icons.phone, 'Phone Number', controller: phoneNumberController),
                  const SizedBox(height: 8),
                  ElevatedButton(
                    onPressed: () async {

                      await signUp(context);
                    },
                    style: ElevatedButton.styleFrom(
                        backgroundColor:  Theme.of(context).extension<AppColors>()?.primaryColor
                    ),
                    child: const Text(
                      'Sign Up',
                      style: TextStyle(color: Colors.white),
                    ),
                  ),
                  const SizedBox(height: 32),
                  Center(
                    child: RichText(
                      text: TextSpan(
                        children: <TextSpan>[
                          TextSpan(text: 'Already Have an Account?', style: TextStyle(color: Theme.of(context).extension<AppColors>()?.primaryColor.withOpacity(0.65))),
                          TextSpan(text: ' Login', style: TextStyle(color:  Theme.of(context).extension<AppColors>()?.primaryColor),
                            recognizer: TapGestureRecognizer()..onTap = () => Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => const LoginPage()),),
                          ),
                        ],
                      ),
                    ),
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildInputField(IconData icon, String labelText, {bool isPassword = false, TextEditingController? controller}) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 6),
      child: TextField(
        controller: controller,
        obscureText: isPassword,

        decoration: InputDecoration(
          prefixIcon: Icon(icon),
          labelText: labelText,
          filled: true,
          fillColor: Colors.white.withOpacity(0.7),
          border: OutlineInputBorder(borderRadius: BorderRadius.circular(6)),

        ),
      ),
    );
  }
}
