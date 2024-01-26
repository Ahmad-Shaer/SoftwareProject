import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:traveler_nest/widgets/button.dart';
import '../main.dart';
import 'sign_up_page.dart';
import '../ForgotPasswordScreen.dart';
import '../CityPage.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: LoginPage(),
    );
  }
}

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  bool _isPasswordVisible = false;
  Color forgetPasswordColor = Colors.blue;
  Color dontHaveAccountColor = Colors.blue;
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  Future<void> loginUser(BuildContext context) async {
    final String email = emailController.text;
    final String password = passwordController.text;

    final response = await http.post(
      Uri.parse('http://192.168.1.5:8000/user/login'),
      headers: <String, String>{
        'Content-Type': 'application/json',
      },
      body: jsonEncode(<String, String>{
        'email': email,
        'password': password,
      }),
    );

    if (response.statusCode == 200) {
      // Login successful
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) =>  HotelBookingApp(),
        ),
      );
    } else {
      // Login failed, show pop-up
      showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: const Text('Login Failed'),
            content: const Text('Invalid credentials. Please check your email and password.'),
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
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage('assets/travel.jpg'),
            fit: BoxFit.cover,
          ),
        ),
        child: Center(
          child: Container(
            padding: const EdgeInsets.all(20.0),
            margin: const EdgeInsets.symmetric(horizontal: 20.0),
            width: 500,
            height: 500,
            decoration: BoxDecoration(
              color: Colors.white.withOpacity(0.7),
              borderRadius: BorderRadius.circular(10.0),
            ),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                const Row(
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
                        color: Colors.black,
                        fontSize: 28.0,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 20.0),
                TextFormField(
                  controller: emailController,
                  decoration: const InputDecoration(
                    labelText: 'Email',
                    prefixIcon: Icon(Icons.email),
                  ),
                ),
                const SizedBox(height: 10.0),
                Row(
                  children: [
                    Expanded(
                      child: TextFormField(
                        controller: passwordController,
                        obscureText: !_isPasswordVisible,
                        decoration: const InputDecoration(
                          labelText: 'Password',
                          prefixIcon: Icon(Icons.lock),
                        ),
                      ),
                    ),
                    IconButton(
                      icon: _isPasswordVisible
                          ? const Icon(Icons.visibility)
                          : const Icon(Icons.visibility_off),
                      onPressed: () {
                        setState(() {
                          _isPasswordVisible = !_isPasswordVisible;
                        });
                      },
                    ),
                  ],
                ),
                const SizedBox(height: 10.0),

                InkWell(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const ForgotPasswordScreen(),
                      ),
                    );
                  },
                  child: MouseRegion(
                    cursor: SystemMouseCursors.click,
                    child: Align(
                      alignment: Alignment.centerRight,
                      child: Text(
                        'Forgot Password?',
                        style: TextStyle(
                          color: Theme.of(context).extension<AppColors>()?.primaryColor,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ),
                ),

                const SizedBox(height: 20.0),
                CustomButton(
                  onClick: () {
                    loginUser(context);
                  },
                  text: 'login',
                  textSize: 18.0,
                  padding: const EdgeInsets.symmetric(horizontal: 64.0, vertical: 6.0),

                ),
                const SizedBox(height: 60.0),
                Center(
                  child: RichText(
                    text: TextSpan(
                      children: <TextSpan>[
                        TextSpan(text: 'Need an Account?', style: TextStyle(color: Theme.of(context).extension<AppColors>()?.primaryColor.withOpacity(0.65))),
                        TextSpan(text: ' Sign up', style: TextStyle(color:  Theme.of(context).extension<AppColors>()?.primaryColor),
                          recognizer: TapGestureRecognizer()..onTap = () => Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => SignupPage()),),
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
    );
  }
}
