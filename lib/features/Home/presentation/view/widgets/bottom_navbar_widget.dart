import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:seyamy/core/utils/app_asstes_path.dart';
import 'package:seyamy/core/utils/app_colors.dart';
import 'package:seyamy/core/utils/helper.dart';
import 'package:seyamy/features/Home/presentation/manger/layout_cubit/cubit.dart';

import '../../../../more/presentation/manger/theme_cubit/theme_cubit.dart';
import '../../../../more/presentation/manger/theme_cubit/theme_state.dart';

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
                          ImageAssets.iconHome,
                        )
                      : SvgPicture.asset(
                          ImageAssets.iconHome,
                          color: AppColors.secondaryColor,
                        )
                  : SvgPicture.asset(
                      ImageAssets.iconHome,
                      color: AppColors.labelColor,
                    ),
              label: 'الرئيسية',
            ),
            BottomNavigationBarItem(
              icon: bottomNavCurrentIndex == 1
                  ? themeCubit.them
                      ? SvgPicture.asset(
                          ImageAssets.iconFadl,
                        )
                      : SvgPicture.asset(
                          ImageAssets.iconFadl,
                          color: AppColors.secondaryColor,
                        )
                  : SvgPicture.asset(
                      ImageAssets.iconFadl,
                      color: AppColors.labelColor,
                    ),
              label: 'فضل الصيام',
            ),
            BottomNavigationBarItem(
              icon: bottomNavCurrentIndex == 2
                  ? themeCubit.them
                      ? SvgPicture.asset(
                          ImageAssets.iconMore,
                        )
                      : SvgPicture.asset(
                          ImageAssets.iconMore,
                          color: AppColors.secondaryColor,
                        )
                  : SvgPicture.asset(
                      ImageAssets.iconMore,
                      color: AppColors.labelColor,
                    ),
              label: context.textTr("more"),
            ),
          ],
        );
      },
    );
  }
}
