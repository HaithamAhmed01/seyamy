import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:go_router/go_router.dart';
import 'package:seyamy/core/utils/app_string.dart';
import 'package:seyamy/core/utils/helper.dart';
import 'package:store_redirect/store_redirect.dart';

import '../../../../config/routes/app_rout.dart';
import '../../../../core/utils/app_assets.dart';
import '../../../../core/utils/app_colors.dart';
import '../manger/theme_cubit/theme_cubit.dart';
import 'container_widget.dart';


class UtilsWidget extends StatelessWidget {
  const UtilsWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final themeCubit = BlocProvider.of<ThemeCubit>(context);
    return ContainerWidget(
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Text(
              context.textTr(AppStrings.mightInterest),
              style: context.caption(),
            ),
          ),
          ListTile(
            leading: SvgPicture.asset(Assets.iconsWatch),
            title: Text(
              context.textTr(AppStrings.howToUse),
              style: context.subtitle2(),
            ),
            trailing: Icon(
              Icons.arrow_forward_ios,
              color:
                  themeCubit.them ? AppColors.labelColor : AppColors.whiteColor,
            ),
            onTap: () {},
          ),
          ListTile(
            leading: SvgPicture.asset(Assets.iconsShare),
            title: Text(
              context.textTr(AppStrings.shareApp),
              style: context.subtitle2(),
            ),
            trailing: Icon(
              Icons.arrow_forward_ios,
              color:
                  themeCubit.them ? AppColors.labelColor : AppColors.whiteColor,
            ),
            onTap: () {
              context.push(AppRouts.shareScreen);
            },
          ),
          ListTile(
            leading: SvgPicture.asset(Assets.iconsRate),
            title: Text(
              context.textTr(AppStrings.rate),
              style: context.subtitle2(),
            ),
            trailing: Icon(
              Icons.arrow_forward_ios,
              color:
                  themeCubit.them ? AppColors.labelColor : AppColors.whiteColor,
            ),
            onTap: () {
              StoreRedirect.redirect(
                androidAppId: "com.seyamy.seyamy",
                iOSAppId: "",
              );
            },
          ),
        ],
      ),
    );
  }
}
