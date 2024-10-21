import 'package:collage_allerts_app/api/firestore_serves.dart';
import 'package:collage_allerts_app/widgets/cusstom_card.dart';
import 'package:flutter/material.dart';
import 'package:collage_allerts_app/const.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: color3,
      appBar: AppBar(
        scrolledUnderElevation: 0,
        titleTextStyle: Hedingstyle,
        backgroundColor: color3,
        actions: [
          IconButton(
            icon: const Icon(Icons.notifications),
            onPressed: () {
              Navigator.pushNamed(context, '/alerts');
            },
          ),
          IconButton(
            icon: const Icon(Icons.account_circle),
            onPressed: () {
              Navigator.pushNamed(context, '/profile');
            },
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: 20),
            Row(
              children: [
                const Icon(Icons.event_available_outlined),
                const SizedBox(
                  width: 5,
                ),
                Text(
                  'Alert List',
                  style: Hedingstyle2,
                ),
              ],
            ),
            const SizedBox(height: 10),
            StreamBuilder<List<Map<String, dynamic>>>(
              stream: FirestoreService().getAlerts(),
              builder: (context, snapshot) {
                if (snapshot.connectionState == ConnectionState.waiting) {
                  return const Center(child: CircularProgressIndicator());
                } else if (snapshot.hasError) {
                  return Center(child: Text('Error: ${snapshot.error}'));
                } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
                  return const Center(child: Text('No recent Alerts.'));
                } else {
                  return Expanded(
                    child: ListView.builder(
                      itemCount: snapshot.data!.length,
                      itemBuilder: (context, index) {
                        var alert = snapshot.data![index];
                        return Expanded(child: CusstomCard(alert: alert));
                      },
                    ),
                  );
                }
              },
            ),
          ],
        ),
      ),
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: [
            DrawerHeader(
              decoration: BoxDecoration(
                color: color5,
              ),
              child: Text(
                'Menu',
                style: TextStyle(
                  color: color3,
                  fontSize: 24,
                ),
              ),
            ),
            ListTile(
              title: const Text('Notifications'),
              onTap: () {
                Navigator.pushNamed(context, '/alerts');
              },
            ),
            ListTile(
              title: const Text('Profile'),
              onTap: () {
                Navigator.pushNamed(context, '/profile');
              },
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                minimumSize: const Size(150, 50),
                backgroundColor: color4,
              ),
              onPressed: () {
                Navigator.pushReplacementNamed(context, '/login');
              },
              child: const Text('Log Out'),
            ),
          ],
        ),
      ),
    );
  }
}
