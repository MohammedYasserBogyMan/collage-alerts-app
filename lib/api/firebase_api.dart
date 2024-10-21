import 'dart:developer';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';

class FirebaseApi {
  final FirebaseMessaging _firebaseMessaging = FirebaseMessaging.instance;
  final FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin =
      FlutterLocalNotificationsPlugin();

  Future<void> initNotifications() async {
    var initializationSettingsAndroid =
        const AndroidInitializationSettings('@mipmap/ic_launcher');
    var initializationSettings =
        InitializationSettings(android: initializationSettingsAndroid);

    await flutterLocalNotificationsPlugin.initialize(initializationSettings);

    NotificationSettings settings =
        await _firebaseMessaging.requestPermission();

    if (settings.authorizationStatus == AuthorizationStatus.authorized) {
      log('User granted permission');
    } else if (settings.authorizationStatus == AuthorizationStatus.denied) {
      log('User denied permission');
      return;
    }

    final token = await _firebaseMessaging.getToken();
    log('Token: $token');

    FirebaseMessaging.onMessage.listen((RemoteMessage message) {
      log('Received a message: ${message.notification?.title}');
      showLocalNotification(
          message.notification?.title, message.notification?.body);
    });

    FirebaseMessaging.onMessageOpenedApp.listen((RemoteMessage message) {
      log('App opened from notification: ${message.notification?.title}');
    });
  }

  Future<void> showLocalNotification(String? title, String? body) async {
    var androidPlatformChannelSpecifics = const AndroidNotificationDetails(
      'your_channel_id',
      'your_channel_name',
      channelDescription: 'your_channel_description',
      importance: Importance.max,
      priority: Priority.high,
    );

    var platformChannelSpecifics =
        NotificationDetails(android: androidPlatformChannelSpecifics);

    await flutterLocalNotificationsPlugin.show(
      0,
      title,
      body,
      platformChannelSpecifics,
    );
  }
}
