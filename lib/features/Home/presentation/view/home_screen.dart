import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:seyamy/core/utils/app_assets.dart';
import 'package:seyamy/core/utils/app_colors.dart';
import 'package:seyamy/core/utils/helper.dart';
import 'package:seyamy/core/widgets/custom_button.dart';
import 'package:seyamy/features/Home/presentation/manger/home_cubit/home_cubit.dart';
import 'package:seyamy/features/Home/presentation/widgets/circle_widget.dart';
import 'package:vibration/vibration.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var cubit = HomeCubit.get(context);
    return BlocConsumer<HomeCubit, HomeState>(
      listener: (context, state) {
        // TODO: implement listener
      },
      builder: (context, state) {
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
                            cubit.addNum();
                            Vibration.vibrate(duration: 40);
                          },
                        ),
                        16.width,
                        GestureDetector(
                          onTap: () {},
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
                        Vibration.vibrate(duration: 40);
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
