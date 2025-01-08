import 'package:firebase_messaging/firebase_messaging.dart';

Future<void> handleBackgroundMessage(RemoteMessage message) async {
  if (message.notification != null) {
    print('You have a new notification!');
    print('Title: ${message.notification?.title}');
    print('Details: ${message.notification?.body}');
  }
  if (message.data.isNotEmpty) {
    print('Additional Information: ${message.data}');
  }
}

class FirebaseApi {
  final FirebaseMessaging _firebaseMessaging = FirebaseMessaging.instance;

  Future<void> initNotifications() async {
    await _requestPermissions();

    String? fcmToken = await _getFcmToken();
    if (fcmToken != null) {
      print('Your notification service is ready! Token: $fcmToken');
    } else {
      print('Could not set up notifications. Please try again.');
    }

    FirebaseMessaging.onBackgroundMessage(handleBackgroundMessage);
  }

  Future<void> _requestPermissions() async {
    NotificationSettings settings = await _firebaseMessaging.requestPermission();
    print('Notification Access: ${settings.authorizationStatus}');
  }

  Future<String?> _getFcmToken() async {
    try {
      return await _firebaseMessaging.getToken();
    } catch (e) {
      print('Something went wrong while getting your notification token: $e');
      return null;
    }
  }
}
