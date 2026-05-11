import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:ostad_batch_fourteen/main.dart';

class FcmUtils {
  static Future<void> initialize() async {
    await FirebaseMessaging.instance.requestPermission(
      alert: true,
      announcement: true,
      badge: true,
      criticalAlert: true,
      sound: true,
    );

    // Foreground / Running / Visible
    FirebaseMessaging.onMessage.listen(_handleForegroundNotification);

    // Background/Minimize/hide
    // Notify as notification
    FirebaseMessaging.onMessageOpenedApp.listen(_handleBackgroundNotification);

    // Killed/Dead
    FirebaseMessaging.onBackgroundMessage(handleBackgroundNotification);
  }

  static void _handleBackgroundNotification(RemoteMessage message) {
    print(message.notification?.title);
    print(message.notification?.body);
    print(message.data);
  }

  static void _handleForegroundNotification(RemoteMessage message) {
    print(message.notification?.title);
    print(message.notification?.body);
    print(message.data);

    final context = MyApp.navigatorKey.currentContext!;

    showDialog(
      context: context,
      builder: (ctx) {
        return Dialog(
          child: Column(
            mainAxisSize: .min,
            children: [
              Text(
                message.notification?.title ?? '',
                style: TextTheme.of(context).titleSmall,
              ),
              Text(message.notification?.body ?? ''),
            ],
          ),
        );
      },
    );
  }

  static Future<String?> getFCMToken() async {
    // TODO: Send to the backend while you are logging in
    String? fcmToken = await FirebaseMessaging.instance.getToken();
    return fcmToken;
  }

  static Future<void> onRefreshToken() async {
    FirebaseMessaging.instance.onTokenRefresh.listen((newToken) {
      // TODO: Send to backend api (Refresh token)
    });
  }

  static Future<void> subscribeToTopic(String topicName) async {
    await FirebaseMessaging.instance.subscribeToTopic(topicName);
  }

  static Future<void> unsubscribeToTopic(String topicName) async {
    await FirebaseMessaging.instance.unsubscribeFromTopic(topicName);
  }
}

Future<void> handleBackgroundNotification(RemoteMessage message) async {}
