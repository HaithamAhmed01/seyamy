import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:seyamy/core/utils/app_colors.dart';
import 'package:seyamy/core/utils/app_fonts.dart';
import 'package:seyamy/core/utils/helper.dart';

import 'cut_circle_widget.dart';

class CircleWidget extends StatelessWidget {
  const CircleWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {},
      child: SizedBox(
        height: context.height * .5,
        child: Stack(
          alignment: Alignment.center,
          children: [
            const CutCircle(),
            Container(
              width: context.width / 1.6,
              height: context.height / 3.5,
              decoration: const BoxDecoration(
                borderRadius: BorderRadius.all(Radius.elliptical(372.0, 370.0)),
                color: Color(0xFFF6F7FA),
                boxShadow: [
                  BoxShadow(
                    color: Color.fromRGBO(0, 0, 0, 0.11),
                    offset: Offset(2.01, 2.01),
                    blurRadius: 4.02,
                  ),
                  BoxShadow(
                    color: Color.fromRGBO(255, 255, 255, 1),
                    offset: Offset(-6.03, -6.03),
                    blurRadius: 20.09,
                  ),
                  BoxShadow(
                    color: Color.fromRGBO(114, 142, 171, 0.1),
                    offset: Offset(4.02, 4.02),
                    blurRadius: 40.18,
                  ),
                ],
              ),
            ),
            Container(
              width: context.width / 1.8,
              height: context.height / 4,
              decoration: const BoxDecoration(
                borderRadius: BorderRadius.all(Radius.elliptical(372.0, 370.0)),
                color: Color(0xFFFFFFFF),
                boxShadow: [
                  BoxShadow(
                    color: Color.fromRGBO(164, 174, 183, 0.25),
                    offset: Offset(0, 4.01818),
                    blurRadius: 18.0818,
                  ),
                  BoxShadow(
                    color: Color.fromRGBO(164, 174, 183, 0.15),
                    offset: Offset(12.0545, 12.0545),
                    blurRadius: 32.1454,
                  ),
                  BoxShadow(
                    color: Colors.white,
                    offset: Offset(-4.01818, -4.01818),
                    blurRadius: 28.1272,
                  ),
                ],
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'الأيام المتبقية',
                    style: context.subtitle2().copyWith(
                          color: AppColors.yellow,
                        ),
                  ),
                  Text(
                    '30',
                    textAlign: TextAlign.left,
                    style: TextStyle(
                      color: AppColors.primaryColor,
                      fontFamily: AppFontConstants.fontFamily,
                      fontSize: 100.sp,
                      letterSpacing: 0,
                      fontWeight: FontWeight.bold,
                      height: 1,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
