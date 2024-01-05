import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: BookingScreen(),
    );
  }
}

class BookingScreen extends StatefulWidget {
  const BookingScreen({super.key});

  @override
  _BookingScreenState createState() => _BookingScreenState();
}

class _BookingScreenState extends State<BookingScreen> {
  bool isChecked = false; // Initially unchecked
  bool isChecked1 = false; // Initially unchecked
  bool isChecked2 = false; // Initially unchecked

  TextEditingController firstNameController = TextEditingController();
  TextEditingController lastNameController = TextEditingController();
  TextEditingController address1Controller = TextEditingController();
  TextEditingController address2Controller = TextEditingController();
  TextEditingController cityController = TextEditingController();
  TextEditingController stateController = TextEditingController();
  TextEditingController zipcodeController = TextEditingController();
  TextEditingController phoneController = TextEditingController();
  TextEditingController emailController = TextEditingController();

  TextEditingController checkOutDateController = TextEditingController();
  TextEditingController checkInDateController = TextEditingController();
  int selectedAdults = 1; // Default value for adults



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
            ),            const SizedBox(height: 20),
            Row(
              children: [
                Expanded(
                  child: TextField(
                    controller: firstNameController,
                    decoration: const InputDecoration(
                      labelText: 'First Name',
                    ),
                  ),
                ),
                const SizedBox(width: 10),
                Expanded(
                  child: TextField(
                    controller: lastNameController,
                    decoration: const InputDecoration(
                      labelText: 'Last Name',
                    ),
                  ),
                ),
              ],
            ),
            // Add other rows for , , state, etc. following a similar structure
            // You can use TextFields, DatePickers, Checkboxes, Dropdowns, etc. based on your requirements
            const SizedBox(height: 20),
            Row(
              children: [
                Expanded(
                  child: TextField(
                    controller: address1Controller,
                    decoration: const InputDecoration(
                      labelText: 'Address1',
                    ),
                  ),
                ),
                const SizedBox(width: 10),
                Expanded(
                  child: TextField(
                    controller: address2Controller,
                    decoration: const InputDecoration(
                      labelText: 'Address2',
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 20),
            Row(
              children: [
                Expanded(
                  child: TextField(
                    controller: cityController,
                    decoration: const InputDecoration(
                      labelText: 'City',
                    ),
                  ),
                ),
                const SizedBox(width: 10),
                Expanded(
                  child: TextField(
                    controller: stateController,
                    decoration: const InputDecoration(
                      labelText: 'State',
                    ),
                  ),
                ),
                const SizedBox(width: 10),
                Expanded(
                  child: TextField(
                    controller: zipcodeController,
                    decoration: const InputDecoration(
                      labelText: 'Zip Code',
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 20),
            Row(
              children: [
                Expanded(
                  child: TextField(
                    controller: phoneController,
                    decoration: const InputDecoration(
                      labelText: 'Phone',
                    ),
                  ),
                ),
                const SizedBox(width: 10),
                Expanded(
                  child: TextField(
                    controller: emailController,
                    decoration: const InputDecoration(
                      labelText: 'Email',
                    ),
                  ),
                ),
              ],
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
                          // Update the check-in date text controller with the picked date
                          checkInDateController.text = pickedDate.toString(); // Update your controller with the chosen date
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
                    enabled: false, // Disable editing the date directly
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
                          // Update the check-out date text controller with the picked date
                          checkOutDateController.text = pickedDate.toString(); // Update your controller with the chosen date
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
                    enabled: false, // Disable editing the date directly
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
          ],
        ),
      ),
    );
  }
}