import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:seyamy/core/utils/app_colors.dart';
import 'package:seyamy/features/on_boarding/presentation/view/widgets/on_boarding_body.dart';

class OnBoardingScreen extends StatelessWidget {
  const OnBoardingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(
      const SystemUiOverlayStyle(
        statusBarColor: AppColors.backgroundColor,
        statusBarIconBrightness: Brightness.dark,
        systemNavigationBarColor: AppColors.backgroundColor,
        systemNavigationBarDividerColor: AppColors.backgroundColor,
        systemNavigationBarIconBrightness: Brightness.dark,
      ),
    );
    return const SafeArea(
      child: Scaffold(
        backgroundColor: AppColors.backgroundColor,
        body: OnBoardingBody(),
      ),
    );
  }
}
