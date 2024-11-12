import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

import 'package:seyamy/core/utils/app_assets.dart';
import 'package:seyamy/core/utils/app_colors.dart';
import 'package:seyamy/core/utils/helper.dart';
import 'package:seyamy/features/more/data/model/ShareContent.dart';

import 'package:seyamy/features/more/presentation/widgets/share_item.dart';
import 'package:share_plus/share_plus.dart';

import '../../../../core/utils/app_string.dart';
import '../../../../core/utils/function/launch_url.dart';
import '../manger/theme_cubit/theme_cubit.dart';

class ShareBody extends StatelessWidget {
  const ShareBody({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    List<ShareContent> dataShare = [
      ShareContent(
        text: "Share_header1",
        icon: SvgPicture.asset(Assets.iconsFacebook),
        onTab: () {
          launchCustomUrl(context, AppStrings.facebookLink);
        },
      ),
      ShareContent(
        text: "Share_header2",
        icon: SvgPicture.asset(Assets.iconsTelegram),
        onTab: () {
          launchCustomUrl(context, AppStrings.telegramLink);
        },
      ),
      ShareContent(
        text: "Share_header3",
        icon: SvgPicture.asset(Assets.iconsWhatsapp),
        onTab: () {
          launchCustomUrl(context, AppStrings.whatsappLink);
        },
      ),
      ShareContent(
        text: "Share_header4",
        icon: SvgPicture.asset(Assets.iconsCopy),
        onTab: () {
          Share.share(
            'تطبيق يحتوي علي كل ما يهم المسلم في امور الصيام \n\n${AppStrings.appLink}',
            subject: AppStrings.appName,
          );
        },
      ),
    ];
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
            context.textTr(AppStrings.shareContent),
            style: context.titleMedium().copyWith(
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
                    text: context.textTr(dataShare[index].text),
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
