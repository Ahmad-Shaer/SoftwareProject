import 'package:flutter/material.dart';

import '../main.dart';
import '../widgets/custom_list_tile.dart';

class UserProfilePage extends StatelessWidget {
  const UserProfilePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.only(top: 8.0),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Container(
                  margin: const EdgeInsets.only(top: 12.0),
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
                    backgroundColor:
                        Theme.of(context).extension<AppColors>()!.primaryColor,
                    child: const CircleAvatar(
                      radius: 55.0,
                      backgroundImage: AssetImage('assets/logo1.png'),
                    ),
                  ),
                ),
                const SizedBox(height: 20.0),
                const Text(
                  "Ahmad Al-Shaer",
                  style: TextStyle(
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
                      Container(
                        child: Row(
                          children: [
                            const Icon(
                              Icons.edit,
                              size: 18.0,
                            ),
                            const SizedBox(
                              width: 6.0,
                            ),
                            Text(
                              'Edit',
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
                      profileListTile(
                          context, Icons.email, 'Email', 'ahmad@gmail.com',
                          isFirst: true),
                      profileListTile(context, Icons.phone_android_rounded,
                          'Phone', '0597853241'),
                      profileListTile(context, Icons.location_on_rounded,
                          'Country', 'Palestine'),
                      profileListTile(context, Icons.location_city_rounded,
                          'City', 'Nablus',
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
                        "Ask Us",
                        onPressed: () {},
                      ),
                      utilityListTile(
                        context,
                        Icons.login_rounded,
                        "Log-Out",
                        isLast: true,
                        onPressed: () {},
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
