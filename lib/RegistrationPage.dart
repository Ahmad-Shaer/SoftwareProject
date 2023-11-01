import 'package:flutter/material.dart';
import 'package:flutter/material.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:arrrrrrrrrrrrrrrrra/LoginPage.dart';
import 'package:arrrrrrrrrrrrrrrrra/HomePage.dart';

class RegistrationPage extends StatefulWidget {
  @override
  _RegistrationPageState createState() => _RegistrationPageState();
}

class _RegistrationPageState extends State<RegistrationPage> {
  TextEditingController firstNameController = TextEditingController();
  TextEditingController lastNameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController confirmPasswordController = TextEditingController();
  String selectedCity = 'Nablus';
  bool isMale = false;
  bool isFemale = false;
  bool agreedToTerms = false;
  bool isPasswordVisible = false;
  bool isConfirmPasswordVisible = false;
  List<String> cities = ['Nablus', 'Ramallah', 'Tulkarem'];
  void navigateToLoginnPage() {
    Navigator.of(context).push(MaterialPageRoute(
      builder: (context) => LoginPage(),
    ));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Create an Account'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text('Create an Account', style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 16),
              Row(
                children: [
                  Icon(Icons.person),
                  SizedBox(width: 10),
                  Flexible(
                    child: TextField(
                      controller: firstNameController,
                      decoration: InputDecoration(labelText: 'First Name'),
                    ),
                  ),
                  SizedBox(width: 10),
                  Icon(Icons.person),
                  SizedBox(width: 10),
                  Flexible(
                    child: TextField(
                      controller: lastNameController,
                      decoration: InputDecoration(labelText: 'Last Name'),
                    ),
                  ),
                ],
              ),
              SizedBox(height: 16),
              Row(
                children: [
                  Icon(Icons.email),
                  SizedBox(width: 10),
                  Flexible(
                    child: TextField(
                      controller: emailController,
                      decoration: InputDecoration(labelText: 'Email'),
                    ),
                  ),
                ],
              ),
              SizedBox(height: 16),
              Row(
                children: [
                  Icon(Icons.location_city),
                  SizedBox(width: 10),
                  Flexible(
                    child: DropdownButton<String>(
                      value: selectedCity,
                      onChanged: (String? newValue) {
                        setState(() {
                          selectedCity = newValue ?? '';
                        });
                      },
                      items: cities.map((String city) {
                        return DropdownMenuItem<String>(
                          value: city,
                          child: Text(city),
                        );
                      }).toList(),
                    ),
                  ),
                ],
              ),
              SizedBox(height: 16),
              Row(
                children: [
                  Icon(Icons.lock),
                  SizedBox(width: 10),
                  Flexible(
                    child: TextField(
                      controller: passwordController,
                      obscureText: !isPasswordVisible,
                      decoration: InputDecoration(
                        labelText: 'Password',
                        suffixIcon: IconButton(
                          icon: Icon(isPasswordVisible ? Icons.visibility : Icons.visibility_off),
                          onPressed: () {
                            setState(() {
                              isPasswordVisible = !isPasswordVisible;
                            });
                          },
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(height: 16),
              Row(
                children: [
                  Icon(Icons.lock),
                  SizedBox(width: 10),
                  Flexible(
                    child: TextField(
                      controller: confirmPasswordController,
                      obscureText: !isConfirmPasswordVisible,
                      decoration: InputDecoration(
                        labelText: 'Confirm Password',
                        suffixIcon: IconButton(
                          icon: Icon(isConfirmPasswordVisible ? Icons.visibility : Icons.visibility_off),
                          onPressed: () {
                            setState(() {
                              isConfirmPasswordVisible = !isConfirmPasswordVisible;
                            });
                          },
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              if (passwordController.text != confirmPasswordController.text)
                Text('Confirm password does not match password', style: TextStyle(color: Colors.red)),
              SizedBox(height: 16),
              Row(

                children: [
                  Text('Gender :         ', style: TextStyle(fontWeight: FontWeight.bold)),
                  Checkbox(
                    value: isMale,
                    onChanged: (value) {
                      setState(() {
                        isMale = value ?? false;
                        isFemale = !isMale;
                      });
                    },
                  ),
                  Text('Male'),
                  Checkbox(
                    value: isFemale,
                    onChanged: (value) {
                      setState(() {
                        isFemale = value ?? false;
                        isMale = !isFemale;
                      });
                    },
                  ),
                  Text('Female'),
                ],
              ),
              SizedBox(height: 16),
              Row(
                children: [
                  Checkbox(
                    value: agreedToTerms,
                    onChanged: (value) {
                      setState(() {
                        agreedToTerms = value ?? false;
                      });
                    },
                  ),
                  Expanded(
                    child: Text(
                      'By creating an account, you agree to our terms of use and privacy notice.',
                      style: TextStyle(color: Colors.blue),
                    ),
                  ),
                ],
              ),
              SizedBox(height: 16),
              ElevatedButton(
                onPressed: agreedToTerms &&
                    firstNameController.text.isNotEmpty &&
                    lastNameController.text.isNotEmpty &&
                    emailController.text.isNotEmpty &&
                    selectedCity.isNotEmpty &&
                    passwordController.text.isNotEmpty &&
                    confirmPasswordController.text.isNotEmpty &&
                    passwordController.text == confirmPasswordController.text &&
                    (isMale || isFemale)
                    ? () {
                  // Implement registration logic here
                 //  // After successful registration, navigate to the homepage
                 //  Navigator.of(context).pushReplacement(MaterialPageRoute(
                 //    builder: (context) => Home(),
                 // ));
                      onTap: navigateToLoginnPage();
                }
                    : null,
                child: Text('Register'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
