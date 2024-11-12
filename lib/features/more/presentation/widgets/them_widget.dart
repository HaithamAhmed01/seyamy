import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:seyamy/core/utils/app_string.dart';
import 'package:seyamy/core/utils/helper.dart';
import 'package:seyamy/features/more/presentation/widgets/container_widget.dart';

import '../../../../core/utils/app_colors.dart';
import '../../../../core/utils/app_values.dart';
import '../manger/theme_cubit/theme_cubit.dart';
import '../manger/theme_cubit/theme_state.dart';

class ThemWidget extends StatelessWidget {
  const ThemWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ThemeCubit, AppTheme>(
      builder: (context, state) {
        final themeCubit = BlocProvider.of<ThemeCubit>(context);
        return ContainerWidget(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: AppPadding.p16,
                  vertical: AppPadding.p8,
                ),
                child: Text(
                  context.textTr(AppStrings.theme),
                  style: context.titleMedium().copyWith(
                    color: AppColors.labelColor,
                  ),
                ),
              ),
              ListTile(
                title: Text(
                  context.textTr(AppStrings.darkMode),
                  style: context.titleMedium(),
                ),
                trailing: Switch(
                  value: themeCubit.state == AppTheme.dark,
                  onChanged: (value) {
                    if (value) {
                      themeCubit.setTheme(AppTheme.dark);
                    } else {
                      themeCubit.setTheme(AppTheme.light);
                    }
                  },
                ),
              ),
              ListTile(
                title: Text(
                  context.textTr(AppStrings.automatic),
                  style:
                      context.titleMedium().copyWith(fontSize: 15.sp, height: 2),
                ),
                subtitle: Text(
                  context.textTr(AppStrings.automaticContent),
                  style: context.labelMedium().copyWith(height: 1.81),
                ),
                trailing: Switch(
                  value: themeCubit.state == AppTheme.system,
                  onChanged: (value) {
                    if (value) {
                      themeCubit.setTheme(AppTheme.system);
                    } else {
                      themeCubit.setTheme(AppTheme.light);
                    }
                  },
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
