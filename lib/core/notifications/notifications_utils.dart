import 'dart:async';
import 'package:awesome_notifications/awesome_notifications.dart';

/* *********************************************
    PERMISSIONS
************************************************ */

class PrayerNotifications {
  notifications() async {
    AwesomeNotifications().isNotificationAllowed().then((isAllowed) async {
      if (!isAllowed) {
        AwesomeNotifications().requestPermissionToSendNotifications();
      } else {
        NotificationUtils.showAlarmNotificationProphet();

        NotificationUtils.showAlarmNotificationCompletePray();
      }
    });
  }
}

class NotificationUtils {
  static Future<void> showAlarmNotificationFasting() async {
    await AwesomeNotifications().createNotification(
      content: NotificationContent(
        id: 1,
        channelKey: 'basic_channel',
        groupKey: 'basic_channel',
        title: 'تذكير بصيام الغد',
        body:
        "يومٌ جديد وفُرصةٌ جديدة للتقرُّبِ إلى الله، فَلا تُفوِّتُها واحرِص على قضاء يومٍ جديدٍ من أيام الصيام المتبقية عليك.",
        showWhen: true,
        wakeUpScreen: true,
        displayOnBackground: true,
        displayOnForeground: true,
        category: NotificationCategory.Reminder,
        notificationLayout: NotificationLayout.BigText,
      ),
      schedule: NotificationCalendar(
        preciseAlarm: true,
        allowWhileIdle: true,
        repeats: true,
        hour: 21,
        // 9 PM
        minute: 0,
        second: 0,
      ),
    );
    await AwesomeNotifications().createNotification(
      content: NotificationContent(
        id: 2,
        channelKey: 'basic_channel',
        groupKey: 'basic_channel',
        title: 'تذكير بصيام الغد',
        body:
        "يومٌ جديد وفُرصةٌ جديدة للتقرُّبِ إلى الله، فَلا تُفوِّتُها واحرِص على قضاء يومٍ جديدٍ من أيام الصيام المتبقية عليك.",
        showWhen: true,
        wakeUpScreen: true,
        displayOnBackground: true,
        displayOnForeground: true,
        category: NotificationCategory.Reminder,
        notificationLayout: NotificationLayout.BigText,
      ),
      schedule: NotificationCalendar(
        preciseAlarm: true,
        allowWhileIdle: true,
        repeats: true,
        hour: 00,
        // 12 AM
        minute: 0,
        second: 0,
      ),
    );
  }

  //*********************************// Prophet Muhammed //**********************//
  static Future<void> showAlarmNotificationProphet() async {
    await AwesomeNotifications().createNotification(
      content: NotificationContent(
        id: 10,
        channelKey: 'basic_channel',
        groupKey: 'basic_channel',
        title: 'صّلِ عَلۓِ مُحَمد',
        body: 'اللهم صّلِ وسَلّمْ عَلۓِ نَبِيْنَا مُحَمد ﷺ',
        displayOnBackground: true,
        displayOnForeground: true,
        wakeUpScreen: true,
        category: NotificationCategory.Reminder,
        autoDismissible: true,
        customSound: 'resource://raw/res_notifications',
      ),
      schedule: NotificationCalendar(
        preciseAlarm: true,
        allowWhileIdle: true,
        repeats: true,
        hour: 10,
        minute: 00,
        second: 00,
      ),
    );

    await AwesomeNotifications().createNotification(
      content: NotificationContent(
        id: 11,
        channelKey: 'basic_channel',
        groupKey: 'basic_channel',
        title: 'صّلِ عَلۓِ مُحَمد',
        body: 'اللَهُمَّ صلِّ وسَلِم وبَارِك على سيدنا محمد (ﷺ)',
        displayOnBackground: true,
        displayOnForeground: true,
        wakeUpScreen: true,
        category: NotificationCategory.Reminder,
        autoDismissible: true,
        customSound: 'resource://raw/res_notifications',
      ),
      schedule: NotificationCalendar(
        preciseAlarm: true,
        allowWhileIdle: true,
        repeats: true,
        hour: 17,
        minute: 00,
        second: 00,
      ),
    );
  }

  static Future<void> showAlarmNotificationCompletePray() async {
    await AwesomeNotifications().createNotification(
      content: NotificationContent(
        id: 12,
        channelKey: 'basic_channel',
        groupKey: 'basic_channel',
        title: 'الصلاة',
        body: 'هل اكملت صلواتك اليوم ؟',
        displayOnBackground: true,
        displayOnForeground: true,
        wakeUpScreen: true,
        category: NotificationCategory.Reminder,
        autoDismissible: true,
      ),
      schedule: NotificationCalendar(
        preciseAlarm: true,
        allowWhileIdle: true,
        repeats: true,
        hour: 22,
        minute: 00,
        second: 00,
      ),
    );
  }
}
