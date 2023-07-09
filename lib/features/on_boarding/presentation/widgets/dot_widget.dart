import 'package:flutter/material.dart';
import 'package:seyamy/core/utils/app_colors.dart';

class DotWidget extends StatelessWidget {
  const DotWidget({
    Key? key,
    required this.currentIndex,
    required this.listIndex,
  }) : super(key: key);

  final int currentIndex;
  final int listIndex;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: List.generate(
        listIndex,
        (index) {
          return AnimatedContainer(
            duration: const Duration(milliseconds: 300),
            height: 10,
            width: currentIndex == index ? 35 : 10,
            margin: const EdgeInsets.only(right: 10),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20),
              // border: Border.all(
              //   color: currentIndex == index
              //       ? currentIndex == 2
              //           ? AppColors.primaryColor
              //           : AppColors.bottomColor
              //       : AppColors.grey,
              //   width: .5,
              // ),
              color: currentIndex == index
                  ? currentIndex == 2
                      ? AppColors.bottomColor
                      : AppColors.primaryColor
                  : currentIndex == 2
                      ? AppColors.bottomColor
                      : AppColors.primaryColor,
            ),
          );
        },
      ),
    );
  }
}
