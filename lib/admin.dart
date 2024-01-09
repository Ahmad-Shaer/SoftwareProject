import 'package:flutter/material.dart';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/rendering.dart';
import 'package:intl/intl.dart';
import 'dart:io';
void main() {
  debugPaintSizeEnabled = false;

  runApp(MyApp());

}
class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Admin Panel',
      debugShowCheckedModeBanner: false ,

      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: AdminDashboard(),
    );
  }
}
class AdminDashboard extends StatefulWidget {
  @override
  _AdminDashboardState createState() => _AdminDashboardState();
}
class _AdminDashboardState extends State<AdminDashboard> {

  List<Map<String, dynamic>> hotelData = [];// Define it here
  List<Map<String, dynamic>> userData = []; // Define user data list
  bool _showHotelOptions = false;
  bool _showUserOptions = false;
  TextEditingController _idHotelController = TextEditingController();
  TextEditingController _nameHotelController = TextEditingController();
  TextEditingController _emailHotelController = TextEditingController();
  TextEditingController _passwordHotelController = TextEditingController();
  TextEditingController _phoneNumberController = TextEditingController();
  TextEditingController _locationController = TextEditingController();
  TextEditingController _descriptionController = TextEditingController();
  TextEditingController _dateController = TextEditingController();
  DateTime selectedDate = DateTime.now(); // Initial date value

  // Variables to store entered data
  String _idHotel = '';
  String _nameHotel = '';
  String _emailHotel = '';
  String _phoneNumber = '';
  String _location = '';
  String _description = '';
  String _date = '';
  String _passwordHotel='';


