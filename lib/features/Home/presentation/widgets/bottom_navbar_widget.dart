import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:seyamy/core/utils/app_assets.dart';
import 'package:seyamy/core/utils/app_colors.dart';
import 'package:seyamy/core/utils/app_string.dart';
import 'package:seyamy/core/utils/helper.dart';
import 'package:seyamy/features/Home/presentation/manger/layout_cubit/cubit.dart';

import '../../../more/presentation/manger/theme_cubit/theme_cubit.dart';
import '../../../more/presentation/manger/theme_cubit/theme_state.dart';

class BottomNavBarWidget extends StatelessWidget {
  const BottomNavBarWidget({
    super.key,
    required this.cubit,
  });

  final LayoutCubit cubit;

  @override
  Widget build(BuildContext context) {
    var bottomNavCurrentIndex = cubit.bottomNavCurrentIndex;
    final themeCubit = BlocProvider.of<ThemeCubit>(context);
    return BlocConsumer<ThemeCubit, AppTheme>(
      listener: (context, state) {
        // TODO: implement listener
      },
      builder: (context, state) {
        return BottomNavigationBar(
          onTap: (index) {
            cubit.changeBottomNav(index);
          },
          currentIndex: bottomNavCurrentIndex,
          items: [
            BottomNavigationBarItem(
              icon: bottomNavCurrentIndex == 0
                  ? themeCubit.them
                      ? SvgPicture.asset(
                          Assets.iconsHome,
                        )
                      : SvgPicture.asset(
                          Assets.iconsHome,
                          color: AppColors.secondaryColor,
                        )
                  : SvgPicture.asset(
                      Assets.iconsHome,
                      color: AppColors.labelColor,
                    ),
              label: context.textTr(AppStrings.home),
            ),
            BottomNavigationBarItem(
              icon: bottomNavCurrentIndex == 1
                  ? themeCubit.them
                      ? SvgPicture.asset(
                          Assets.iconsFadl,
                        )
                      : SvgPicture.asset(
                          Assets.iconsFadl,
                          color: AppColors.secondaryColor,
                        )
                  : SvgPicture.asset(
                      Assets.iconsFadl,
                      color: AppColors.labelColor,
                    ),
              label: context.textTr(AppStrings.advantagesFasting),
            ),
            BottomNavigationBarItem(
              icon: bottomNavCurrentIndex == 2
                  ? themeCubit.them
                      ? SvgPicture.asset(
                          Assets.iconsMore,
                        )
                      : SvgPicture.asset(
                          Assets.iconsMore,
                          color: AppColors.secondaryColor,
                        )
                  : SvgPicture.asset(
                      Assets.iconsMore,
                      color: AppColors.labelColor,
                    ),
              label: context.textTr(AppStrings.more),
            ),
          ],
        );
      },
    );
  }
}
