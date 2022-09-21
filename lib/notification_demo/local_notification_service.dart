import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:rxdart/rxdart.dart';

class LocalNotificationService {
  final _flutterLocalNotificationsPlugin = FlutterLocalNotificationsPlugin();
  AndroidInitializationSettings androidInitializationSettings =
      const AndroidInitializationSettings('@mipmap/ic_notification');

  final BehaviorSubject<String?> onNotificationClick = BehaviorSubject();

  Future<void> intialize() async {
    final InitializationSettings settings =
        InitializationSettings(android: androidInitializationSettings);

    await _flutterLocalNotificationsPlugin.initialize(settings,
        onSelectNotification: onSelectNotification);
  }

  void sendNotification(String title, String body) async {
    AndroidNotificationDetails _androidNotificationDetails =
        const AndroidNotificationDetails(
      'channelId',
      'channelName',
      importance: Importance.max,
      priority: Priority.high,
    );

    NotificationDetails notificationDetails =
        NotificationDetails(android: _androidNotificationDetails);
    await _flutterLocalNotificationsPlugin.show(
        1, title, body, notificationDetails);
  }

  void scheduleNotification(String title, String body) async {
    AndroidNotificationDetails _androidNotificationDetails =
        const AndroidNotificationDetails(
      'channelId',
      'channelName',
      importance: Importance.max,
      priority: Priority.high,
    );

    NotificationDetails notificationDetails =
        NotificationDetails(android: _androidNotificationDetails);
    await _flutterLocalNotificationsPlugin.periodicallyShow(
        1, title, body, RepeatInterval.everyMinute, notificationDetails);
  }

  Future<NotificationDetails> _notificationDetails() async {
    const AndroidNotificationDetails androidNotificationDetails =
        AndroidNotificationDetails('channel_id', 'channel_name',
            channelDescription: 'description',
            importance: Importance.max,
            priority: Priority.max,
            playSound: true);

    return const NotificationDetails(
      android: androidNotificationDetails,
    );
  }

  Future<void> showNotificationWithPayload(
      {required int id,
      required String title,
      required String body,
      required String payload}) async {
    final details = await _notificationDetails();
    await _flutterLocalNotificationsPlugin.show(id, title, body, details,
        payload: payload);
  }

  void onDidReceiveLocalNotification(
      int id, String? title, String? body, String? payload) {
    print('id $id');
  }

  void onSelectNotification(String? payload) {
    print('payload $payload');
    if (payload != null && payload.isNotEmpty) {
      onNotificationClick.add(payload);
    }
  }
}

/*import 'package:flutter/material.dart';
import 'package:timezone/data/latest.dart' as tz;
import 'package:timezone/timezone.dart' as tz;

class HomeNotification extends StatefulWidget {
  const HomeNotification({Key? key}) : super(key: key);

  @override
  State<HomeNotification> createState() => _HomeState();
}

class _HomeState extends State<HomeNotification> {
  late final LocalNotificationService service;
  TextEditingController notificationTitle = TextEditingController();
  TextEditingController notificationDescrp = TextEditingController();

  @override
  void initState() {
    service = LocalNotificationService();
    service.intialize();
    listenToNotification();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Flutter Notification Demo'),
        centerTitle: true,
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(24.0),
          child: Center(
            child: SingleChildScrollView(
              child: SizedBox(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    const Text(
                      'This is a demo of how to use local notifications in Flutter.',
                      style: TextStyle(fontSize: 20),
                    ),
                    Padding(
                      padding: EdgeInsets.all(20),
                      child: TextField(
                        controller: notificationTitle,
                        decoration: const InputDecoration(
                          border: OutlineInputBorder(),
                          labelText: "Enter Title",
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(20),
                      child: TextField(
                        controller: notificationDescrp,
                        decoration: const InputDecoration(
                          border: OutlineInputBorder(),
                          labelText: "Enter Description",
                        ),
                      ),
                    ),
                    ElevatedButton(
                      onPressed: () async {
                        await service.showNotification(
                            id: 0,
                            title: notificationTitle.text,
                            body: notificationDescrp.text);
                      },
                      child: const Text('Show Local Notification'),
                    ),
                    ElevatedButton(
                      onPressed: () async {
                        await service.showScheduledNotification(
                          id: 0,
                          title: notificationTitle.text,
                          body: notificationDescrp.text,
                          seconds: 4,
                        );
                      },
                      child: const Text('Show Scheduled Notification'),
                    ),
                    ElevatedButton(
                      onPressed: () async {
                        await service.showNotificationWithPayload(
                            id: 0,
                            title: notificationTitle.text,
                            body: notificationDescrp.text,
                            payload: 'payload navigation');
                      },
                      child: const Text('Show Notification With Payload'),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }

  void listenToNotification() =>
      service.onNotificationClick.stream.listen(onNotificationListener);

  void onNotificationListener(String? payload) {
    if (payload != null && payload.isNotEmpty) {
      print('payload $payload');

      Navigator.push(context, MaterialPageRoute(
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

class LocalNotificationService {
  LocalNotificationService();

  final _localNotificationService = FlutterLocalNotificationsPlugin();

  final BehaviorSubject<String?> onNotificationClick = BehaviorSubject();

  Future<void> intialize() async {
    tz.initializeTimeZones();
    const AndroidInitializationSettings androidInitializationSettings =
    AndroidInitializationSettings('@mipmap/ic_launcher');

    */ /*  IOSInitializationSettings iosInitializationSettings =
    IOSInitializationSettings(
      requestAlertPermission: true,
      requestBadgePermission: true,
      requestSoundPermission: true,
      onDidReceiveLocalNotification: onDidReceiveLocalNotification,
    );
*/ /*
    const InitializationSettings settings = InitializationSettings(
      android: androidInitializationSettings,
    );

    await _localNotificationService.initialize(
      settings,
      onSelectNotification: onSelectNotification,
    );
  }

  Future<NotificationDetails> _notificationDetails() async {
    const AndroidNotificationDetails androidNotificationDetails =
    AndroidNotificationDetails('channel_id', 'channel_name',
        channelDescription: 'description',
        importance: Importance.max,
        priority: Priority.max,
        playSound: true);

    return const NotificationDetails(
      android: androidNotificationDetails,
    );
  }

  Future<void> showNotification({
    required int id,
    required String title,
    required String body,
  }) async {
    final details = await _notificationDetails();
    await _localNotificationService.show(id, title, body, details);
  }

  Future<void> showScheduledNotification(
      {required int id,
        required String title,
        required String body,
        required int seconds}) async {
    final details = await _notificationDetails();
    await _localNotificationService.zonedSchedule(
      id,
      title,
      body,
      tz.TZDateTime.from(
        DateTime.now().add(Duration(seconds: seconds)),
        tz.local,
      ),
      details,
      androidAllowWhileIdle: true,
      uiLocalNotificationDateInterpretation:
      UILocalNotificationDateInterpretation.absoluteTime,
    );
  }

  Future<void> showNotificationWithPayload(
      {required int id,
        required String title,
        required String body,
        required String payload}) async {
    final details = await _notificationDetails();
    await _localNotificationService.show(id, title, body, details,
        payload: payload);
  }

  void onDidReceiveLocalNotification(
      int id, String? title, String? body, String? payload) {
    print('id $id');
  }

  void onSelectNotification(String? payload) {
    print('payload $payload');
    if (payload != null && payload.isNotEmpty) {
      onNotificationClick.add(payload);
    }
  }
}*/
