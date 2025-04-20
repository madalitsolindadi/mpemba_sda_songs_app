import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:timezone/timezone.dart' as tz;
import 'package:timezone/data/latest.dart' as tz;

class AppExpiryManager {
  final DateTime expiryDate = DateTime(2024, 12, 09); // Customize the expiry date yyyy-MM-dd
  final DateTime oneDayToExpire = DateTime(2024, 12, 08);
  final DateTime sevenDaysToExpire = DateTime(2024, 12, 02);
  final DateTime fifteenDaysToExpire = DateTime(2024, 11, 24);
  
  
  static final FlutterLocalNotificationsPlugin notificationsPlugin = FlutterLocalNotificationsPlugin();
  static Future<void> onDidReceiveLocalNotification(NotificationResponse notificationResponse) async {}

  AppExpiryManager() {
    initializeNotifications();
  }

  // Initialize the notifications plugin and timezone
  static Future<void> initializeNotifications() async {
    // Initialize timezone
    tz.initializeTimeZones();

    const AndroidInitializationSettings androidSettings = AndroidInitializationSettings('@mipmap/ic_launcher');
    const DarwinInitializationSettings iOSSettings = DarwinInitializationSettings();
    const InitializationSettings initSettings = InitializationSettings(android: androidSettings, iOS: iOSSettings);
    //const InitializationSettings initSettings = InitializationSettings(android: androidSettings);
    await notificationsPlugin.initialize(
      initSettings,
      onDidReceiveNotificationResponse: onDidReceiveLocalNotification,
      onDidReceiveBackgroundNotificationResponse: onDidReceiveLocalNotification,
      );
      // request notification permission for Android
      await notificationsPlugin
      .resolvePlatformSpecificImplementation<AndroidFlutterLocalNotificationsPlugin>()
      ?.requestNotificationsPermission();
  }

  // Check if the app is expired
  bool isAppExpired() {
    DateTime today = DateTime.now();
    return today.isAfter(expiryDate);
  }

  // Check if its 15 days to expire
  bool is15DaysToExpire(){
    DateTime today = DateTime.now();
    if (today.isAfter(fifteenDaysToExpire)){
     return true;
    }
    else{
    return false;
    }
  }
  // Check if its 7 days to expire
  bool is7DaysToExpire(){
    DateTime today = DateTime.now();
    if (today.isAfter(sevenDaysToExpire)){
      return true;
    }
    else{
    return false;
    }
  }
  // Check if its 1 day to expire
  bool is1DayToExpire(){
    DateTime today = DateTime.now();
    if (today.isAfter(oneDayToExpire)){
      return true;
    }
    else{
    return false;
    }
  }

  // Schedule notifications to remind the user of the app expiry
  void scheduleExpiryNotifications() {
    scheduleNotification(expiryDate.subtract(Duration(days: 15)), "Reminder", "Your app will expire in 15 days.");
    scheduleNotification(expiryDate.subtract(Duration(days: 7)), "Reminder", "Your app will expire in 7 days.");
    scheduleNotification(expiryDate.subtract(Duration(days: 1)), "Reminder", "Your app will expire tomorrow.");
  }

  // Schedule a single notification
  static Future<void> scheduleNotification(DateTime scheduledDate, String title, String body) async {
    if (DateTime.now().isBefore(scheduledDate)) {
      await notificationsPlugin.zonedSchedule(
        0, // Unique notification ID
        title,
        body,
        tz.TZDateTime.from(scheduledDate, tz.local), // Convert DateTime to TZDateTime
        const NotificationDetails(
          android: AndroidNotificationDetails(
            'expiry_channel', 
            'App Expiry Notifications', 
            channelDescription: 'Notification channel for app expiry reminders',
            importance: Importance.max,
            priority: Priority.high,
          ),
          iOS: DarwinNotificationDetails(),
        ),
        androidScheduleMode: AndroidScheduleMode.exactAllowWhileIdle, // Ensures delivery even in low-power mode
        uiLocalNotificationDateInterpretation: UILocalNotificationDateInterpretation.wallClockTime,
      );
    }
  }
}



/*import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:flutter/material.dart';
//import 'package:expireit/expireit.dart';
import 'package:timezone/data/latest.dart' as tz;
import 'package:timezone/timezone.dart' as tz;

class AppExpiryManager {
  final DateTime expiryDate;
  final FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin;

  AppExpiryManager({
    required this.expiryDate,
    required this.flutterLocalNotificationsPlugin,
  });

  bool isExpired() {
    return DateTime.now().isAfter(expiryDate);
  }

  void scheduleNotifications() async {
    // Initialize timezone data
    tz.initializeTimeZones();

    // Calculate notification dates
    DateTime fifteenDaysBefore = expiryDate.subtract(Duration(days: 15));
    DateTime sevenDaysBefore = expiryDate.subtract(Duration(days: 7));
    DateTime oneDayBefore = expiryDate.subtract(Duration(days: 1));

    // Schedule notifications
    await _scheduleNotification(fifteenDaysBefore, '15 days until expiration!');
    await _scheduleNotification(sevenDaysBefore, '7 days until expiration!');
    await _scheduleNotification(oneDayBefore, '1 day until expiration!');
  }

  Future<void> _scheduleNotification(DateTime notificationDate, String message) async {
    if (notificationDate.isAfter(DateTime.now())) {
      const AndroidNotificationDetails androidPlatformChannelSpecifics =
          AndroidNotificationDetails(
        'expiry_channel', // Channel ID
        'Expiry Notifications', // Channel Name
        channelDescription: 'Notifications for app expiration reminders',
        importance: Importance.max,
        priority: Priority.high,
        showWhen: true,
        playSound: true,
        enableVibration: true,
        // Set the notification to be ongoing and add actions
      );

      const NotificationDetails platformChannelSpecifics =
          NotificationDetails(android: androidPlatformChannelSpecifics);

      // Create a close action for the notification
      await flutterLocalNotificationsPlugin.zonedSchedule(
        0, // Notification ID
        'Expiry Notification',
        message,
        tz.TZDateTime.from(notificationDate, tz.local), // Convert to TZDateTime
        platformChannelSpecifics,
        androidScheduleMode: AndroidScheduleMode.exactAllowWhileIdle,
        uiLocalNotificationDateInterpretation: UILocalNotificationDateInterpretation.absoluteTime,
      );

      // Add action to close the notification
      await flutterLocalNotificationsPlugin.resolvePlatformSpecificImplementation<AndroidFlutterLocalNotificationsPlugin>()
          ?.createNotificationChannel(AndroidNotificationChannel(
            'expiry_channel', // The id of the channel.
            'Expiry Notifications', // The user-visible name of the channel.
            description: 'Notifications for app expiration reminders', // The user-visible description of the channel.
            importance: Importance.max,
            playSound: true,
            enableVibration: true,
          ));

      await flutterLocalNotificationsPlugin.show(
        0, // Notification ID
        'Expiry Notification',
        message,
        platformChannelSpecifics,
      );
    }
  }

  Future<void> cancelNotification() async {
    await flutterLocalNotificationsPlugin.cancel(0); // Cancel the notification with ID 0
  }
}*/