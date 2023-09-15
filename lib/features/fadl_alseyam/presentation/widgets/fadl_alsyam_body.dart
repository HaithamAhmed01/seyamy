import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:seyamy/core/utils/app_assets.dart';
import 'package:seyamy/core/utils/helper.dart';

import 'fadl_list.dart';

class FadlAlseyamBody extends StatelessWidget {
  const FadlAlseyamBody({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      slivers: [
        SliverToBoxAdapter(
          child: 20.height,
        ),
        SliverToBoxAdapter(
          child: AspectRatio(
            aspectRatio: 1 / .4,
            child: Lottie.asset(Assets.animationFADL),
          ),
        ),
        SliverToBoxAdapter(
          child: 22.height,
        ),
        const FadlList(),
      ],
    );
  }
}
