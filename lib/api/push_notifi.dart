import 'dart:convert';
import 'dart:developer';
import 'package:http/http.dart' as http;
import 'package:googleapis_auth/auth_io.dart' as auth;
import 'package:flutter/material.dart';

class PushNotification {
  static Future<String> getAccessToken() async {
    try {
      final serviceAccountJson = {
        "type": "service_account",
        "project_id": "collageallertsapp",
        "private_key_id":
            "REPLACE_WITH_PRIVATE_KEY_ID", // Private key ID, should not be shared
        "private_key":
            "-----BEGIN PRIVATE KEY-----\nREPLACE_WITH_PRIVATE_KEY\n-----END PRIVATE KEY-----\n", // The private key, replace with actual key for use
        "client_email":
            "REPLACE_WITH_CLIENT_EMAIL", // Email associated with the service account
        "client_id": "REPLACE_WITH_CLIENT_ID", // Client ID
        "auth_uri": "https://accounts.google.com/o/oauth2/auth",
        "token_uri": "https://oauth2.googleapis.com/token",
        "auth_provider_x509_cert_url":
            "https://www.googleapis.com/oauth2/v1/certs",
        "client_x509_cert_url":
            "https://www.googleapis.com/robot/v1/metadata/x509/REPLACE_WITH_CLIENT_EMAIL", // Certificate URL
        "universe_domain": "googleapis.com"
      };

      List<String> scopes = [
        "https://www.googleapis.com/auth/userinfo.email",
        "https://www.googleapis.com/auth/firebase.database",
        "https://www.googleapis.com/auth/firebase.messaging"
      ];

      auth.ServiceAccountCredentials credentials =
          auth.ServiceAccountCredentials.fromJson(serviceAccountJson);

      var client = await auth.clientViaServiceAccount(credentials, scopes);

      String accessToken = client.credentials.accessToken.data;

      client.close();

      return accessToken;
    } catch (e) {
      log('Error getting access token: $e');
      return '';
    }
  }

  static sendNotificationToAdmin({
    required String deviceToken,
    required BuildContext context,
    required String tripId,
    required String messageSender,
    required String messageBody,
  }) async {
    final String serverAccessTokenKey = await getAccessToken();
    String endPointFirebaseCloudMessaging =
        'https://fcm.googleapis.com/v1/projects/collageallertsapp/messages:send';

    final Map<String, dynamic> message = {
      'message': {
        'token': deviceToken,
        'notification': {
          'title': tripId,
          'body': messageBody,
        },
        'data': {
          'tripId': tripId,
          'messageSender': messageSender,
          'messageBody': messageBody,
        }
      }
    };

    final response = await http.post(
      Uri.parse(endPointFirebaseCloudMessaging),
      headers: {
        'Content-Type': 'application/json',
        'Authorization': 'Bearer $serverAccessTokenKey',
      },
      body: json.encode(message),
    );

    if (response.statusCode == 200) {
      log('Notification sent successfully');
    } else {
      log('Error sending notification: ${response.body}');
      throw Exception('Failed to send notification: ${response.body}');
    }
  }
}
