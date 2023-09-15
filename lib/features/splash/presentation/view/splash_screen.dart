import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:rive/rive.dart';
import 'package:seyamy/core/utils/app_assets.dart';
import 'package:seyamy/core/utils/app_colors.dart';
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
      body: Stack(
        children: [
          Center(
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
          Align(
            alignment: Alignment.bottomCenter,
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.end,
                crossAxisAlignment: CrossAxisAlignment.start,
                textDirection: TextDirection.ltr,
                children: [
                  Text(
                    'Developed By',
                    style: context.subtitle1().copyWith(
                          fontSize: 9.sp,
                          color: AppColors.bottomColor,
                        ),
                    textDirection: TextDirection.ltr,
                  ),
                  Text(
                    'Haitham Ahmed',
                    style: context.subtitle1().copyWith(
                          fontSize: 15.sp,
                          color: AppColors.bottomColor,
                        ),
                  ),
                ],
              ),
            ),
          )
        ],
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
                context.push(AppRouts.layoutScreen)
              }
            else
              {
                // navigate to onBoarding screen
                context.push(AppRouts.onBoardingScreen)
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
