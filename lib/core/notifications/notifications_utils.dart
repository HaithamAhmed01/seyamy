import 'dart:async';
import 'package:awesome_notifications/awesome_notifications.dart';

/* *********************************************
    PERMISSIONS
************************************************ */

class GeneralNotifications {
  void notifications() async {
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
        title: "اقترب الفجر، استعد للسحور",
        body: "تجنب الصيام جافًا وتناول وجبة سحور صحية ومغذية",
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
        hour: 2,
        // 2 AM
        minute: 0,
        second: 0,
      ),
    );
  }

  static Future<void> showAlarmNotificationFastingScheduled() async {
    // Calculate the next Sunday and Wednesday dates
    final now = DateTime.now();
    final nextSunday = now.add(Duration(days: DateTime.sunday - now.weekday));
    final nextWednesday =
        now.add(Duration(days: DateTime.wednesday - now.weekday));
    final nextMonday = now.add(Duration(days: DateTime.monday - now.weekday));
    final nextThursday =
        now.add(Duration(days: DateTime.thursday - now.weekday));

    await AwesomeNotifications().createNotification(
      content: NotificationContent(
        id: 3,
        channelKey: 'basic_channel',
        groupKey: 'basic_channel',
        title: 'نذكرك بصيام غدا الاثنين',
        body:
            "عن أبي هريرة رضي الله عنه أن رسول الله صلى الله عليه وسلم قال : تُعرض الأعمال يوم الإثنين والخميس ، فأحب أن يعرض عملي وأنا صائم",
        showWhen: true,
        wakeUpScreen: true,
        displayOnBackground: true,
        displayOnForeground: true,
        category: NotificationCategory.Reminder,
        notificationLayout: NotificationLayout.BigText,
      ),
      schedule: NotificationCalendar(
        weekday: nextSunday.weekday,
        // 7 represents Sunday
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
        id: 4,
        channelKey: 'basic_channel',
        groupKey: 'basic_channel',
        title: "اقترب الفجر، استعد للسحور",
        body: "تجنب الصيام جافًا وتناول وجبة سحور صحية ومغذية",
        showWhen: true,
        wakeUpScreen: true,
        displayOnBackground: true,
        displayOnForeground: true,
        category: NotificationCategory.Reminder,
        notificationLayout: NotificationLayout.BigText,
      ),
      schedule: NotificationCalendar(
        weekday: nextMonday.weekday,
        // 7 represents Sunday
        preciseAlarm: true,
        allowWhileIdle: true,
        repeats: true,
        hour: 2,
        // 2 AM
        minute: 0,
        second: 0,
      ),
    );
    await AwesomeNotifications().createNotification(
      content: NotificationContent(
        id: 5,
        channelKey: 'basic_channel',
        groupKey: 'basic_channel',
        title: 'نذكرك بصيام غدا الخميس',
        body:
            "عن أبي هريرة رضي الله عنه أن رسول الله صلى الله عليه وسلم قال : تُعرض الأعمال يوم الإثنين والخميس ، فأحب أن يعرض عملي وأنا صائم",
        showWhen: true,
        wakeUpScreen: true,
        displayOnBackground: true,
        displayOnForeground: true,
        category: NotificationCategory.Reminder,
        notificationLayout: NotificationLayout.BigText,
      ),
      schedule: NotificationCalendar(
        weekday: nextWednesday.weekday,
        // 3 represents Wednesday
        preciseAlarm: true,
        allowWhileIdle: true,
        repeats: true,
        hour: 21,
        // 9 PM
        minute: 13,
        second: 0,
      ),
    );

    await AwesomeNotifications().createNotification(
      content: NotificationContent(
        id: 6,
        channelKey: 'basic_channel',
        groupKey: 'basic_channel',
        title: "اقترب الفجر، استعد للسحور",
        body: "تجنب الصيام جافًا وتناول وجبة سحور صحية ومغذية",
        showWhen: true,
        wakeUpScreen: true,
        displayOnBackground: true,
        displayOnForeground: true,
        category: NotificationCategory.Reminder,
        notificationLayout: NotificationLayout.BigText,
      ),
      schedule: NotificationCalendar(
        weekday: nextThursday.weekday,
        // 7 represents Sunday
        preciseAlarm: true,
        allowWhileIdle: true,
        repeats: true,
        hour: 2,
        // 2 AM
        minute: 0,
        second: 0,
      ),
    );
  }

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
