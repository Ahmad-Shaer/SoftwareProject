import 'dart:convert';
import 'package:shared_preferences/shared_preferences.dart';

import 'login_page.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:traveler_nest/providers/user_provider.dart';
import 'package:http/http.dart' as http;
import '../main.dart';
import '../widgets/custom_list_tile.dart';

class UserProfilePage extends StatefulWidget {
  UserProfilePage({Key? key}) : super(key: key);

  @override
  State<UserProfilePage> createState() => _UserProfilePageState();
}

class _UserProfilePageState extends State<UserProfilePage> {
  bool isEditing = false;
  late TextEditingController userNameController;

  void toggleEditing() {
    setState(() {
      isEditing = !isEditing;
    });
  }

  @override
  void initState() {
    userNameController = TextEditingController();
    super.initState();
  }
  void updateUsername(BuildContext context)async{
    try {
      final email = context.read<UserProvider>().currentUser.email;
      String newName = userNameController.text;
      print(userNameController.text);
      final response = await http.post(
        Uri.parse('http://192.168.1.10:8000/updateUsername'),
        headers: <String, String>{
          'Content-Type': 'application/json',
        },
        body: json.encode({'email': email, 'username' : newName}),
      );


      if (response.statusCode == 200) {
        print(json.decode(response.body));
        setState(() {
          isEditing = false ;
        });
      } else {
        print('Failed to fetch hotels. Status code: ${response.statusCode}');
      }
    } catch (e) {
      print('Error: $e');
    }
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Stack(
              children: [
                Align(
                  alignment: Alignment.topCenter,
                  child: Container(
                    height: 200,
                    width: double.infinity,
                    decoration: const BoxDecoration(
                      borderRadius: BorderRadius.only(
                        bottomLeft: Radius.circular(24.0),
                        bottomRight: Radius.circular(24.0),
                      ),
                      image: DecorationImage(
                        image: AssetImage('assets/home_bg.jpg'),
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                ),
                Align(
                  alignment: Alignment.bottomCenter,
                  child: Container(
                    margin: const EdgeInsets.only(top: 125.0),
                    width: double.infinity,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      shape: BoxShape.circle,
                      boxShadow: [
                        BoxShadow(
                          blurRadius: 8,
                          color: Theme.of(context)
                              .extension<AppColors>()!
                              .primaryColor,
                          spreadRadius: 2,
                        )
                      ],
                    ),
                    child: CircleAvatar(
                      radius: 60.0,
                      backgroundColor: Theme.of(context)
                          .extension<AppColors>()!
                          .primaryColor,
                      child: const CircleAvatar(
                        radius: 56.0,
                        backgroundImage: AssetImage('assets/logo1.png'),
                      ),
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 20.0),
            isEditing
                ? Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SizedBox(
                  width: MediaQuery.of(context).size.width / 2,
                  child: TextField(
                    controller: userNameController,
                    decoration: InputDecoration(
                      hintText: "New Username",
                      suffix: GestureDetector(
                        onTap: () {
                              updateUsername(context);
                          // TODO: save new username using the controller ( userNameController.text )
                          // TODO send Notification (optional)
                          context.read<UserProvider>().updateUserName(userNameController.text);

                          },
                        child: Icon(Icons.save_as_rounded),
                      ),
                    ),
                  ),
                ),
                const SizedBox(width: 10),
              ],
            )
                : Text(
              context.watch<UserProvider>().currentUser.username,
              style: const TextStyle(
                fontSize: 20.0,
                fontWeight: FontWeight.w800,
                color: Colors.black,
                letterSpacing: 1.25,
              ),
            ),
            const SizedBox(height: 30.0),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 28.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text(
                    "Personal Information",
                    style: TextStyle(
                      fontSize: 16.0,
                      fontWeight: FontWeight.w600,
                      color: Colors.black,
                    ),
                  ),
                  GestureDetector(
                    onTap: toggleEditing,
                    child: Row(
                      children: [
                        Icon(
                          isEditing ? Icons.cancel_rounded : Icons.edit,
                          size: 18.0,
                        ),
                        const SizedBox(
                          width: 6.0,
                        ),
                        Text(
                          isEditing ? 'Cancel' : 'Edit',
                          style: TextStyle(
                            fontSize: 14.0,
                            color: Theme.of(context)
                                .extension<AppColors>()
                                ?.primaryColor,
                          ),
                        )
                      ],
                    ),
                  )
                ],
              ),
            ),
            const SizedBox(
              height: 10.0,
            ),
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 26.0),
              child: Column(
                children: [
                  profileListTile(context, Icons.email, 'Email',
                      context.watch<UserProvider>().currentUser.email,
                      isFirst: true),
                  profileListTile(context, Icons.phone_android_rounded, "Phone",
                      context.watch<UserProvider>().currentUser.phoneNumber),
                  profileListTile(context, Icons.location_on_rounded, "Country",
                      context.watch<UserProvider>().currentUser.username),
                  profileListTile(context, Icons.location_city_rounded, 'City',
                      context.watch<UserProvider>().currentUser.city,
                      isLast: true),
                ],
              ),
            ),
            const SizedBox(height: 26.0),
            const Padding(
              padding: EdgeInsets.only(left: 28.0),
              child: Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  "Utilities",
                  style: TextStyle(
                    fontSize: 16.0,
                    fontWeight: FontWeight.w600,
                    color: Colors.black,
                  ),
                ),
              ),
            ),
            const SizedBox(height: 10),
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 26.0),
              child: Column(
                children: [
                  utilityListTile(
                    context,
                    Icons.settings,
                    "Settings",
                    isFirst: true,
                    onPressed: () {},
                  ),
                  utilityListTile(
                    context,
                    Icons.chat_rounded,
                    "About Us",
                    onPressed: () {
                      showDialog(
                        context: context,
                        builder: (_) {
                          return const AboutUsDialog();
                        },
                      );
                    },
                  ),
                  utilityListTile(
                    context,
                    Icons.login_rounded,
                    "Log-Out",
                    isLast: true,
                    onPressed: () async {
                      final SharedPreferences prefs = await SharedPreferences.getInstance();
                      await prefs.remove('data');
                      Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => const LoginPage()));
                      // TODO: Logout the user
                    },
                  ),
                  const SizedBox(height: 100),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class AboutUsDialog extends StatelessWidget {
  const AboutUsDialog({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(
        vertical: MediaQuery.of(context).size.height / 4,
        horizontal: MediaQuery.of(context).size.width / 6,
      ),
      padding: const EdgeInsets.all(12.0),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(24.0),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                "About Us",
                style: TextStyle(
                  fontSize: 20.0,
                  fontWeight: FontWeight.bold,
                ),
              ),
              GestureDetector(
                onTap: () {
                  Navigator.pop(context);
                },
                child: Icon(
                  Icons.close,
                  color: Colors.black54,
                ),
              )
            ],
          ),
          Divider(),
          Text(
            "Our application aims to develop a dedicated hotel booking platform tailored for Palestine. This comprehensive application will enable users to effortlessly explore and reserve accommodations throughout the region. Key features include an intuitive user interface, real-time availability and pricing updates for Palestinian hotels,offering travelers a seamless and enjoyable hotel booking experience within Palestine.",
            style: TextStyle(color: Colors.black54),
          ),
        ],
      ),
    );
  }
}
