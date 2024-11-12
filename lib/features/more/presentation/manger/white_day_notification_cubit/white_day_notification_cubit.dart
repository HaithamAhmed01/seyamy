import 'dart:developer';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:seyamy/core/notifications/notification_helper.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../../../../core/notifications/notifications_utils.dart';

part 'white_day_notification_state.dart';

class WhiteDayNotificationCubit extends Cubit<WhiteDayNotificationState> {
  final SharedPreferences preferences;

  WhiteDayNotificationCubit({required this.preferences})
      : super(WhiteDayNotificationState.disabled) {
    _initializeWhiteDayNotification();
  }

  static WhiteDayNotificationCubit get(context) =>
      BlocProvider.of<WhiteDayNotificationCubit>(context);

  void _initializeWhiteDayNotification() {
    final savedNotification = preferences.getString('white_day_notification');
    log("savedNotification ${savedNotification.toString()}");
    if (savedNotification != null) {
      emit(WhiteDayNotificationState.values.firstWhere((notification) =>
          notification.toString() ==
          'WhiteDayNotificationState.$savedNotification'));
    }
  }

  Future<void> setWhiteDayNotification(
      WhiteDayNotificationState notificationState) async {
    await preferences.setString(
        'white_day_notification', notificationState.toString().split('.').last);
    emit(notificationState);
  }

  void toggleWhiteDayNotifications() async {
    if (state != WhiteDayNotificationState.enabled) {
      emit(WhiteDayNotificationState.loading); // Emit loading state

      try {
        // Enable notifications
        await NotificationUtils.showAlarmNotificationWhiteDayScheduled();
        setWhiteDayNotification(WhiteDayNotificationState.enabled);
        emit(WhiteDayNotificationState.enabled);
      } catch (e) {
        emit(WhiteDayNotificationState.disabled); // Handle errors gracefully
      }
    } else {
      // Disable notifications
      NotificationController.cancelWhiteDayScheduledNotifications();
      setWhiteDayNotification(WhiteDayNotificationState.disabled);
      emit(WhiteDayNotificationState.disabled);
    }
  }
}
