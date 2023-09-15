import 'package:confetti/confetti.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:lottie/lottie.dart';
import 'package:seyamy/core/utils/app_string.dart';
import 'package:seyamy/core/utils/helper.dart';
import 'package:vibration/vibration.dart';

import '../../../../core/utils/app_assets.dart';
import '../../../../core/utils/app_colors.dart';
import '../../../../core/widgets/custom_button.dart';
import '../../../more/presentation/manger/theme_cubit/theme_cubit.dart';
import '../manger/home_cubit/home_cubit.dart';
import 'circle_widget.dart';
import 'dialog_widget.dart';

class BodyWidget extends StatelessWidget {
  const BodyWidget({
    super.key,
    required ConfettiController confettiController,
  }) : _confettiController = confettiController;

  final ConfettiController _confettiController;

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
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: Text(
                  context.textTr(AppStrings.question),
                  style: context.subtitle1().copyWith(
                        color: AppColors.secondaryColor,
                      ),
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
                          text: context.textTr(AppStrings.silenceDay),
                          onTap: () {
                            dialog(
                              context: context,
                              widget: Padding(
                                padding: const EdgeInsets.symmetric(horizontal: 20),
                                child: Column(
                                  children: [
                                    Text(
                                      context.textTr(AppStrings.congratulations),
                                      style: context.subtitle2().copyWith(
                                            color: AppColors.secondaryColor,
                                          ),
                                      textAlign: TextAlign.center,
                                    ),
                                    10.height,
                                    Text(
                                      context.textTr(AppStrings.prayer),
                                      style: context.subtitle2().copyWith(
                                            color: themeCubit.them
                                                ? AppColors.primaryColor
                                                : AppColors.subDarkColor,
                                          ),
                                      textAlign: TextAlign.center,
                                    ),
                                    10.height,
                                    Lottie.asset(Assets.animationSuccessful),
                                  ],
                                ),
                              ),
                              onPressed: () {
                                _confettiController.play();
                                Navigator.pop(context);
                              },
                            );
                            cubit.decreaseDay();
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
                                    context.textTr(AppStrings.editNumber),
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
                      text: context.textTr(AppStrings.add),
                      icon: SvgPicture.asset(Assets.iconsAdd),
                      onTap: () {
                        dialog(
                          context: context,
                          widget: Column(
                            children: [
                              Padding(
                                padding: const EdgeInsets.symmetric(horizontal: 20),
                                child: Text(
                                  context.textTr(AppStrings.determineNumber),
                                  style: context.subtitle2().copyWith(
                                        color: AppColors.secondaryColor,
                                      ),
                                  textAlign: TextAlign.center,
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
