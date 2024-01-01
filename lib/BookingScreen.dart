import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: BookingScreen(),
    );
  }
}

class BookingScreen extends StatefulWidget {
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
        title: Text('Booking Form'),
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
            ),            SizedBox(height: 20),
            Row(
              children: [
                Expanded(
                  child: TextField(
                    controller: firstNameController,
                    decoration: InputDecoration(
                      labelText: 'First Name',
                    ),
                  ),
                ),
                SizedBox(width: 10),
                Expanded(
                  child: TextField(
                    controller: lastNameController,
                    decoration: InputDecoration(
                      labelText: 'Last Name',
                    ),
                  ),
                ),
              ],
            ),
            // Add other rows for , , state, etc. following a similar structure
            // You can use TextFields, DatePickers, Checkboxes, Dropdowns, etc. based on your requirements
            SizedBox(height: 20),
            Row(
              children: [
                Expanded(
                  child: TextField(
                    controller: address1Controller,
                    decoration: InputDecoration(
                      labelText: 'Address1',
                    ),
                  ),
                ),
                SizedBox(width: 10),
                Expanded(
                  child: TextField(
                    controller: address2Controller,
                    decoration: InputDecoration(
                      labelText: 'Address2',
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(height: 20),
            Row(
              children: [
                Expanded(
                  child: TextField(
                    controller: cityController,
                    decoration: InputDecoration(
                      labelText: 'City',
                    ),
                  ),
                ),
                SizedBox(width: 10),
                Expanded(
                  child: TextField(
                    controller: stateController,
                    decoration: InputDecoration(
                      labelText: 'State',
                    ),
                  ),
                ),
                SizedBox(width: 10),
                Expanded(
                  child: TextField(
                    controller: zipcodeController,
                    decoration: InputDecoration(
                      labelText: 'Zip Code',
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(height: 20),
            Row(
              children: [
                Expanded(
                  child: TextField(
                    controller: phoneController,
                    decoration: InputDecoration(
                      labelText: 'Phone',
                    ),
                  ),
                ),
                SizedBox(width: 10),
                Expanded(
                  child: TextField(
                    controller: emailController,
                    decoration: InputDecoration(
                      labelText: 'Email',
                    ),
                  ),
                ),
              ],
            ),


            SizedBox(width: 10),
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
                    child: Text('Check-in Date'),
                  ),
                  SizedBox(height: 10),
                  TextField(
                    controller: checkInDateController,
                    decoration: InputDecoration(
                      labelText: 'Check-in Date',
                    ),
                    enabled: false, // Disable editing the date directly
                  ),
                ],
              ),
            ),
            SizedBox(width: 10),
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
                    child: Text('Check-out Date'),
                  ),
                  SizedBox(height: 10),
                  TextField(
                    controller: checkOutDateController,
                    decoration: InputDecoration(
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
                Text('Standard'),
                Checkbox(
                  value: isChecked1,
                  onChanged: (value) {
                    setState(() {
                      isChecked1 = value!;
                    });
                  },
                ),
                Text('Deluxe'),
                Checkbox(
                  value: isChecked2,
                  onChanged: (value) {
                    setState(() {
                      isChecked2 = value!;
                    });
                  },
                ),
                Text('Suite'),
              ],
            ),

            SizedBox(width: 10),
            SizedBox(height: 20),
            Row(
              children: [
                Text('Number of Adults: '),
                SizedBox(width: 10),
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