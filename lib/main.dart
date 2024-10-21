import 'package:collage_allerts_app/api/firebase_api.dart';
import 'package:collage_allerts_app/screens/add_new_alert_screen.dart';
import 'package:collage_allerts_app/screens/admin_login_page.dart';
import 'package:collage_allerts_app/screens/alerts_screen.dart';
import 'package:collage_allerts_app/screens/home_screen.dart';
import 'package:collage_allerts_app/screens/login_screen.dart';
import 'package:collage_allerts_app/screens/notifixation_page.dart';
import 'package:collage_allerts_app/screens/profile_screen.dart';
import 'package:collage_allerts_app/screens/register_screen.dart';
import 'package:flutter/material.dart';
import 'firebase_options.dart';
import 'package:firebase_core/firebase_core.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  await FirebaseApi().initNotifications();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Collage Alerts App',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: const LoginPage(),
      routes: {
        '/home': (context) => const HomePage(),
        '/login': (context) => const LoginPage(),
        '/register': (context) => const RegisterPage(),
        '/alerts': (context) => const NotificationsPage(),
        '/profile': (context) => const ProfilePage(),
        '/alertDetail': (context) => const AlertDetailPage(),
        '/adminLogin': (context) => const AdminLoginScreen(),
        '/addNewAlert': (context) => const AddNewAlertScreen(),
      },
    );
  }
}
