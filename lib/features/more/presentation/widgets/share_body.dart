import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:seyamy/core/utils/app_assets.dart';
import 'package:seyamy/core/utils/app_colors.dart';
import 'package:seyamy/core/utils/helper.dart';
import 'package:seyamy/features/more/presentation/widgets/container_widget.dart';

import '../manger/theme_cubit/theme_cubit.dart';

class ShareBody extends StatelessWidget {
  const ShareBody({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final themeCubit = BlocProvider.of<ThemeCubit>(context);
    return SingleChildScrollView(
      physics: const BouncingScrollPhysics(),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            20.height,
            Center(
              child: AspectRatio(
                aspectRatio: 1 / .5,
                child: Image.asset(
                  themeCubit.them
                      ? Assets.imagesShapeLight
                      : Assets.imagesShapeDark,
                ),
              ),
            ),
            50.height,
            Text(
              'شارك التطبيق وادعمنا ',
              style: context.subtitle2().copyWith(
                    color: themeCubit.them
                        ? AppColors.primaryLightColor
                        : AppColors.subDarkColor,
                    fontSize: 12.sp,
                  ),
            ),
            16.height,
            ContainerWidget(
              body: ListTile(
                leading: SvgPicture.asset(Assets.iconsFacebook),
                title: Text(
                  'شارك التطبيق علي فيسبوك',
                  style: context.subtitle2(),
                ),
              ),
            ),
            16.height,
            ContainerWidget(
              body: ListTile(
                leading: SvgPicture.asset(Assets.iconsTelegram),
                title: Text(
                  'شارك التطبيق علي تيليجرام',
                  style: context.subtitle2(),
                ),
              ),
            ),
            16.height,
            ContainerWidget(
              body: ListTile(
                leading: SvgPicture.asset(Assets.iconsWhatsapp),
                title: Text(
                  'شارك التطبيق علي واتساب',
                  style: context.subtitle2(),
                ),
              ),
            ),
            16.height,
            ContainerWidget(
              body: ListTile(
                leading: SvgPicture.asset(Assets.iconsCopy),
                title: Text(
                  'اضغط لنسخ الرابط',
                  style: context.subtitle2(),
                ),
              ),
            ),
            30.height,
          ],
        ),
      ),
    );
  }
}
