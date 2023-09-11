import 'package:awesome_notifications/awesome_notifications.dart';
import 'package:flutter/material.dart';
import 'package:seyamy/core/utils/app_colors.dart';

class NotificationController {
  static ReceivedAction? initialAction;

  ///  *********************************************
  ///     INITIALIZATIONS
  ///  *********************************************
  ///
  static Future<void> initializeLocalNotifications() async {
    await AwesomeNotifications().initialize(
        'resource://drawable/res_app_icon',
        [
          NotificationChannel(
            channelKey: 'basic_channel',
            channelName: 'Reminders',
            channelGroupKey: 'basic_channel',
            groupKey: 'basic_channel',
            enableVibration: true,
            channelDescription: 'Notification',
            playSound: true,
            onlyAlertOnce: true,
            soundSource: 'resource://raw/res_alert',
            groupAlertBehavior: GroupAlertBehavior.Children,
            importance: NotificationImportance.High,
            defaultPrivacy: NotificationPrivacy.Public,
            defaultColor: AppColors.primaryColor,
            ledColor: AppColors.primaryColor,
          ),
          NotificationChannel(
            channelKey: 'alert_channel',
            channelName: 'Alerts',
            channelGroupKey: 'alert_channel',
            groupKey: 'alert_channel',
            enableVibration: true,
            channelDescription: 'Alerts Notification',
            playSound: true,
            onlyAlertOnce: true,
            soundSource: 'resource://raw/res_notifications',
            groupAlertBehavior: GroupAlertBehavior.Children,
            importance: NotificationImportance.High,
            defaultPrivacy: NotificationPrivacy.Public,
            defaultColor: AppColors.primaryColor,
            ledColor: AppColors.primaryColor,
          ),
        ],
        channelGroups: [
          NotificationChannelGroup(
              channelGroupkey: 'basic_channel', channelGroupName: 'Reminders'),
          NotificationChannelGroup(
              channelGroupkey: 'alert_channel', channelGroupName: 'Alerts'),
        ],
        debug: false);
  }

  ///  *********************************************
  ///     NOTIFICATION EVENTS
  ///  *********************************************
  ///
  @pragma('vm:entry-point')
  static Future<void> onActionReceivedMethod(
      ReceivedAction receivedAction) async {}

  static Future<void> resetBadgeCounter() async {
    await AwesomeNotifications().resetGlobalBadge();
  }

  static Future<void> cancelNotifications() async {
    await AwesomeNotifications().cancelAll();
  }

  static Future<void> cancelFastingNotifications() async {
    // Use the same ID as in scheduleNotifications
    await AwesomeNotifications().cancel(1);
    await AwesomeNotifications().cancel(2);
  }

  static Future<void> cancelFastingScheduledNotifications() async {
    await AwesomeNotifications().cancel(3);
    await AwesomeNotifications().cancel(4);
    await AwesomeNotifications().cancel(5);
    await AwesomeNotifications().cancel(6);
  }
}
