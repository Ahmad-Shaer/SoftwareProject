import 'package:flutter/material.dart';
import 'MapApp.dart'; // Import your map screen file

void main() {
  runApp(MaterialApp(
    home: CityPage(),
  ));
}

class CityPage extends StatefulWidget {
  @override
  _CityPageState createState() => _CityPageState();
}

class _CityPageState extends State<CityPage> {
  int _currentPage = 0;
  final PageController _pageController = PageController();
  List<List<String>> _buttonImages = [
    ['assets/jer.png', 'assets/nablus.png', 'assets/ramallah.png', 'assets/hebron.png'],
    ['assets/betlhm.png', 'assets/ber.png', 'assets/jenin.png', 'assets/jerecho.png'],
    ['assets/qal.png', 'assets/slfeet.png', 'assets/tubas.png', 'assets/tulkarm.png'],
  ];

  @override
  void initState() {
    super.initState();
    _pageController.addListener(() {
      setState(() {
        _currentPage = _pageController.page!.round();
      });
    });
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(60.0),
        child: AppBar(
          backgroundColor: Colors.blue.withOpacity(0.1),
          leading: GestureDetector(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => UserProfilePage()),
              );
            },
            child: CircleAvatar(
              backgroundImage: AssetImage('assets/hebron.png'),
            ),
          ),
        ),
      ),
      body: Stack(
        children: [
          Image.asset(
            'assets/background.png',
            fit: BoxFit.cover,
            width: double.infinity,
            height: double.infinity,
          ),
          PageView.builder(
            controller: _pageController,
            itemCount: _buttonImages.length,
            onPageChanged: (int page) {
              setState(() {
                _currentPage = page;
              });
            },
            itemBuilder: (context, index) {
              return _buildPage(_buttonImages[index]);
            },
          ),
          if (_currentPage > 0)
            Positioned(
              bottom: 20,
              left: 20,
              child: ElevatedButton(
                onPressed: () {
                  _pageController.previousPage(duration: Duration(milliseconds: 500), curve: Curves.ease);
                },
                child: Icon(Icons.arrow_back),
              ),
            ),
          if (_currentPage < _buttonImages.length - 1)
            Positioned(
              bottom: 20,
              right: 20,
              child: ElevatedButton(
                onPressed: () {
                  _pageController.nextPage(duration: Duration(milliseconds: 500), curve: Curves.ease);
                },
                child: Icon(Icons.arrow_forward),
              ),
            ),
          // Positioned(
          //   bottom: 20,
          //   left: 50,
          //   child: IconButton(
          //     icon: Icon(Icons.location_on),
          //     onPressed: () {
          //       Navigator.push(
          //         context,
          //         MaterialPageRoute(builder: (context) => MapApp()), // Navigate to your MapScreen
          //       );
          //     },
          //   ),
          // ),
        ],
      ),
    );
  }

  Widget _buildPage(List<String> buttonImages) {
    return Center(
      child: ClipRRect(
        borderRadius: BorderRadius.circular(20),
        child: Container(
          width: 450,
          height: 400,
          decoration: BoxDecoration(
            color: Colors.black.withOpacity(0.5),
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  _buildButton(buttonImages[0]),
                  _buildButton(buttonImages[1]),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  _buildButton(buttonImages[2]),
                  _buildButton(buttonImages[3]),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildButton(String buttonImage) {
    return Container(
      height: 150,
      width: 150,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        image: DecorationImage(
          image: AssetImage(buttonImage),
          fit: BoxFit.cover,
        ),
      ),
    );
  }
}

class UserProfilePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: null,
      body: Padding(
        padding: EdgeInsets.all(20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            CircleAvatar(
              radius: 50,
              backgroundImage: AssetImage('assets/logo1.png'),
            ),
            SizedBox(height: 20),
            Text(
              'User Name',
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 10),
            Text(
              'useremail@example.com',
              style: TextStyle(fontSize: 16, color: Colors.grey),
            ),
            SizedBox(height: 20),
            _buildUserInfoRow('Country', Icons.location_on),
            SizedBox(height: 10),
            _buildUserInfoRow('City', Icons.location_city),
            SizedBox(height: 10),
            _buildUserInfoRow('Phone Number', Icons.phone),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                // Handle edit profile action
              },
              child: Text('Edit Profile'),
            ),
            SizedBox(height: 10),
            ElevatedButton(
              onPressed: () {
                // Handle change password action
              },
              child: Text('Change Password'),
            ),
            // Add more buttons for other actions if needed
          ],
        ),
      ),
    );
  }

  Widget _buildUserInfoRow(String text, IconData icon) {
    return Row(
      children: [
        Icon(
          icon,
          size: 20,
          color: Colors.grey,
        ),
        SizedBox(width: 10),
        Text(
          text,
          style: TextStyle(fontSize: 16, color: Colors.black),
        ),
      ],
    );
  }
}
