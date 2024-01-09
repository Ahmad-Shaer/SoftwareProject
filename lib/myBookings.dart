import 'package:flutter/material.dart';
import 'package:table_calendar/table_calendar.dart';
import 'CityPage.dart';

class myBookings extends StatelessWidget {
  const myBookings({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: null,
        body: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 10),
              const SizedBox(height: 20),
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 8.0),
                  child: TableCalendar(
                    firstDay: DateTime.utc(2024, 1, 1),
                    lastDay: DateTime.utc(2024, 12, 31),
                    focusedDay: DateTime.now(),
                    calendarFormat: CalendarFormat.month,
                    headerStyle: HeaderStyle(
                      formatButtonVisible: true,
                    ),
                    calendarStyle: CalendarStyle(
                      todayTextStyle: TextStyle(
                        fontWeight: FontWeight.bold,
                        color: Colors.blue,
                      ),
                      selectedDecoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: Colors.blue,
                      ),
                    ),
                    selectedDayPredicate: (day) {
                      return isSameDay(day, DateTime.now());
                    },
                    onDaySelected: (selectedDay, focusedDay) {
                      // Handle day selection
                    },
                  ),
                ),
              ),
            ],
          ),
        ),
        bottomNavigationBar: BottomNavigationBar(
          items: [
            BottomNavigationBarItem(
              icon: Icon(Icons.home),
              label: 'Home',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.book),
              label: 'My Booking',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.notifications),
              label: 'Notification',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.search),
              label: 'Search',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.chat),
              label: 'Chat',
            ),
          ],
          type: BottomNavigationBarType.fixed,
          onTap: (index) {
            if (index == 0) {
              // Navigate to the main screen (main.dart)
              Navigator.pushReplacement(
                context,
                MaterialPageRoute(builder: (context) => HotelBookingApp()),
              );
            } else if (index == 1) {
              // Handle other navigation items if needed
            }
          },
        ),
      ),
    );
  }
}
