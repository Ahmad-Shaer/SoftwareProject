import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:traveler_nest/model/notification.dart';
import 'package:traveler_nest/widgets/custom_list_tile.dart';
import 'package:http/http.dart' as http;
import '../main.dart';

class NotificationsPage extends StatefulWidget {
  const NotificationsPage({Key? key}) : super(key: key);

  @override
  State<NotificationsPage> createState() => _NotificationsPageState();
}

class _NotificationsPageState extends State<NotificationsPage>
    with TickerProviderStateMixin {
  List<NotificationInstance> notifications = [
    NotificationInstance(
      title: 'Notification',
      subtitle: 'reservation accepted',
      date: DateTime.now().subtract(
        Duration(minutes: 5),
      ),
    ),
    NotificationInstance(
      title: 'Notification',
      subtitle: 'reservation failed',
      date: DateTime.now().subtract(
        Duration(minutes: 7),
      ),
    ),
    NotificationInstance(
      title: 'Notification',
      subtitle: 'reservation accepted',
      date: DateTime.now().subtract(
        Duration(minutes: 25),
      ),
    ),
  ];

  Future <List<NotificationInstance>> getNotifications() async {
    List<NotificationInstance> notifications = [];
    try {
      final email = "ahmad@gmail.com";
      final response = await http.post(
        Uri.parse('http://192.168.1.10:8000/user/notification'),
        headers: <String, String>{
          'Content-Type': 'application/json',
        },
        body: json.encode({'email': email}),
      );

      if (response.statusCode == 200) {
        List<dynamic> notificationList = json.decode(response.body);
        print(response.body);
        for (var notificationData in notificationList) {
          NotificationInstance notificationInstance = NotificationInstance.fromJSON(json.encode(notificationData));
          notifications.add(notificationInstance);
        }
      } else {
        print('Failed to fetch notifications. Status code: ${response.statusCode}');
      }
    } catch (e) {
      print('Error: $e');
    }

    return notifications;

  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.transparent,
      body: SafeArea(
        top: true,
        child: Column(
          children: [
            SizedBox(
              height: 80,
              child: Stack(
                children: [
                  Padding(
                    padding: const EdgeInsets.only(top: 8.0),
                    child: Align(
                      alignment: Alignment.topCenter,
                      child: Container(
                        height: 8,
                        width: 60,
                        decoration: BoxDecoration(
                          color: Theme.of(context)
                              .extension<AppColors>()
                              ?.accentColor
                              .withOpacity(0.7),
                          borderRadius: BorderRadius.circular(4.0),
                        ),
                      ),
                    ),
                  ),
                  Positioned(
                    top: 30,
                    left: 20,
                    child: IconButton(
                      icon: Icon(
                        Icons.close_rounded,
                        size: 28.0,
                        color: Theme.of(context)
                            .extension<AppColors>()
                            ?.accentColor
                            .withOpacity(0.9),
                      ),
                      onPressed: () {
                        Navigator.pop(context);
                      },
                    ),
                  ),
                  const Padding(
                    padding: EdgeInsets.only(top: 40.0),
                    child: Align(
                      alignment: Alignment.center,
                      child: Text(
                        "Notifications",
                        style: TextStyle(
                          fontWeight: FontWeight.w600,
                          fontSize: 20.0,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Expanded(
              child: Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
                child: FutureBuilder(
                  future: getNotifications(),
                  builder: (context, snapshot) {
                    if(snapshot.connectionState == ConnectionState.done){
                      notifications = snapshot.data!;
                      return ListView.separated(
                        shrinkWrap: true,
                        itemCount: notifications.length,
                        itemBuilder: (context, index) {
                          return notificationListTile(
                            notification: notifications[index],
                            onDelete: () {
                              notifications.removeAt(index);
                              setState(() {});
                            },
                          );
                        },
                        separatorBuilder: (BuildContext context, int index) {
                          return const SizedBox(height: 20);
                        },
                      );
                    }
                      return CircularProgressIndicator();

                  },
                )

              ),
            ),
          ],
        ),
      ),
    );
  }
}
