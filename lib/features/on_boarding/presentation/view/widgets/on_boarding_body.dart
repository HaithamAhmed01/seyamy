import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:seyamy/config/routes/app_rout.dart';
import 'package:seyamy/core/utils/app_colors.dart';
import 'package:seyamy/core/utils/helper.dart';

import '../../../../../core/utils/app_prefs.dart';
import '../../../../../core/utils/injection_container.dart';
import '../../../../../core/widgets/custom_button.dart';
import '../../../data/model/on_boarding_model.dart';
import 'dot_widget.dart';
import 'page_view_item.dart';

class OnBoardingBody extends StatefulWidget {
  const OnBoardingBody({super.key});

  @override
  State<OnBoardingBody> createState() => _OnBoardingBodyState();
}

class _OnBoardingBodyState extends State<OnBoardingBody> {
  int currentIndex = 0;
  late PageController _controller;
  final AppPreferences _appPreferences = sl<AppPreferences>();

  @override
  void initState() {
    _appPreferences.setOnBoardingScreenViewed();
    _controller = PageController(initialPage: 0);
    super.initState();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Column(
        children: [
          Expanded(
            child: PageView.builder(
              controller: _controller,
              itemCount: onBoarding.length,
              physics: const BouncingScrollPhysics(),
              onPageChanged: (int index) {
                setState(() {
                  currentIndex = index;
                });
              },
              itemBuilder: (context, index) {
                return PageViewItem(
                  onBoarding: onBoarding,
                  index: index,
                );
              },
            ),
          ),
          const SizedBox(
            height: 15,
          ),
          DotWidget(
            currentIndex: currentIndex,
            listIndex: onBoarding.length,
          ),
          const SizedBox(
            height: 42,
          ),
          currentIndex != 2
              ? CustomButton(
                  text: 'التالي',
                  color: AppColors.primaryColor,
                  onTap: () {
                    _controller.nextPage(
                        duration: const Duration(milliseconds: 250),
                        curve: Curves.easeInCirc);
                  },
                )
              : CustomButton(
                  text: 'ابدأ الآن',
                  color: AppColors.bottomColor,
                  onTap: () {
                    context.pushReplacement(AppRouts.layoutScreen);
                  },
                ),
          SizedBox(
            height: context.height * .04,
          ),
        ],
      ),
    );
  }
}
