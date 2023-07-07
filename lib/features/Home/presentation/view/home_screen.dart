import 'package:flutter/material.dart';
import 'package:seyamy/core/utils/app_colors.dart';
import 'package:seyamy/core/utils/helper.dart';
import 'package:seyamy/core/widgets/custom_button.dart';
import 'package:seyamy/features/Home/presentation/view/widgets/circle_widget.dart';
import 'package:vibration/vibration.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const SizedBox(
          height: 33,
        ),
        Text(
          'كم يوم تريد أن تصوم ؟',
          style: context.subtitle1().copyWith(
                color: AppColors.secondaryColor,
              ),
        ),
        const CircleWidget(),
        const SizedBox(
          height: 15,
        ),
        CustomButton(
          width: context.width * .5,
          width2: context.width * .4,
          text: 'صٌمتٌ يوما',
          onTap: () {
            Vibration.vibrate(intensities: [1]);
          },
        ),
      ],
    );
  }
}
