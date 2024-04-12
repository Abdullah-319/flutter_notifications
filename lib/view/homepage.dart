import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/foundation.dart';
import 'package:http/http.dart' as http;

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
    notificationServices.setupInteractMessage(context);

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Notifications"),
        centerTitle: true,
      ),
      body: Center(
        child: TextButton(
          onPressed: () {
            notificationServices.getDeviceToken().then((value) async {
              var data = {
                'to': value
                    .toString(), // dtkL99S3QGSw82MubzgNVw:APA91bHGZwlXT7VEbJOM99BtjBqSXmp2717mCeEJwAhNm1J3EAk5VF7uxgRXRnsZ2myU38x1KRzLQhtGAbPbD1I37wk8n4kCtzwcf6_DOlM83IkfrP6A_QbLZQVdof_6uY8fv07oKmSD
                'priority': 'high',
                'notification': {
                  'title': 'Salam',
                  'body': 'to everybody',
                },
                'data': {
                  'type': 'msg',
                  'name': 'COMSATS',
                },
              };

              await http.post(
                Uri.parse('https://fcm.googleapis.com/fcm/send'),
                body: jsonEncode(data),
                headers: {
                  'Content-Type': 'application/json; charset=UTF-8',
                  'Authorization':
                      'key=AAAAQg0Q0ec:APA91bGA2A0Jx3YQSWbuyxoLCX6ymSNH4Cc3vKg__UNwmD6XyDftkByuaOBiumeUMrNafw2YYxNeUBYFZfsCo4h1hDoTibsEU2wYPIIQ1i5zZS8ufemZXfWCGvgqya4PIl0Lae30Adn3',
                },
              );
            });
          },
          child: const Text('Send Notification'),
        ),
      ),
    );
  }
}
