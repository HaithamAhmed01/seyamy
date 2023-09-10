import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'core/notifications/notification_helper.dart';
import 'core/notifications/notifications_utils.dart';
import 'core/utils/bloc_observer.dart';
import 'core/utils/injection_container.dart' as di;
import 'my_app.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await EasyLocalization.ensureInitialized();
  await NotificationController.initializeLocalNotifications();
  GeneralNotifications().notifications();
  await di.init();

  SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
    DeviceOrientation.portraitDown,
  ]).then((_) {
    Bloc.observer = AppObserver();
    runApp(const MyApp());
  });
}
