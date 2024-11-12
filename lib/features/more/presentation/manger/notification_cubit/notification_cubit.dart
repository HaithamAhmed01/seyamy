import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:seyamy/core/notifications/notification_helper.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../../../../core/notifications/notifications_utils.dart';

part 'notification_state.dart';

class NotificationCubit extends Cubit<NotificationState> {
  final SharedPreferences preferences;

  NotificationCubit({required this.preferences})
      : super(NotificationState.disabled) {
    _initializeNotification();
  }

  static NotificationCubit get(context) =>
      BlocProvider.of<NotificationCubit>(context);

  void _initializeNotification() {
    final savedNotification = preferences.getString('notification');
    if (savedNotification != null) {
      emit(NotificationState.values.firstWhere((notification) =>
          notification.toString() ==
          'NotificationState.$savedNotification'));
    }
  }

  Future<void> setNotification(
      NotificationState notificationState) async {
    await preferences.setString(
        'notification', notificationState.toString().split('.').last);
    emit(notificationState);
  }

  void toggleNotifications() {
    if (state != NotificationState.enabled) {
      // Disable notifications
      NotificationUtils.showAlarmNotificationFastingScheduled();
      setNotification(NotificationState.enabled);
      emit(NotificationState.enabled);
    } else {
      // Enable notifications
      NotificationController.cancelFastingScheduledNotifications();
      setNotification(NotificationState.disabled);
      emit(NotificationState.disabled);
    }
  }
}
