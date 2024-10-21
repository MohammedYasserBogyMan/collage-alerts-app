import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:collage_allerts_app/const.dart';

class AlertDetailPage extends StatelessWidget {
  const AlertDetailPage({super.key});

  @override
  Widget build(BuildContext context) {
    final Map<String, dynamic> alert =
        ModalRoute.of(context)!.settings.arguments as Map<String, dynamic>;

    String formattedDate = DateFormat('yyyy-MM-dd').format(alert['date']);
    String formattedTime = DateFormat('HH:mm').format(alert['date']);

    return Scaffold(
      backgroundColor: color3,
      appBar: AppBar(
        backgroundColor: color3,
        title: const Text('Alert Details'),
        centerTitle: true,
        titleTextStyle: Hedingstyle,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(width: 8),
            Text(
              alert['title'],
              style: TextStyle(
                fontSize: 30,
                fontWeight: FontWeight.bold,
                color: color5,
              ),
            ),
            const SizedBox(height: 20),

            // الوصف مع الأيقونة
            const SizedBox(width: 8),
            Text(
              alert['description'],
              style: const TextStyle(fontSize: 24),
            ),
            const SizedBox(height: 15),

            Row(
              children: [
                Icon(
                  Icons.calendar_today,
                  color: color5,
                  size: 24,
                ),
                const SizedBox(width: 8),
                Text(
                  'Date: $formattedDate',
                  style: TextStyle(fontSize: 20, color: color5),
                ),
              ],
            ),
            const SizedBox(height: 8),

            Row(
              children: [
                Icon(
                  Icons.access_time,
                  color: color5,
                  size: 24,
                ),
                const SizedBox(width: 8),
                Text(
                  'Time: $formattedTime',
                  style: TextStyle(fontSize: 20, color: color5),
                ),
              ],
            ),
            const SizedBox(height: 15),

            Row(
              children: [
                Icon(
                  Icons.person,
                  color: color5,
                  size: 24,
                ),
                const SizedBox(width: 8),
                Text(
                  'From: ${alert['createdBy']}',
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    color: color5,
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
