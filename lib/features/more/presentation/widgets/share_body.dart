import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:seyamy/core/utils/app_assets.dart';
import 'package:seyamy/core/utils/app_colors.dart';
import 'package:seyamy/core/utils/helper.dart';
import 'package:seyamy/features/more/data/model/ShareContent.dart';

import 'package:seyamy/features/more/presentation/widgets/share_item.dart';

import '../manger/theme_cubit/theme_cubit.dart';

class ShareBody extends StatelessWidget {
  const ShareBody({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final themeCubit = BlocProvider.of<ThemeCubit>(context);
    return Padding(
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
          Expanded(
            child: ListView.builder(
              itemCount: dataShare.length,
              itemBuilder: (context, index) {
                return Padding(
                  padding: const EdgeInsets.only(bottom: 16),
                  child: ShareItem(
                    icon: dataShare[index].icon,
                    text: dataShare[index].text,
                    onTab: dataShare[index].onTab,
                  ),
                );
              },
            ),
          ),
          30.height,
        ],
      ),
    );
  }
}
