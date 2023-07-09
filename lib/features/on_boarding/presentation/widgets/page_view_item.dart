import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:seyamy/core/utils/app_fonts.dart';
import 'package:seyamy/core/utils/helper.dart';

import '../../data/model/on_boarding_model.dart';


class PageViewItem extends StatelessWidget {
  final List<OnBoardingDetails> onBoarding;
  final int index;

  const PageViewItem({
    Key? key,
    required this.onBoarding,
    required this.index,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      physics: const BouncingScrollPhysics(),
      child: Column(
        children: [
          AspectRatio(
            aspectRatio: 1 / 1.01,
            child: Image.asset(
              onBoarding[index].image,
              fit: BoxFit.fill,
            ),
          ),
          const SizedBox(
            height: 15,
          ),
          Padding(
            padding: const EdgeInsets.all(20),
            child: Column(
              children: [
                Text(
                  onBoarding[index].title,
                  style: context.subtitle1().copyWith(
                        fontSize: 20.sp,
                        // color: AppColors.bottomColor,
                      ),
                  textAlign: TextAlign.center,
                ),
                const SizedBox(
                  height: 15,
                ),
                Text(
                  onBoarding[index].text,
                  style: context.bodyText1().copyWith(
                        // color: AppColors.subLightColor,
                        fontWeight: AppFontWeight.medium,
                      ),
                  textAlign: TextAlign.center,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
