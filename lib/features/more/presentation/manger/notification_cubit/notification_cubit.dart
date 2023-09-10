import 'dart:developer';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:seyamy/core/notifications/notification_helper.dart';

import '../../../../../core/notifications/notifications_utils.dart';

part 'notification_state.dart';

class NotificationCubit extends Cubit<NotificationState> {
  NotificationCubit() : super(NotificationState.disabled);

  static NotificationCubit get(context) =>
      BlocProvider.of<NotificationCubit>(context);

  void toggleNotifications() {
    if (state != NotificationState.enabled) {
      // Disable notifications
      NotificationUtils.showAlarmNotificationFastingScheduled();
      emit(NotificationState.enabled);
    } else {
      // Enable notifications
      NotificationController.cancelFastingScheduledNotifications();
      emit(NotificationState.disabled);
    }
  }
}
