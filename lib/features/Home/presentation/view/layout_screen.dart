import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:lottie/lottie.dart';
import 'package:seyamy/core/utils/app_colors.dart';
import 'package:seyamy/core/utils/app_string.dart';
import 'package:seyamy/core/utils/helper.dart';
import 'package:seyamy/core/widgets/custom_button.dart';
import 'package:seyamy/core/widgets/custom_outline_buttom.dart';
import 'package:seyamy/features/Home/presentation/manger/layout_cubit/cubit.dart';
import 'package:seyamy/features/Home/presentation/manger/layout_cubit/state.dart';
import 'package:seyamy/features/Home/presentation/widgets/appbar_widget.dart';
import 'package:seyamy/features/Home/presentation/widgets/bottom_navbar_widget.dart';

import '../../../../core/utils/app_assets.dart';
import '../../../more/presentation/manger/theme_cubit/theme_cubit.dart';

class LayoutScreen extends StatefulWidget {
  const LayoutScreen({super.key});

  @override
  State<LayoutScreen> createState() => _LayoutScreenState();
}

class _LayoutScreenState extends State<LayoutScreen> {
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<LayoutCubit, LayoutState>(
      listener: (context, state) {},
      builder: (context, state) {
        var cubit = LayoutCubit.get(context);
        var bottomNavCurrentIndex = cubit.bottomNavCurrentIndex;
        return WillPopScope(
          onWillPop: dialogExit,
          child: Scaffold(
            appBar: buildAppBar(
              context.textTr(cubit.itemsTabBar[bottomNavCurrentIndex]),
              context,
            ),
            bottomNavigationBar: BottomNavBarWidget(cubit: cubit),
            body: IndexedStack(
              index: bottomNavCurrentIndex,
              children: cubit.bottomScreens,
            ),
          ),
        );
      },
    );
  }

  Future<bool> dialogExit() async {
    final themeCubit = BlocProvider.of<ThemeCubit>(context);
    return await showDialog(
      context: context,
      builder: (context) => AlertDialog(
        contentPadding: const EdgeInsets.all(0),
        content: Container(
          height: context.height * .4,
          width: context.width,
          decoration: ShapeDecoration(
            color: themeCubit.them
                ? AppColors.whiteColor
                : AppColors.secondaryDarkColor,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(30.14),
            ),
          ),
          child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 37),
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16.0),
                  child: Text(
                    context.textTr(AppStrings.youWantToExit),
                    style: context.titleMedium().copyWith(fontSize: 15.sp),
                  ),
                ),
                AspectRatio(
                  aspectRatio: 1 / .5,
                  child: Lottie.asset(Assets.animationWarning),
                ),
                const Spacer(),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    CustomButton(
                      width: context.width * .3,
                      width2: context.width * .2,
                      text: context.textTr(AppStrings.ok),
                      onTap: () {
                        Navigator.of(context).pop(true);
                      },
                    ),
                    16.width,
                    CustomOutlineButton(
                      width: context.width * .3,
                      width2: context.width * .2,
                      color: themeCubit.them
                          ? AppColors.subLightColor
                          : AppColors.whiteColor,
                      text: context.textTr(AppStrings.cancel),
                      onTap: () {
                        Navigator.of(context).pop(false);
                      },
                    ),
                  ],
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
