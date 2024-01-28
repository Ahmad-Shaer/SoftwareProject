import 'package:flutter/material.dart';
import 'package:traveler_nest/model/user.dart';

class UserProvider extends ChangeNotifier {
  late User currentUser = User(
      email: "ahmad@gmail.com",
      username: "Ahmad Al-Shaer",
      phoneNumber: "0597673824",
      country: "Palestine",
      city: "Nablus");

  void initializeUser(User user) {
    currentUser = user;
  }

  void updateUserName(String username) async {
    currentUser.username = username;
    notifyListeners();
  }
}
