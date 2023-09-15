import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:seyamy/core/utils/app_assets.dart';
import 'package:seyamy/core/utils/app_colors.dart';
import 'package:seyamy/core/utils/app_fonts.dart';
import 'package:seyamy/core/utils/app_string.dart';
import 'package:seyamy/core/utils/helper.dart';

import '../../../more/presentation/manger/theme_cubit/theme_cubit.dart';
import 'cut_circle_widget.dart';

class CircleWidget extends StatelessWidget {
  final int day;

  const CircleWidget({
    super.key,
    required this.day,
  });

  @override
  Widget build(BuildContext context) {
    final themeCubit = BlocProvider.of<ThemeCubit>(context);
    return Stack(
      alignment: Alignment.center,
      children: [
        const CutCircle(),
        Container(
          width: context.width / 1.5,
          height: context.width / 1.5,
          decoration: BoxDecoration(
            borderRadius:
                const BorderRadius.all(Radius.elliptical(372.0, 370.0)),
            color: themeCubit.them
                ? const Color(0xFFF6F7FA)
                : const Color(0xFF203040),
            boxShadow: themeCubit.them
                ? [
                    const BoxShadow(
                      color: Color(0x1C000000),
                      blurRadius: 40.18,
                      offset: Offset(4.02, 4.02),
                      spreadRadius: 0,
                    ),
                    const BoxShadow(
                      color: Color(0xFFFFFFFF),
                      blurRadius: 20.09,
                      offset: Offset(-6.03, -6.03),
                      spreadRadius: 0,
                    ),
                    const BoxShadow(
                      color: Color(0x19718EAB),
                      blurRadius: 4.02,
                      offset: Offset(2.01, 2.01),
                      spreadRadius: 0,
                    )
                  ]
                : [],
          ),
        ),
        Container(
          width: context.width / 1.7,
          height: context.width / 1.7,
          decoration: BoxDecoration(
            borderRadius:
                const BorderRadius.all(Radius.elliptical(372.0, 370.0)),
            color: themeCubit.them
                ? const Color(0xFFFFFFFF)
                : const Color(0xFF203040),
            boxShadow: themeCubit.them
                ? [
                    const BoxShadow(
                      color: Color(0xFFFFFFFF),
                      blurRadius: 28.13,
                      offset: Offset(-4.02, -4.02),
                      spreadRadius: 0,
                    ),
                    const BoxShadow(
                      color: Color(0x26A4AEB7),
                      blurRadius: 32.15,
                      offset: Offset(12.05, 12.05),
                      spreadRadius: 0,
                    ),
                    const BoxShadow(
                      color: Color(0x3FA4AEB7),
                      blurRadius: 18.08,
                      offset: Offset(0, 4.02),
                      spreadRadius: 0,
                    )
                  ]
                : [
                    const BoxShadow(
                      color: Colors.black,
                    ),
                    const BoxShadow(
                      color: Colors.black,
                      spreadRadius: -12.0,
                      blurRadius: 30.0,
                    ),
                  ],
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              day != 0 || day > 0
                  ? Text(
                context.textTr(AppStrings.remainingDays),
                      style: context.subtitle2().copyWith(
                            color: AppColors.yellow,
                          ),
                    )
                  : SvgPicture.asset(Assets.iconsArrow),
              day != 0 || day > 0
                  ? Text(
                      day.toString(),
                      textAlign: TextAlign.left,
                      style: TextStyle(
                        color: themeCubit.them
                            ? AppColors.primaryColor
                            : AppColors.subDarkColor,
                        fontSize: 100.sp,
                        letterSpacing: 0,
                        fontWeight: FontWeight.bold,
                        height: 1,
                      ),
                    )
                  : const SizedBox(),
            ],
          ),
        ),
      ],
    );
  }
}
