import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:seyamy/core/utils/app_assets.dart';
import 'package:seyamy/core/utils/helper.dart';

import '../../data/model/ExpandableContent.dart';
import 'expandable_widget.dart';

class FadlAlseyamBody extends StatelessWidget {
  const FadlAlseyamBody({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        20.height,
        AspectRatio(
          aspectRatio: 1 / .4,
          child: Lottie.asset(Assets.animationFADL),
        ),
        22.height,
        const Expanded(
          child: ExpandableWidget(),
        ),
      ],
    );
  }
}
