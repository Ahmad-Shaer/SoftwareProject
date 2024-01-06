import 'package:flutter/material.dart';
import 'dart:async';
import 'dart:convert';
import 'package:http/http.dart' as http;

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: BookingScreen(),
    );
  }
}

class BookingScreen extends StatefulWidget {
  const BookingScreen({Key? key});

  @override
  _BookingScreenState createState() => _BookingScreenState();
}

class _BookingScreenState extends State<BookingScreen> {
  bool isChecked = false; // Initially unchecked
  bool isChecked1 = false; // Initially unchecked
  bool isChecked2 = false; // Initially unchecked

  TextEditingController checkOutDateController = TextEditingController();
  TextEditingController checkInDateController = TextEditingController();
  int selectedAdults = 1; // Default value for adults

  Future<void> submitBooking() async {
    final String checkInDate = checkInDateController.text;
    final String checkOutDate = checkOutDateController.text;

    final response = await http.post(
      Uri.parse('http://192.168.1.9:8000/bookings'),
      headers: <String, String>{
        'Content-Type': 'application/json',
      },
      body: jsonEncode(<String, dynamic>{
        'checkInDate': checkInDate,
        'checkOutDate': checkOutDate,
        'roomType': [
          if (isChecked) 'Standard',
          if (isChecked1) 'Deluxe',
          if (isChecked2) 'Suite',
        ],
        'numberOfAdults': selectedAdults,
        'email': 'your@email.com', // Replace with actual email
        'phoneNumber': '1234567890', // Replace with actual phone number
      }),
    );

    if (response.statusCode == 201) {
      // Booking successful, you can handle the response here
      print('Booking successful!');
    } else {
      print('Failed to save booking. Error: ${response.body}');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Booking Form'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: ListView(
          children: [
            SizedBox(
              height: 200,
              child: Image.asset(
                'assets/bord1.png', // Path to your image in the assets folder
                fit: BoxFit.cover,
              ),
            ),
            const SizedBox(height: 20),
            Expanded(
              child: Column(
                children: [
                  TextButton(
                    onPressed: () async {
                      DateTime? pickedDate = await showDatePicker(
                        context: context,
                        initialDate: DateTime.now(),
                        firstDate: DateTime.now(),
                        lastDate: DateTime(DateTime.now().year + 1),
                      );
                      if (pickedDate != null) {
                        setState(() {
                          checkInDateController.text = pickedDate.toString();
                        });
                      }
                    },
                    child: const Text('Check-in Date'),
                  ),
                  const SizedBox(height: 10),
                  TextField(
                    controller: checkInDateController,
                    decoration: const InputDecoration(
                      labelText: 'Check-in Date',
                    ),
                    enabled: false,
                  ),
                ],
              ),
            ),
            const SizedBox(width: 10),
            Expanded(
              child: Column(
                children: [
                  TextButton(
                    onPressed: () async {
                      DateTime? pickedDate = await showDatePicker(
                        context: context,
                        initialDate: DateTime.now(),
                        firstDate: DateTime.now(),
                        lastDate: DateTime(DateTime.now().year + 1),
                      );
                      if (pickedDate != null) {
                        setState(() {
                          checkOutDateController.text = pickedDate.toString();
                        });
                      }
                    },
                    child: const Text('Check-out Date'),
                  ),
                  const SizedBox(height: 10),
                  TextField(
                    controller: checkOutDateController,
                    decoration: const InputDecoration(
                      labelText: 'Check-out Date',
                    ),
                    enabled: false,
                  ),
                ],
              ),
            ),
            Row(
              children: [
                Checkbox(
                  value: isChecked,
                  onChanged: (value) {
                    setState(() {
                      isChecked = value!;
                    });
                  },
                ),
                const Text('Standard'),
                Checkbox(
                  value: isChecked1,
                  onChanged: (value) {
                    setState(() {
                      isChecked1 = value!;
                    });
                  },
                ),
                const Text('Deluxe'),
                Checkbox(
                  value: isChecked2,
                  onChanged: (value) {
                    setState(() {
                      isChecked2 = value!;
                    });
                  },
                ),
                const Text('Suite'),
              ],
            ),
            const SizedBox(width: 10),
            const SizedBox(height: 20),
            Row(
              children: [
                const Text('Number of Adults: '),
                const SizedBox(width: 10),
                DropdownButton<int>(
                  value: selectedAdults,
                  onChanged: (newValue) {
                    setState(() {
                      selectedAdults = newValue!;
                    });
                  },
                  items: List.generate(10, (index) {
                    return DropdownMenuItem<int>(
                      value: index + 1,
                      child: Text((index + 1).toString()),
                    );
                  }).toList(),
                ),
              ],
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                submitBooking();
              },
              style: ElevatedButton.styleFrom(
                primary: Colors.blue, // Change as needed
              ),
              child: const Padding(
                padding: EdgeInsets.symmetric(vertical: 12, horizontal: 60),
                child: Text(
                  'Submit',
                  style: TextStyle(fontSize: 18),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