  Future<void> _selectDate(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: selectedDate,
      firstDate: DateTime(2000),
      lastDate: DateTime(2101),
    );
    if (picked != null && picked != selectedDate) {
      setState(() {
        selectedDate = picked;
        _dateController.text = DateFormat('yyyy-MM-dd').format(selectedDate);
      });
    }
  }

  bool validateFields() {
    if (_idHotel.isEmpty ||
        _nameHotel.isEmpty ||
        _emailHotel.isEmpty ||
        _phoneNumber.isEmpty ||
        _location.isEmpty ||
        _description.isEmpty ||
        _passwordHotel.isEmpty||
        _date.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text('You must fill all text fields.'),
        ),
      );
      return true; // Fields are not filled
    }
    return false; // All fields are filled
  }
  @override

  Widget build(BuildContext context) {
    return Scaffold(
      body: Row(
        children: [
          SizedBox(
            width: 200,
            child: Drawer(
              child: Container(
                color: Colors.blue.shade900,
                child: Column(
                  children: [
                    DrawerHeader(
                      decoration: BoxDecoration(
                        color: Colors.blue,
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: CircleAvatar(
                              backgroundColor: Colors.white,
                              child: Icon(
                                Icons.account_circle,
                                size: 50,
                                color: Colors.blue,
                              ),
                              radius: 30,
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Text(
                              'Welcome, Admin',
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 18,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    ListTile(
                      leading: Icon(Icons.hotel, color: Colors.white),
                      title: Text(
                        'HOTEL',
                        style: TextStyle(color: Colors.white),
                      ),
                      onTap: () {
                        setState(() {
                          _showHotelOptions = true;
                          _showUserOptions = false;

                        });
                        // Implement action for Hotel
                      },
                    ),
                    ListTile(
                      leading: Icon(Icons.person, color: Colors.white),
                      title: Text(
                        'USER',
                        style: TextStyle(color: Colors.white),
                      ),
                      onTap: () {

                        setState(() {
                          _showHotelOptions = false;
                          _showUserOptions = true;

                        });
                        // Implement action for User
                      },
                    ),
                    ListTile(
                      leading: Icon(Icons.feedback, color: Colors.white),
                      title: Text(
                        'FEEDBACK',
                        style: TextStyle(color: Colors.white),
                      ),
                      onTap: () {
                        setState(() {
                          _showHotelOptions = false;
                          _showUserOptions = false;

                        });
                        // Implement action for Feedback
                      },
                    ),
                    ListTile(
                      leading: Icon(Icons.logout, color: Colors.white),
                      title: Text(
                        'LOGOUT',
                        style: TextStyle(color: Colors.white),
                      ),
                      onTap: () {
                        setState(() {
                          _showHotelOptions = false;
                          _showUserOptions = false;

                        });
                        // Implement action for Logout
                      },
                    ),
                  ],
                ),
              ),
            ),
          ),
          Expanded(
            child: Opacity(
              opacity: 0.7,
              // Set the opacity level here
              child: Container(
                padding: EdgeInsets.all(20.0),
               // width: 500, // Set a fixed width
               // height: 800,
                color: Colors.black26, // Set the color to white

                child: Column(
                children: [
                  Align(
                    alignment: Alignment.topRight,
                    child: Visibility(
                      visible: _showHotelOptions,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          ElevatedButton(
                            onPressed: () {
                              showDialog(
                                context: context,
                                builder: (BuildContext context) {
                                  return AlertDialog(
                                    title: Text('Add Hotel'),
                                    content: Container(
                                      width: double.maxFinite,
                                      child: Column(
                                        mainAxisSize: MainAxisSize.min,
                                        children: [
                                          TextFormField(
                                            controller: _idHotelController,
                                            decoration: InputDecoration(
                                              labelText: 'IdHotel',
                                              prefixIcon: Icon(Icons.perm_identity), // You can use a different icon based on your preference
                                            ),
                                          ),

                                          TextFormField(
                                            controller: _nameHotelController ,
                                            decoration: InputDecoration(
                                              labelText: 'Name Hotel',
                                              prefixIcon: Icon(Icons.hotel), // Hotel icon
                                            ),
                                          ),

                                  TextFormField(
                                    controller: _emailHotelController ,
                                  decoration: InputDecoration(
                                              labelText: 'Email Hotel',
                                              prefixIcon: Icon(Icons.email), // Email icon
                                            ),
                                          ),


                                          TextFormField(
                                            controller: _passwordHotelController ,
                                            decoration: InputDecoration(
                                              labelText: 'Password Hotel',
                                              prefixIcon: Icon(Icons.password), // pass icon
                                            ),
                                          ),

                                    TextFormField(
                                      controller: _phoneNumberController ,
                                      decoration: InputDecoration(
                                              labelText: 'Phone Number',
                                              prefixIcon: Icon(Icons.phone), // Phone icon
                                            ),
                                          ),
                                    TextFormField(
                                      controller: _locationController ,
                                  decoration: InputDecoration(
                                              labelText: 'Location',
                                              prefixIcon: Icon(Icons.location_on), // Location icon
                                            ),
                                          ),
                                          TextFormField(
                                            controller: _descriptionController ,
                                  decoration: InputDecoration(
                                              labelText: 'Description',
                                              prefixIcon: Icon(Icons.description), // Description icon
                                            ),
                                          ),
                                          TextFormField(
                                            controller: _dateController,
                                            decoration: InputDecoration(
                                              labelText: 'Date',
                                              prefixIcon: Icon(Icons.calendar_today),
                                            ),
                                            readOnly: true, // Prevent manual editing of the date field
                                            onTap: () {
                                              _selectDate(context); // Call the function to show the date picker
                                            },
                                          ),

                                          // Include the remaining 2 text fields similarly
                                        ],
                                      ),
                                    ),
                                    actions: [
                                      TextButton(
                                        onPressed: () {
                                          Navigator.of(context).pop(); // Close the dialog
                                        },
                                        child: Text('Cancel'),
                                      ),


                                      ElevatedButton(
                                        onPressed: () {
                                          if (validateFields()) {
                                            setState(() {
                                              hotelData.add({
                                                'ID Hotel': _idHotelController.text,
                                                'Name Hotel': _nameHotelController.text,
                                                'Email Hotel': _emailHotelController.text,
                                                'Password Hotel': _passwordHotelController.text,
                                                'Phone Number': _phoneNumberController.text,
                                                'Location': _locationController.text,
                                                'Description': _descriptionController.text,
                                                'Date': _dateController.text,
                                                // Add other fields similarly
                                              });
                                            });
                                            Navigator.of(context).pop();
                                          }
                                        },
                                        child: Text('Save'),
                                      ),

                                    ],
                                  );
                                },
                              );
                            },
                            child: Text('Add Hotels'),
                          ),
                          SizedBox(width: 5),

                          Container(
                            constraints: BoxConstraints(maxWidth: 158 ,maxHeight: 50), // Set your maximum width here
                            child: Expanded(
                              child: TextField(
                                decoration: InputDecoration(
                                  hintText: 'Search...',
                                  border: OutlineInputBorder(),
                                ),
                              ),
                            ),
                          )

                          ,
                          SizedBox(width: 5),
                          Material(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(5),
                            child: InkWell(
                              onTap: () {
                                // Implement action for 'Go!' button
                              },
                              borderRadius: BorderRadius.circular(5),
                              child: Container(
                                padding: EdgeInsets.all(8),
                                child: Icon(Icons.arrow_forward, size: 18),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
              SizedBox(height: 15),
              Visibility(
                visible: _showHotelOptions,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                    'New Hotels',
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(height: 5),
                    DataTable(
                      columns: [
                        DataColumn(label: Text('ID Hotel')),
                        DataColumn(label: Text('Name Hotel')),
                        DataColumn(label: Text('Email Hotel')),
                        DataColumn(label: Text('Password Hotel')),
                        DataColumn(label: Text('Phone Number')),
                        DataColumn(label: Text('Location')),
                        DataColumn(label: Text('Description')),
                        DataColumn(label: Text('Date')),
                        DataColumn(label: Text('Actions')),
                      ],
                      rows: hotelData.map((data) {
                        return DataRow(cells: [
                          DataCell(Text(data['IdHotel'].toString())), // Use 'IdHotel' instead of 'ID Hotel'
                          DataCell(Text(data['Name Hotel'].toString())), // Use 'Name Hotel' instead of 'Name Hotel'
                          DataCell(Text(data['Email Hotel'].toString())), // Use 'Email Hotel' instead of 'Email Hotel'
                          DataCell(Text(data['Password Hotel'].toString())), // Use 'pass Hotel' instead of 'Email Hotel'
                          DataCell(Text(data['Phone Number'].toString())), // Use 'Phone Number' instead of 'Phone Number'
                          DataCell(Text(data['Location'].toString())), // Use 'Location' instead of 'Location'
                          DataCell(Text(data['Description'].toString())), // Use 'Description' instead of 'Description'
                          DataCell(Text(data['Date'].toString())), // Use 'Date' instead of 'Date'
                          DataCell(Row(
                            children: [
                              IconButton(
                                icon: Icon(Icons.edit),
                                onPressed: () {
                                  // Implement edit action using the index or ID
                                },
                                color: Colors.blue,
                              ),
                              IconButton(
                                icon: Icon(Icons.delete),
                                onPressed: () {
                                  // Implement delete action using the index or ID
                                },
                                color: Colors.red,
                              ),
                            ],
                          )),
                        ]);
                      }).toList(),
                    )



                  ],
                ),
              ),

                  Align(
                    alignment: Alignment.topRight,
                    child: Visibility(
                      visible: _showUserOptions,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          // Search field
                          Container(
                            constraints:
                            BoxConstraints(maxWidth: 158, maxHeight: 50),
                            child: TextField(
                              decoration: InputDecoration(
                                hintText: 'Search...',
                                border: OutlineInputBorder(),
                              ),
                            ),
                          ),
                          SizedBox(width: 5),
                          // 'Go!' button
                          Material(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(5),
                            child: InkWell(
                              onTap: () {
                                // Implement action for 'Go!' button
                              },
                              borderRadius: BorderRadius.circular(5),
                              child: Container(
                                padding: EdgeInsets.all(8),
                                child: Icon(Icons.arrow_forward, size: 18),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  SizedBox(height: 15),
              Visibility(
                visible: _showUserOptions,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    TextButton(
                      onPressed: () {
                        setState(() {

                        });
                      },
                      child: Text(
                        'Show User Information',
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),


                SizedBox(height: 5),
                DataTable(
                  columns: [
                    DataColumn(label: Text('User ID')),
                    DataColumn(label: Text('User Name')),
                    DataColumn(label: Text('User Email')),
                    DataColumn(label: Text('Feedback')),
                    DataColumn(label: Text('Hotel')),
                    DataColumn(label: Text('Actions')),
                  ],
                  rows: userData.map((data) {
                    return DataRow(cells: [
                      DataCell(Text(data['UserID'].toString())),
                      DataCell(Text(data['UserName'].toString())),
                      DataCell(Text(data['UserEmail'].toString())),
                      DataCell(Text(data['Feedback'].toString())),
                      DataCell(Text(data['Hotel'].toString())),
                      DataCell(Row(
                        children: [
                          IconButton(
                            icon: Icon(Icons.edit),
                            onPressed: () {
                              // Implement edit action for user
                            },
                            color: Colors.blue,
                          ),
                          IconButton(
                            icon: Icon(Icons.delete),
                            onPressed: () {
                              // Implement delete action for user
                            },
                            color: Colors.red,
                          ),
                        ],
                      )),
                    ]);
                  }).toList(),
                )



                  ],
                ),
              ),

                ],
              ),
            ),
          ),
          ),
        ],
      ),

    );
  }


}
