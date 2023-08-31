import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:seyamy/core/utils/helper.dart';

import '../../../../core/utils/app_colors.dart';
import '../manger/theme_cubit/theme_cubit.dart';

AppBar buildAppBar({
  required BuildContext context,
  required String text,
}) {
  final themeCubit = BlocProvider.of<ThemeCubit>(context);
  return AppBar(
    leading: IconButton(
      onPressed: () => Navigator.pop(context),
      icon: Icon(
        Icons.arrow_back_ios,
        color: themeCubit.them ? AppColors.primaryColor : AppColors.whiteColor,
      ),
    ),
    titleSpacing: 0,
    title: Text(
      text,
      style: context.subtitle2(),
    ),
    centerTitle: false,
  );
}
