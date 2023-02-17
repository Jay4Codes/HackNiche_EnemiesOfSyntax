import 'package:firebase_messaging/firebase_messaging.dart';

class FirebaseController{
  final FirebaseMessaging _firebaseMessaging = FirebaseMessaging.instance;

  void subscribeToTopic(String topic) =>
      _firebaseMessaging.subscribeToTopic(topic);

void unSubscribeToTopic(String topic) =>
      _firebaseMessaging.unsubscribeFromTopic(topic);

  Future<String?> get fcmToken async => await _firebaseMessaging.getToken();

  
}