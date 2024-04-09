import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';

class NotificationServices {
  FirebaseMessaging messaging = FirebaseMessaging.instance;
  final FlutterLocalNotificationsPlugin _flutterLocalNotificationsPlugin =
      FlutterLocalNotificationsPlugin();

  void requestNotificationsPermission() async {
    NotificationSettings settings = await messaging.requestPermission(
      alert: true,
      announcement: true,
      badge: true,
      carPlay: true,
      criticalAlert: true,
      provisional: true,
      sound: true,
    );

    if (settings.authorizationStatus == AuthorizationStatus.authorized) {
      print("Notifications permission granted");
    } else if (settings.authorizationStatus ==
        AuthorizationStatus.provisional) {
      print("Notifications permission provisionally granted");
    } else {
      print("Notifications permission denied");
    }
  }

  Future<String?> getDeviceToken() async {
    String? deviceToken = await messaging.getToken();

    if (deviceToken != null) {
      return deviceToken;
    } else {
      return null;
    }
  }

  void isTokenRefreshed() {
    messaging.onTokenRefresh.listen((event) {
      print('Token refreshed');
      event.toString();
    });
  }

  void firebaseInit() {
    FirebaseMessaging.onMessage.listen((message) {
      // print(message.notification!.title.toString());
      // print(message.notification!.body.toString());
    });
  }
}
