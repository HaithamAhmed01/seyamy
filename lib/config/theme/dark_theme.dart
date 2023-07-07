import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../core/utils/app_colors.dart';
import '../../core/utils/app_fonts.dart';
import 'color_schemes.g.dart';

ThemeData dark = ThemeData(
  colorScheme: darkColorScheme,
  primaryColor: AppColors.primaryColor,
  useMaterial3: true,
  scaffoldBackgroundColor: AppColors.backgroundDarkColor,
  textButtonTheme: TextButtonThemeData(
    style: TextButton.styleFrom(
      primary: AppColors.bottomColor,
    ),
  ),
  appBarTheme: AppBarTheme(
    titleSpacing: 20.0,
    backgroundColor: AppColors.backgroundDarkColor,
    elevation: 0,
    centerTitle: true,
    systemOverlayStyle: const SystemUiOverlayStyle(
      statusBarColor: AppColors.backgroundDarkColor,
      statusBarIconBrightness: Brightness.light,
      systemNavigationBarColor: AppColors.backgroundDarkColor,
      systemNavigationBarDividerColor: AppColors.backgroundDarkColor,
      systemNavigationBarIconBrightness: Brightness.light,
    ),
    titleTextStyle: TextStyle(
      fontFamily: AppFontConstants.fontFamily,
      color: AppColors.whiteColor,
      fontSize: 18.sp,
      fontWeight: FontWeight.bold,
    ),
    iconTheme: const IconThemeData(
      color: AppColors.whiteColor,
    ),
  ),
  textTheme: TextTheme(
    subtitle1: TextStyle(
      fontSize: 18.0.sp,
      fontWeight: AppFontWeight.bold,
      color: AppColors.whiteColor,
    ),
    subtitle2: TextStyle(
      fontSize: 16.0.sp,
      fontWeight: AppFontWeight.bold,
      color: AppColors.whiteColor,
    ),
    button: TextStyle(
      fontSize: 16.sp,
      fontWeight: AppFontWeight.bold,
      color: AppColors.whiteColor,
    ),
    bodyText1: TextStyle(
      fontSize: 14.sp,
      fontWeight: AppFontWeight.semiBold,
      color: AppColors.subDarkColor,
    ),
    bodyText2: TextStyle(
      fontSize: 12.sp,
      fontWeight: AppFontWeight.semiBold,
      color: AppColors.subDarkColor,
    ),
    caption: TextStyle(
      fontSize: 10.sp,
      fontWeight: AppFontWeight.semiBold,
      color: AppColors.subDarkColor,
    ),
  ),
  switchTheme: SwitchThemeData(
    thumbColor: MaterialStateProperty.all<Color>(AppColors.whiteColor),
    trackColor:
        MaterialStateProperty.resolveWith<Color>((Set<MaterialState> states) {
      if (states.contains(MaterialState.selected)) {
        return const Color(0xFF617C98);
      }
      return const Color(0xFF787880);
    }),
    trackOutlineColor:
        MaterialStateProperty.resolveWith<Color>((Set<MaterialState> states) {
      if (states.contains(MaterialState.selected)) {
        return const Color(0xFF617C98);
      }
      return const Color(0xFF787880);
    }),
  ),
  bottomNavigationBarTheme: const BottomNavigationBarThemeData(
    elevation: 20.0,
    backgroundColor: AppColors.secondaryDarkColor,
    type: BottomNavigationBarType.fixed,
    selectedItemColor: AppColors.secondaryColor,
    unselectedItemColor: AppColors.labelColor,
  ),
  inputDecorationTheme: buildInputDecoration(),
  fontFamily: AppFontConstants.fontFamily,
);

InputDecorationTheme buildInputDecoration() {
  return InputDecorationTheme(
    errorStyle: TextStyle(
      fontWeight: FontWeight.w600,
      fontSize: 10.sp,
      letterSpacing: 1,
      fontFamily: AppFontConstants.fontFamily,
    ),
    hintStyle: const TextStyle(
      fontWeight: FontWeight.bold,
      color: Colors.grey,
      fontFamily: AppFontConstants.fontFamily,
    ),
    hoverColor: AppColors.backgroundDarkColor,
    focusColor: AppColors.backgroundDarkColor,
    fillColor: AppColors.backgroundDarkColor,
    filled: true,
    contentPadding: const EdgeInsets.fromLTRB(10.0, 0.0, 10.0, 0.0),
    border: buildOutlineInputBorder(),
    enabledBorder: buildOutlineInputBorder(),
    errorBorder: buildOutlineInputBorder(Colors.red),
    focusedErrorBorder: buildOutlineInputBorder(Colors.red),
    focusedBorder: buildOutlineInputBorder(),
  );
}

OutlineInputBorder buildOutlineInputBorder([color]) {
  return OutlineInputBorder(
    borderRadius: const BorderRadius.only(
        bottomLeft: Radius.circular(17),
        topLeft: Radius.circular(17),
        bottomRight: Radius.circular(17)),
    borderSide: BorderSide(
      color: color ?? AppColors.backgroundDarkColor,
    ),
  );
}
