import 'package:flutter/material.dart';

import 'local_notification_service.dart';

class NotificationDemo extends StatefulWidget {
  const NotificationDemo({Key? key}) : super(key: key);

  @override
  State<NotificationDemo> createState() => _NotificationDemoState();
}

class _NotificationDemoState extends State<NotificationDemo> {
  LocalNotificationService localNotificationService =
      LocalNotificationService();

  @override
  void initState() {
    super.initState();

    localNotificationService.intialize();
    listenToNotification();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Notification'),
        ),
        body: Center(
          child: Column(
            children: [
              ElevatedButton(
                  onPressed: () {
                    localNotificationService.sendNotification(
                        'this is title', 'this is a body');
                  },
                  child: const Text('Simple Notification')),
              ElevatedButton(
                  onPressed: () {
                    localNotificationService.scheduleNotification(
                        'Schedule title', 'this is a schedule notification');
                  },
                  child: const Text('Schedule Notification')),
              ElevatedButton(
                  onPressed: () {
                    localNotificationService.showNotificationWithPayload(
                        id: 1,
                        title: 'hello',
                        body: 'jhasvdfvasdk',
                        payload: 'asdasdad');
                  },
                  child: const Text('Click Notification')),
            ],
          ),
        ));
  }

  void listenToNotification() =>
      localNotificationService.onNotificationClick.stream
          .listen(onNotificationListener);

  void onNotificationListener(String? payload) {
    if (payload != null && payload.isNotEmpty) {
      print('payload $payload');

      Navigator.push(
          context,
          MaterialPageRoute(
              builder: ((context) => SecondScreen(payload: payload))));
    }
  }
}

class SecondScreen extends StatelessWidget {
  const SecondScreen({
    Key? key,
    required this.payload,
  }) : super(key: key);

  final String payload;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Second Screen'),
        centerTitle: true,
      ),
      body: Center(
        child: Text(
          payload,
          style: const TextStyle(fontSize: 30),
        ),
      ),
    );
  }
}
