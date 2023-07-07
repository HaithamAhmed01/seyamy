import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:rive/rive.dart';
import 'package:seyamy/core/utils/helper.dart';
import 'package:seyamy/features/more/presentation/manger/theme_cubit/theme_state.dart';

import '../../../../config/routes/app_rout.dart';
import '../../../../core/utils/app_asstes_path.dart';
import '../../../../core/utils/app_prefs.dart';
import '../../../../core/utils/injection_container.dart';
import '../../../more/presentation/manger/theme_cubit/theme_cubit.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  late Timer _timer;
  final AppPreferences _appPreferences = sl<AppPreferences>();

  @override
  void initState() {
    super.initState();
    _startDelay();
  }

  @override
  Widget build(BuildContext context) {
    final themeCubit = BlocProvider.of<ThemeCubit>(context);
    return Scaffold(
      body: Center(
        child: themeCubit.state == AppTheme.light
            ? const RiveAnimation.asset(
                AnimationAssets.splashLight,
              )
            : const RiveAnimation.asset(
                AnimationAssets.splashDark,
              ),
      ),
    );
  }

  _startDelay() {
    _timer = Timer(2000.milliseconds, _goNext);
  }

  _goNext() async {
    _appPreferences.isOnBoardingScreenViewed().then(
          (isOnBoardingScreenViewed) => {
            if (isOnBoardingScreenViewed)
              {
                // navigate to layoutScreen
                context.pushReplacement(AppRouts.layoutScreen)
              }
            else
              {
                // navigate to onBoarding screen
                context.pushReplacement(AppRouts.onBoardingScreen)
              },
          },
        );
  }

  @override
  void dispose() {
    _timer.cancel();
    super.dispose();
  }
}