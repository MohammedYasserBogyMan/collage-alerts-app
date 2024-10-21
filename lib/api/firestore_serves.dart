import 'dart:developer';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:collage_allerts_app/api/push_notifi.dart';
import 'package:flutter/widgets.dart';

class FirestoreService {
  final FirebaseFirestore _db = FirebaseFirestore.instance;

  Future<void> addAlert(String title, String description, DateTime date,
      String sendFrom, BuildContext context) async {
    try {
      await _db.collection('alerts').add({
        'title': title,
        'description': description,
        'date': date,
        'createdBy': sendFrom,
      });

      log('Alert added successfully!');

      await PushNotification.sendNotificationToAdmin(
        deviceToken: 'your_device_token',
        // ignore: use_build_context_synchronously
        context: context,
        tripId: sendFrom,
        messageSender: description,
        messageBody: title,
      );
    } catch (e) {
      log('Failed to add alert: $e');
    }
  }

  Stream<List<Map<String, dynamic>>> getAlerts() {
    return _db
        .collection('alerts')
        .orderBy('date', descending: true)
        .snapshots()
        .map((snapshot) {
      return snapshot.docs.map((doc) {
        return {
          'title': doc['title'],
          'description': doc['description'],
          'date': doc['date'].toDate(),
          'createdBy': doc['createdBy'],
        };
      }).toList();
    });
  }
}
