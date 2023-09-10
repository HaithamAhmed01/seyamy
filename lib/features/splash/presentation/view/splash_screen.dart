import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:rive/rive.dart';
import 'package:seyamy/core/utils/app_assets.dart';
import 'package:seyamy/core/utils/helper.dart';

import '../../../../config/routes/app_rout.dart';
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
        child: themeCubit.them
            ? const RiveAnimation.asset(
                Assets.animationMeshGHAMZALIGHT,
              )
            : SizedBox(
                height: context.height * .3,
                width: context.width,
                child: SizedBox(
                  height: context.height,
                  width: context.width,
                  child: const RiveAnimation.asset(
                    Assets.animationMeshGHAMZADark,
                    fit: BoxFit.cover,
                  ),
                ),
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
