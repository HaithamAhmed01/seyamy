import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/utils/app_colors.dart';
import '../../../../core/utils/langauge_manager.dart';
import '../manger/theme_cubit/theme_cubit.dart';

class ContainerWidget extends StatelessWidget {
  final Widget body;

  const ContainerWidget({
    super.key,
    required this.body,
  });

  @override
  Widget build(BuildContext context) {
    final themeCubit = BlocProvider.of<ThemeCubit>(context);
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 8),
      decoration: buildShapeDecoration(themeCubit),
      child: body,
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
  
}
