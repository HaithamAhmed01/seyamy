import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../features/more/presentation/manger/theme_cubit/theme_cubit.dart';
import '../utils/app_colors.dart';
import '../utils/app_values.dart';
import 'custom_loading_indicator.dart';

Future<dynamic> buildLoadingDialog(BuildContext context) {
  final themeCubit = BlocProvider.of<ThemeCubit>(context);
  return showDialog(
    context: context,
    barrierDismissible: false,
    builder: (context) => FittedBox(
      fit: BoxFit.scaleDown,
      child: Container(
        decoration: BoxDecoration(
          color: themeCubit.them ? AppColors.backgroundColor : AppColors.backgroundDarkColor,
          borderRadius: BorderRadius.circular(AppPadding.p24),
        ),
        padding: const EdgeInsets.all(AppPadding.p30),
        child: const CustomLoadingIndicator(),
      ),
    ),
  );
}
