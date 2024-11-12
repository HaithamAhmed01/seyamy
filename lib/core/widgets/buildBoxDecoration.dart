import 'package:flutter/material.dart';

import '../../features/more/presentation/manger/theme_cubit/theme_cubit.dart';
import '../utils/app_colors.dart';
import '../utils/app_values.dart';

BoxDecoration buildBoxDecoration() {
  return const BoxDecoration(
    gradient: LinearGradient(
      begin: Alignment(0.00, -1.00),
      end: Alignment(0, 1),
      colors: [
        AppColors.primaryColor,
        AppColors.secondaryColor,
        AppColors.secondaryColor,
        AppColors.secondaryColor,
      ],
    ),
  );
}

ShapeDecoration buildShapeDecoration(ThemeCubit themeCubit) {
  return ShapeDecoration(
    color:
        themeCubit.them ? AppColors.whiteColor : AppColors.secondaryDarkColor,
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(14),
    ),
    shadows: themeCubit.them
        ? const [
            BoxShadow(
              color: Color(0x0C000000),
              blurRadius: 10,
              offset: Offset(0, 4),
              spreadRadius: 0,
            )
          ]
        : const [
            BoxShadow(
              color: Color(0x51000000),
              blurRadius: 16,
              offset: Offset(0, 8),
              spreadRadius: 0,
            ),
            BoxShadow(
              color: Color(0x0A000000),
              blurRadius: 4,
              offset: Offset(0, 2),
              spreadRadius: 0,
            )
          ],
  );
}

ShapeDecoration buildLightShapeDecoration() {
  return ShapeDecoration(
    color: Colors.white,
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(8),
    ),
    shadows: const [
      BoxShadow(
        color: Color(0x1400727A),
        blurRadius: 16,
        offset: Offset(0, 4),
        spreadRadius: 0,
      )
    ],
  );
}

ShapeDecoration buildLightShapeDecoration2() {
  return ShapeDecoration(
    color: Colors.white,
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(12),
    ),
    shadows: [
      BoxShadow(
        color: Color(0x1400727A),
        blurRadius: 16,
        offset: Offset(0, 4),
        spreadRadius: 0,
      )
    ],
  );
}

ShapeDecoration buildLightShapeDecoration3() {
  return ShapeDecoration(
    color: Colors.white,
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(AppPadding.p16),
    ),
    shadows: const [
      BoxShadow(
        color: Color(0x0F000000),
        blurRadius: 16,
        offset: Offset(0, 5),
        spreadRadius: 0,
      )
    ],
  );
}

ShapeDecoration buildDarkShapeDecoration() {
  return ShapeDecoration(
    color: Colors.white,
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(AppPadding.p8),
    ),
    shadows: const [
      BoxShadow(
        color: Color(0x19000000),
        blurRadius: 16,
        offset: Offset(0, 8),
        spreadRadius: 0,
      )
    ],
  );
}

OutlineInputBorder outlineInputBorder([color]) {
  return OutlineInputBorder(
    borderRadius: BorderRadius.circular(AppPadding.p8),
    borderSide: BorderSide(color: color ?? AppColors.labelColor),
  );
}
