import 'package:flutter/material.dart';
import 'package:flutter/foundation.dart';

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
      if (kDebugMode) {
        print('Device token: $token');
      }
    }).onError((error, stackTrace) {
      if (kDebugMode) {
        print("error getting device token: $error");
      }
    });

    notificationServices.firebaseInit(context);

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Notifications"),
        centerTitle: true,
      ),
      body: const Center(
        child: Text('Notifications'),
      ),
    );
  }
}
