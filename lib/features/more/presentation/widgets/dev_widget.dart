import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:package_info_plus/package_info_plus.dart';
import 'package:seyamy/core/utils/function/launch_url.dart';
import 'package:seyamy/core/utils/helper.dart';

import '../../../../core/utils/app_assets.dart';
import '../../../../core/utils/app_colors.dart';
import '../../../../core/utils/app_string.dart';
import '../../../../core/utils/app_values.dart';
import '../manger/theme_cubit/theme_cubit.dart';
import 'container_widget.dart';

class DevWidget extends StatefulWidget {
  const DevWidget({
    super.key,
  });

  @override
  State<DevWidget> createState() => _DevWidgetState();
}

class _DevWidgetState extends State<DevWidget> {
  PackageInfo _packageInfo = PackageInfo(
    appName: 'Unknown',
    packageName: 'Unknown',
    version: 'Unknown',
    buildNumber: 'Unknown',
    buildSignature: 'Unknown',
    installerStore: 'Unknown',
  );

  @override
  void initState() {
    super.initState();
    _initPackageInfo();
  }

  Future<void> _initPackageInfo() async {
    final info = await PackageInfo.fromPlatform();
    setState(() {
      _packageInfo = info;
    });
  }

  @override
  Widget build(BuildContext context) {
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
              context.textTr(AppStrings.developer),
              style: context.titleMedium().copyWith(
                color: AppColors.labelColor,
              ),
            ),
          ),
          ListTile(
            leading: SvgPicture.asset(Assets.iconsFollow),
            title: Text(
              context.textTr(AppStrings.followDeveloper),
              style: context.titleMedium(),
            ),
            trailing: Icon(
              Icons.arrow_forward_ios,
              color:
                  themeCubit.them ? AppColors.labelColor : AppColors.whiteColor,
            ),
            onTap: () {
              launchCustomUrl(context, AppStrings.linkedInLink);
            },
          ),
          ListTile(
            leading: SvgPicture.asset(Assets.iconsDesigner),
            title: Text(
              context.textTr(AppStrings.followDesigner),
              style: context.titleMedium(),
            ),
            trailing: Icon(
              Icons.arrow_forward_ios,
              color:
                  themeCubit.them ? AppColors.labelColor : AppColors.whiteColor,
            ),
            onTap: () {
              launchCustomUrl(context, AppStrings.linkDesigner);
            },
          ),
          ListTile(
            leading: SvgPicture.asset(Assets.iconsMail),
            title: Text(
              context.textTr(AppStrings.contactAbout),
              style: context.titleMedium(),
            ),
            trailing: Icon(
              Icons.arrow_forward_ios,
              color:
                  themeCubit.them ? AppColors.labelColor : AppColors.whiteColor,
            ),
            onTap: () {
              launchCustomUrl(context, AppStrings.mailLink);
            },
          ),
          ListTile(
            leading: SvgPicture.asset(Assets.iconsInfo),
            title: Text(
              context.textTr(AppStrings.version),
              style: context.titleMedium(),
            ),
            trailing: Text(
              'V ${_packageInfo.version.isEmpty ? '0' : _packageInfo.version}',
              style: context.titleMedium(),
            ),
          ),
        ],
      ),
    );
  }
}
