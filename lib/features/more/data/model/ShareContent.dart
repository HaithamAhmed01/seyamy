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
    text: 'شارك التطبيق علي فيسبوك',
    icon: SvgPicture.asset(Assets.iconsFacebook),
    onTab: () {},
  ),
  ShareContent(
    text: 'شارك التطبيق علي تيليجرام',
    icon: SvgPicture.asset(Assets.iconsTelegram),
    onTab: () {},
  ),
  ShareContent(
    text: 'شارك التطبيق علي واتساب',
    icon: SvgPicture.asset(Assets.iconsWhatsapp),
    onTab: () {},
  ),
  ShareContent(
    text: 'اضغط لنسخ الرابط',
    icon: SvgPicture.asset(Assets.iconsCopy),
    onTab: () {},
  ),
];
