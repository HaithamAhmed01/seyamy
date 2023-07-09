import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'core/utils/bloc_observer.dart';
import 'core/utils/injection_container.dart' as di;
import 'my_app.dart';

// https://www.figma.com/file/xbC7UNs6gFplITl2KfJqE5/SEYAMY-FINAL?type=design&node-id=184%3A1761&mode=design&t=hCFnbjBKk8laUXUy-1

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await EasyLocalization.ensureInitialized();
  await di.init();

  SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
    DeviceOrientation.portraitDown,
  ]).then((_) {
    Bloc.observer = AppObserver();
    runApp(const MyApp());
  });
}
