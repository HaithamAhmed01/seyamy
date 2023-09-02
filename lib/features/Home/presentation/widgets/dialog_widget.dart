import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:seyamy/core/utils/app_colors.dart';
import 'package:seyamy/core/utils/helper.dart';

import '../../../../core/widgets/custom_button.dart';
import '../../../../core/widgets/custom_outline_buttom.dart';
import '../../../more/presentation/manger/theme_cubit/theme_cubit.dart';

void dialog(
    {required BuildContext context,
      required Widget widget,
      required VoidCallback onPressed}) {
  final themeCubit = BlocProvider.of<ThemeCubit>(context);
  showDialog(
    context: context,
    builder: (context) => AlertDialog(
      contentPadding: const EdgeInsets.all(0),
      content: Container(
        height: context.height * .55,
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
              widget,
              const Spacer(),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  CustomButton(
                    width: context.width * .3,
                    width2: context.width * .2,
                    text: context.textTr("Ok"),
                    onTap: onPressed,
                  ),
                  16.width,
                  CustomOutlineButton(
                    width: context.width * .3,
                    width2: context.width * .2,
                    color: themeCubit.them
                        ? AppColors.subLightColor
                        : AppColors.whiteColor,
                    text: context.textTr("Cancel"),
                    onTap: () {
                      Navigator.pop(context);
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
