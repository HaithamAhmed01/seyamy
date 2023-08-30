import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:lottie/lottie.dart';
import 'package:seyamy/core/utils/app_assets.dart';
import 'package:seyamy/core/utils/app_colors.dart';
import 'package:seyamy/core/utils/helper.dart';
import 'package:seyamy/core/widgets/custom_button.dart';
import 'package:seyamy/features/Home/presentation/manger/home_cubit/home_cubit.dart';
import 'package:seyamy/features/Home/presentation/widgets/circle_widget.dart';
import 'package:seyamy/features/Home/presentation/widgets/dialog_widget.dart';
import 'package:vibration/vibration.dart';

import '../../../more/presentation/manger/theme_cubit/theme_cubit.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<HomeCubit, HomeState>(
      builder: (context, state) {
        var cubit = HomeCubit.get(context);
        final themeCubit = BlocProvider.of<ThemeCubit>(context);
        return SingleChildScrollView(
          physics: const BouncingScrollPhysics(),
          child: Column(
            children: [
              33.height,
              Text(
                'كم يوم تريد أن تصوم ؟',
                style: context.subtitle1().copyWith(
                      color: AppColors.secondaryColor,
                    ),
              ),
              SizedBox(
                height: context.height * .5,
                child: CircleWidget(day: cubit.day),
              ),
              15.height,
              cubit.day != 0
                  ? Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        CustomButton(
                          width: context.width * .5,
                          width2: context.width * .4,
                          text: 'صٌمتٌ يوما',
                          onTap: () {
                            dialog(
                              context: context,
                              widget: Column(
                                children: [
                                  Text(
                                    'تهانينا ، لقد أتتمت يوما',
                                    style: context.subtitle2().copyWith(
                                          color: AppColors.secondaryColor,
                                        ),
                                  ),
                                  10.height,
                                  Text(
                                    '“نسأل الله أن يتقبل منا ومنكم”',
                                    style: context.subtitle2().copyWith(
                                          color: themeCubit.them
                                              ? AppColors.primaryColor
                                              : AppColors.subDarkColor,
                                        ),
                                  ),
                                  10.height,
                                  Lottie.asset(Assets.animationSuccessful),
                                ],
                              ),
                              onPressed: () {
                                Navigator.pop(context);
                              },
                            );
                            cubit.addNum();
                            Vibration.vibrate(duration: 40);
                          },
                        ),
                        16.width,
                        GestureDetector(
                          onTap: () {
                            dialog(
                              context: context,
                              widget: Column(
                                children: [
                                  Text(
                                    'تعديل عدد الايام',
                                    style: context.subtitle2().copyWith(
                                          color: AppColors.secondaryColor,
                                        ),
                                  ),
                                  SizedBox(
                                    height: context.height * .3,
                                    child: CupertinoPicker(
                                      itemExtent: 80,
                                      onSelectedItemChanged: (int index) {
                                        cubit.selectNumber(index);
                                      },
                                      children: List<Widget>.generate(31,
                                          (int index) {
                                        return Center(
                                          child: Text(
                                            '$index',
                                            textAlign: TextAlign.center,
                                            style: TextStyle(
                                              color: themeCubit.them
                                                  ? AppColors.primaryColor
                                                  : AppColors.whiteColor,
                                              fontSize: 40,
                                              fontFamily: 'Cairo',
                                              fontWeight: FontWeight.w300,
                                            ),
                                          ),
                                        );
                                      }),
                                    ),
                                  ),
                                ],
                              ),
                              onPressed: () {
                                cubit.addNumber();
                                Navigator.pop(context);
                              },
                            );
                          },
                          child: Container(
                            width: 48,
                            height: 48,
                            padding: const EdgeInsets.all(8),
                            decoration: ShapeDecoration(
                              shape: RoundedRectangleBorder(
                                side: const BorderSide(
                                  width: 2,
                                  color: AppColors.bottomColor,
                                ),
                                borderRadius: BorderRadius.circular(8),
                              ),
                            ),
                            child: Center(
                              child: SvgPicture.asset(Assets.iconsEdit),
                            ),
                          ),
                        ),
                      ],
                    )
                  : CustomButton(
                      width: context.width * .6,
                      width2: context.width * .5,
                      text: 'إضافة',
                      icon: SvgPicture.asset(Assets.iconsAdd),
                      onTap: () {
                        dialog(
                          context: context,
                          widget: Column(
                            children: [
                              Text(
                                'حدد عدد الايام المراد صيامها',
                                style: context.subtitle2().copyWith(
                                      color: AppColors.secondaryColor,
                                    ),
                              ),
                              SizedBox(
                                height: context.height * .3,
                                child: CupertinoPicker(
                                  itemExtent: 80,
                                  onSelectedItemChanged: (int index) {
                                    cubit.selectNumber(index);
                                  },
                                  children:
                                      List<Widget>.generate(31, (int index) {
                                    return Center(
                                      child: Text(
                                        '$index',
                                        textAlign: TextAlign.center,
                                        style: TextStyle(
                                          color: themeCubit.them
                                              ? AppColors.primaryColor
                                              : AppColors.whiteColor,
                                          fontSize: 40,
                                          fontFamily: 'Cairo',
                                          fontWeight: FontWeight.w300,
                                        ),
                                      ),
                                    );
                                  }),
                                ),
                              ),
                            ],
                          ),
                          onPressed: () {
                            cubit.addNumber();
                            Navigator.pop(context);
                          },
                        );
                      },
                    ),
              30.height,
            ],
          ),
        );
      },
    );
  }
}
