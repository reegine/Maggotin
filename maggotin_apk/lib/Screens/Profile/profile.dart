import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:maggotin_dev/Screens/Profile/profile_provider.dart';

import '../Login/login_provider.dart';

class ProfileScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final provider = Modular.get<ProfileProvider>();

    return Scaffold(
      appBar: AppBar(
        title: Text('Profile'),
        actions: [
          // IconButton(
          //   icon: Icon(Icons.logout),
          //   onPressed: () {
          //     provider.logout(); // Call the logout function
          //   },
          // ),
          ElevatedButton(
            onPressed: () {
              provider.logout(); // Call the logout function
            },
            child: Text('Logout'),
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'User  Profile',
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 20),
            _buildProfileInfo('Name', 'John Doe'),
            _buildProfileInfo('Email', 'john.doe@example.com'),
            _buildProfileInfo('Phone', '+1234567890'),
            _buildProfileInfo('Address', '123 Main St, City, Country'),
            SizedBox(height: 20),

          ],
        ),
      ),
    );
  }

  Widget _buildProfileInfo(String title, String value) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            title,
            style: TextStyle(fontSize: 18, fontWeight: FontWeight.w600),
          ),
          Text(
            value,
            style: TextStyle(fontSize: 18),
          ),
        ],
      ),
    );
  }
}