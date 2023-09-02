import 'package:flutter/cupertino.dart';
import 'package:flutter_svg/svg.dart';

import '../../../../core/utils/app_assets.dart';

class AdvantageContent {
  AdvantageContent({
    required this.header,
    required this.body,
    required this.icon,
  });

  final String header;
  final String body;
  final Widget icon;
}

List<AdvantageContent> dataAdvantage = [
  AdvantageContent(
    header: "Advantage_header1",
    body: "Advantage_body1",
    icon: Image.asset(Assets.iconsIcLauncher),
  ),
  AdvantageContent(
    header: "Advantage_header2",
    body: "Advantage_body2",
    icon: SvgPicture.asset(Assets.iconsMode),
  ),
  AdvantageContent(
    header: "Advantage_header3",
    body: "Advantage_body3",
    icon: SvgPicture.asset(Assets.iconsSources),
  ),
  AdvantageContent(
    header: "Advantage_header4",
    body: "Advantage_body4",
    icon: SvgPicture.asset(Assets.iconsStar),
  ),
  AdvantageContent(
    header: "Advantage_header5",
    body: "Advantage_body5",
    icon: SvgPicture.asset(Assets.iconsCrown),
  ),
];
