import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:seyamy/core/utils/app_string.dart';
import 'package:seyamy/core/utils/helper.dart';
import 'package:seyamy/features/more/presentation/widgets/container_widget.dart';

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
          body: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.all(16.0),
                child: Text(
                  context.textTr(AppStrings.shape),
                  style: context.caption(),
                ),
              ),
              ListTile(
                title: Text(
                  context.textTr(AppStrings.darkMode),
                  style: context.subtitle2(),
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
                      context.subtitle2().copyWith(fontSize: 15.sp, height: 2),
                ),
                subtitle: Text(
                  context.textTr(AppStrings.automaticContent),
                  style: context.caption().copyWith(height: 1.81),
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
