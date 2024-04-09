import 'package:flutter/material.dart';
import 'package:flutter_notifications/services/notification_services.dart';

class Homepage extends StatefulWidget {
  const Homepage({super.key});

  @override
  State<Homepage> createState() => _HomepageState();
}

class _HomepageState extends State<Homepage> {
  NotificationServices notificationServices = NotificationServices();

  @override
  void initState() {
    notificationServices.requestNotificationsPermission();

    notificationServices.isTokenRefreshed();

    notificationServices.getDeviceToken().then((token) {
      print('Device token: $token');
    }).onError((error, stackTrace) {
      print("error getting device token: $error");
    });

    notificationServices.firebaseInit();

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Notifications"),
        centerTitle: true,
      ),
    );
  }
}
