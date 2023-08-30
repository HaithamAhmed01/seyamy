import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:seyamy/core/utils/app_assets.dart';
import 'package:seyamy/core/utils/helper.dart';

AppBar buildAppBar(String text, BuildContext context) {
  return AppBar(
    title: Text(
      text,
      style: context.subtitle1(),
    ),
    leading: Padding(
      padding: const EdgeInsets.symmetric(vertical: 10),
      child: SvgPicture.asset(
        Assets.iconsSmallLogo,
      ),
    ),
  );
}
