// import 'package:flutter_local_notifications/flutter_local_notifications.dart';

// final FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin =
//     FlutterLocalNotificationsPlugin();

// Future<void> scheduleNotification({
//   required String title,
//   required String body,
//   required DateTime scheduledDateTime,
//   int id = 0,
//   bool repeat = false,
//   int? repeatInterval,
// }) async {
//   final AndroidNotificationDetails androidPlatformChannelSpecifics =
//       AndroidNotificationDetails(
//     'your_channel_id',
//     'your_channel_name',
//     importance: Importance.max,
//     priority: Priority.high,
//   );
//   const NotificationDetails platformChannelSpecifics =
//       NotificationDetails(android: androidPlatformChannelSpecifics);

//   var tz;
//   await flutterLocalNotificationsPlugin.zonedSchedule(
//     id,
//     title,
//     body,
//     tz.TZDateTime.from(scheduledDateTime, tz.local),
//     platformChannelSpecifics,
//     androidAllowWhileIdle: true,
//     uiLocalNotificationDateInterpretation:
//         UILocalNotificationDateInterpretation.absoluteTime,
//     matchDateTimeComponents:
//         repeat ? DateTimeComponents.dayOfWeekAndTime : DateTimeComponents.time,
//     payload: 'notification_payload',
//     androidAllowWhileIdle: true,
//     uiLocalNotificationDateInterpretation:
//         UILocalNotificationDateInterpretation.absoluteTime,
//     payload: 'notification_payload',
//     androidAllowWhileIdle: true,
//     uiLocalNotificationDateInterpretation:
//         UILocalNotificationDateInterpretation.absoluteTime,
//   );
// }

import 'package:flutter_local_notifications/flutter_local_notifications.dart';

FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin =
    FlutterLocalNotificationsPlugin();

// ignore: unused_element
void _scheduleNotification() async {
  var scheduledNotificationDateTime = DateTime.now().add(Duration(seconds: 5));

  var androidPlatformChannelSpecifics = const AndroidNotificationDetails(
    'your channel id',
    'your channel name',
    importance: Importance.max,
    priority: Priority.high,
  );

  var platformChannelSpecifics =
      NotificationDetails(android: androidPlatformChannelSpecifics);

  // ignore: deprecated_member_use
  await flutterLocalNotificationsPlugin.schedule(
    0, // Notification ID
    'Task Reminder', // Notification Title
    'You have a task to complete!', // Notification Body
    scheduledNotificationDateTime,
    platformChannelSpecifics,
    payload: 'item x', // Optional payload
  );
}
