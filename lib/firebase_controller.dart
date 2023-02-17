import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter_app_badger/flutter_app_badger.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';

import 'main.dart';

class FirebaseController {
  final FirebaseMessaging _firebaseMessaging = FirebaseMessaging.instance;

  void subscribeToTopic(String topic) =>
      _firebaseMessaging.subscribeToTopic(topic);

  void unSubscribeToTopic(String topic) =>
      _firebaseMessaging.unsubscribeFromTopic(topic);

  Future<String?> get fcmToken async => await _firebaseMessaging.getToken();
  registerNotification() async {
    await Firebase.initializeApp();
    NotificationSettings settings = await _firebaseMessaging.requestPermission(
      alert: true,
      badge: true,
      provisional: false,
      sound: true,
    );

    if (settings.authorizationStatus == AuthorizationStatus.authorized) {
      print('User granted permission');
      return FirebaseMessaging.onMessage.listen((RemoteMessage message) async {
        // Parse the message received
        if (await FlutterAppBadger.isAppBadgeSupported())
          FlutterAppBadger.updateBadgeCount(1);
        RemoteNotification? notification = message.notification;
        AndroidNotification? android = message.notification?.android;
        if (notification != null && android != null) {
          flutterLocalNotificationsPlugin.show(
              notification.hashCode,
              notification.title,
              notification.body,
              NotificationDetails(
                  android: AndroidNotificationDetails(channel.id, channel.name,
                      channelDescription: channel.description,
                      sound: channel.sound,
                      playSound: channel.playSound)));
        }
      });
    } else {
      print('User declined or has not accepted permission');
    }
  }
}
