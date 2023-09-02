import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:seyamy/core/utils/helper.dart';

import '../../../../config/routes/app_rout.dart';
import '../../../../core/utils/app_assets.dart';
import '../../../../core/utils/app_colors.dart';
import '../manger/theme_cubit/theme_cubit.dart';
import 'container_widget.dart';

class AdvantagesWidget extends StatelessWidget {
  const AdvantagesWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final themeCubit = BlocProvider.of<ThemeCubit>(context);
    return ContainerWidget(
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ListTile(
            leading: Image.asset(Assets.iconsIcLauncher),
            title: Text(
              context.textTr("Application Advantages"),
              style: context.subtitle2(),
            ),
            trailing: Icon(
              Icons.arrow_forward_ios,
              color:
                  themeCubit.them ? AppColors.labelColor : AppColors.whiteColor,
            ),
            onTap: () {
              context.push(AppRouts.advantagesScreen);
            },
          ),
        ],
      ),
    );
  }
}
