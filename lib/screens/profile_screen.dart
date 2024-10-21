import 'package:flutter/material.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Profile'),
      ),
      body: const Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('Name: Mohamed Yasser', style: TextStyle(fontSize: 18)),
            SizedBox(height: 10),
            Text('Email: Mohamed@email.com', style: TextStyle(fontSize: 18)),
            SizedBox(height: 20),
          ],
        ),
      ),
    );
  }
}
