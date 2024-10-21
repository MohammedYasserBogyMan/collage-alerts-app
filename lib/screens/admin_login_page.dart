import 'package:collage_allerts_app/const.dart';
import 'package:flutter/material.dart';

class AdminLoginScreen extends StatefulWidget {
  const AdminLoginScreen({super.key});

  @override
  _AdminLoginScreenState createState() => _AdminLoginScreenState();
}

class _AdminLoginScreenState extends State<AdminLoginScreen> {
  final TextEditingController _adminIdController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  void _login() {
    final adminId = _adminIdController.text;
    final password = _passwordController.text;

    if (adminId == "1" && password == "123456") {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Login successful!')),
      );

      Navigator.pushReplacementNamed(context, '/addNewAlert');
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Invalid admin ID or password!')),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: color3,
      appBar: AppBar(
        automaticallyImplyLeading: false,
        centerTitle: true,
        title: const Text('Admin Login'),
        titleTextStyle: Hedingstyle2,
        backgroundColor: color3,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextField(
              controller: _adminIdController,
              decoration: const InputDecoration(
                labelText: 'Admin ID',
                labelStyle: TextStyle(color: Colors.blueGrey),
                focusedBorder: UnderlineInputBorder(
                  borderSide: BorderSide(color: Colors.blueGrey),
                ),
              ),
            ),
            const SizedBox(height: 20),
            TextField(
              controller: _passwordController,
              obscureText: true,
              decoration: const InputDecoration(
                labelText: 'Password',
                labelStyle: TextStyle(color: Colors.blueGrey),
                focusedBorder: UnderlineInputBorder(
                  borderSide: BorderSide(color: Colors.blueGrey),
                ),
              ),
            ),
            const SizedBox(height: 30),
            ElevatedButton(
              onPressed: _login,
              style: ElevatedButton.styleFrom(
                backgroundColor: color2,
                foregroundColor: color3,
                padding:
                    const EdgeInsets.symmetric(horizontal: 50, vertical: 15),
              ),
              child: const Text('Login'),
            ),
          ],
        ),
      ),
    );
  }
}
