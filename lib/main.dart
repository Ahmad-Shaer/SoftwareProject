<<<<<<< HEAD
import 'package:arrrrrrrrrrrrrrrrra/GetStartedScreen.dart';
import 'package:arrrrrrrrrrrrrrrrra/SplashScreen.dart';
import 'package:arrrrrrrrrrrrrrrrra/LoginPage.dart';
import 'package:arrrrrrrrrrrrrrrrra/RegistrationPage.dart';


import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override

  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
       home: GetStartedScreen()


    );
  }

  void main() => runApp(MaterialApp(
    home: LoginPage(),
    routes: {
      '/register': (context) => RegistrationPage(), // Define your registration page
    },
  ));

}
=======
import 'package:flutter/material.dart';

void main() => runApp(MaterialApp());

>>>>>>> 35427ad9b7741795bdd555610dcd25f13503da69
