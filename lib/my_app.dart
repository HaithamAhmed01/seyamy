import 'package:device_preview/device_preview.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:seyamy/features/Home/presentation/manger/home_cubit/home_cubit.dart';
import 'package:seyamy/features/Home/presentation/manger/layout_cubit/cubit.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'config/locale/app_localizations_setup.dart';
import 'config/routes/app_rout.dart';
import 'core/utils/injection_container.dart';
import 'features/more/presentation/manger/theme_cubit/theme_cubit.dart';
import 'features/more/presentation/manger/theme_cubit/theme_state.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return EasyLocalization(
      path: 'assets/lang',
      saveLocale: true,
      startLocale: AppLocalizationsSetup.supportedLocales.first,
      fallbackLocale: AppLocalizationsSetup.supportedLocales.first,
      supportedLocales: AppLocalizationsSetup.supportedLocales,
      child: DevicePreview(
        enabled: false,
        builder: (context) => const StartApp(),
      ),
    );
  }
}

class StartApp extends StatelessWidget {
  const StartApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
            create: (BuildContext context) => ThemeCubit(
                  preferences: sl.get<SharedPreferences>(),
                )),
        BlocProvider(create: (BuildContext context) => LayoutCubit()),
        BlocProvider(
          create: (BuildContext context) => HomeCubit()
            ..loadDay()
            ..notificationsFasting(),
        ),
      ],
      child: ScreenUtilInit(
        designSize: const Size(360, 690),
        minTextAdapt: true,
        splitScreenMode: true,
        builder: ((context, child) {
          return BlocBuilder<ThemeCubit, AppTheme>(
            builder: (context, state) {
              return MaterialApp.router(
                locale: context.locale,
                builder: DevicePreview.appBuilder,
                debugShowCheckedModeBanner: false,
                supportedLocales: AppLocalizationsSetup.supportedLocales,
                localeResolutionCallback:
                    AppLocalizationsSetup.localeResolutionCallback,
                localizationsDelegates:
                    AppLocalizationsSetup.localizationsDelegates,
                theme: BlocProvider.of<ThemeCubit>(context)
                    .mapStateToThemeData(state),
                routerConfig: AppRouts.router,
              );
            },
          );
        }),
      ),
    );
  }
}
