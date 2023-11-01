import 'package:flutter/material.dart';

class ResetPasswordPage extends StatefulWidget {
  @override
  _ResetPasswordPageState createState() => _ResetPasswordPageState();
}

class _ResetPasswordPageState extends State<ResetPasswordPage> {
  TextEditingController emailController = TextEditingController();

  void sendResetPasswordEmail() {
    // Implement your logic to send a password reset email here
    // You can use the emailController.text to get the user's email
    // Send the email and handle success or error accordingly
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Reset Password'),
      ),
      backgroundColor: Colors.blue.withOpacity(0.7), // Background with opacity

      // Wrap the content with Center to center it
      body: Center(
        child: Hero(
          tag: 'reset_password', // Unique tag for the Hero
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                SizedBox(height: 100),

                Text(
                  'Forgot Your Password?',
                  style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                ),
                SizedBox(height: 16),
                TextField(
                  controller: emailController,
                  decoration: InputDecoration(labelText: 'Enter your email'),
                ),
                SizedBox(height: 16),
                ElevatedButton(
                  onPressed: sendResetPasswordEmail,
                  child: Text('Send Reset Email'),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
