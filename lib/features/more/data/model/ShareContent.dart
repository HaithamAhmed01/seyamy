import 'package:flutter/cupertino.dart';
import 'package:flutter_svg/svg.dart';

import '../../../../core/utils/app_assets.dart';

class ShareContent {
  ShareContent({
    required this.text,
    required this.icon,
    required this.onTab,
  });

  final String text;
  final Widget icon;
  final GestureTapCallback onTab;
}

List<ShareContent> dataShare = [
  ShareContent(
    text: "Share_header1",
    icon: SvgPicture.asset(Assets.iconsFacebook),
    onTab: () {},
  ),
  ShareContent(
    text: "Share_header2",
    icon: SvgPicture.asset(Assets.iconsTelegram),
    onTab: () {},
  ),
  ShareContent(
    text: "Share_header3",
    icon: SvgPicture.asset(Assets.iconsWhatsapp),
    onTab: () {},
  ),
  ShareContent(
    text: "Share_header4",
    icon: SvgPicture.asset(Assets.iconsCopy),
    onTab: () {},
  ),
];
