import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:go_router/go_router.dart';
import 'package:seyamy/config/routes/app_rout.dart';
import 'package:seyamy/core/utils/app_assets.dart';
import 'package:seyamy/core/utils/helper.dart';

import '../../../../core/utils/app_colors.dart';
import '../../../../core/utils/app_prefs.dart';
import '../../../../core/utils/injection_container.dart';
import '../../../../core/utils/langauge_manager.dart';
import '../manger/theme_cubit/theme_cubit.dart';
import '../manger/theme_cubit/theme_state.dart';
import '../widgets/container_widget.dart';

class MoreBody extends StatefulWidget {
  const MoreBody({Key? key}) : super(key: key);

  @override
  State<MoreBody> createState() => _MoreBodyState();
}

class _MoreBodyState extends State<MoreBody> {
  final AppPreferences _appPreferences = sl<AppPreferences>();

  @override
  Widget build(BuildContext context) {
    final themeCubit = BlocProvider.of<ThemeCubit>(context);
    return BlocBuilder<ThemeCubit, AppTheme>(
      builder: (context, state) {
        return Column(
          children: [
            20.height,
            ContainerWidget(
              body: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  ListTile(
                    leading: Image.asset(Assets.iconsIcLauncher),
                    title: Text(
                      'مزايا التطبيق',
                      style: context.subtitle2(),
                    ),
                    trailing: Icon(
                      Icons.arrow_forward_ios,
                      color: themeCubit.them
                          ? AppColors.labelColor
                          : AppColors.whiteColor,
                    ),
                    onTap: () {
                      context.push(AppRouts.advantagesScreen);
                    },
                  ),
                ],
              ),
            ),
            32.height,
            ContainerWidget(
              body: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  ListTile(
                    title: Text(
                      'ذكرني بصيام الاثنين والخميس',
                      style: context
                          .subtitle2()
                          .copyWith(fontSize: 15.sp, height: 2),
                    ),
                    subtitle: Text(
                      'فعلها اذا كنت تريد استلام اشعارات بصيام الاثنين والخميس كل اسبوع',
                      style: context.caption().copyWith(height: 1.81),
                    ),
                    trailing: Switch(
                      value: false,
                      onChanged: (value) {},
                    ),
                  ),
                ],
              ),
            ),
            32.height,
            ContainerWidget(
              body: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: Text(
                      'الشكل',
                      style: context.caption(),
                    ),
                  ),
                  ListTile(
                    title: Text(
                      'الوضع الداكن',
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
                      'تلقائي',
                      style: context
                          .subtitle2()
                          .copyWith(fontSize: 15.sp, height: 2),
                    ),
                    subtitle: Text(
                      'فعلها اذا كنت تريد تغيير واجهة التطبيق تلقائيا حسب وضع نظامك',
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
            ),
            32.height,
            ContainerWidget(
              body: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: Text(
                      'قد يهمك',
                      style: context.caption(),
                    ),
                  ),
                  ListTile(
                    leading: SvgPicture.asset(Assets.iconsWatch),
                    title: Text(
                      'كيفية الاستخدام',
                      style: context.subtitle2(),
                    ),
                    trailing: Icon(
                      Icons.arrow_forward_ios,
                      color: themeCubit.them
                          ? AppColors.labelColor
                          : AppColors.whiteColor,
                    ),
                    onTap: () {},
                  ),
                  ListTile(
                    leading: SvgPicture.asset(Assets.iconsShare),
                    title: Text(
                      'انشر التطبيق',
                      style: context.subtitle2(),
                    ),
                    trailing: Icon(
                      Icons.arrow_forward_ios,
                      color: themeCubit.them
                          ? AppColors.labelColor
                          : AppColors.whiteColor,
                    ),
                    onTap: () {
                      context.push(AppRouts.shareScreen);
                    },
                  ),
                  ListTile(
                    leading: SvgPicture.asset(Assets.iconsRate),
                    title: Text(
                      'تقييم التطبيق',
                      style: context.subtitle2(),
                    ),
                    trailing: Icon(
                      Icons.arrow_forward_ios,
                      color: themeCubit.them
                          ? AppColors.labelColor
                          : AppColors.whiteColor,
                    ),
                    onTap: () {},
                  ),
                ],
              ),
            ),
            32.height,
            ContainerWidget(
              body: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: Text(
                      'المطور',
                      style: context.caption(),
                    ),
                  ),
                  ListTile(
                    leading: SvgPicture.asset(Assets.iconsFollow),
                    title: Text(
                      'تابع المطور',
                      style: context.subtitle2(),
                    ),
                    trailing: Icon(
                      Icons.arrow_forward_ios,
                      color: themeCubit.them
                          ? AppColors.labelColor
                          : AppColors.whiteColor,
                    ),
                    onTap: () {},
                  ),
                  ListTile(
                    leading: SvgPicture.asset(Assets.iconsMail),
                    title: Text(
                      'راسلنا حول التطبيق',
                      style: context.subtitle2(),
                    ),
                    trailing: Icon(
                      Icons.arrow_forward_ios,
                      color: themeCubit.them
                          ? AppColors.labelColor
                          : AppColors.whiteColor,
                    ),
                    onTap: () {},
                  ),
                  ListTile(
                    leading: SvgPicture.asset(Assets.iconsInfo),
                    title: Text(
                      'الاصدار',
                      style: context.subtitle2(),
                    ),
                    trailing: Text(
                      ' V 1.0',
                      style: context.subtitle2(),
                    ),
                  ),
                ],
              ),
            ),
            IconButton(
              icon: const Icon(
                Icons.translate_outlined,
                color: AppColors.yellow,
              ),
              onPressed: () {
                _appPreferences.changeAppLanguage();
                if (context.locale.languageCode == 'ar') {
                  context.setLocale(const Locale('en'));
                } else {
                  context.setLocale(const Locale('ar'));
                }
              },
            ),
            30.height,
          ],
        );
      },
    );
  }

  bool rtl() {
    return context.locale == ARABIC_LOCAL;
  }
}
