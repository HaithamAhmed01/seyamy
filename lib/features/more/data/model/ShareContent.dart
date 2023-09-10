import 'package:flutter/cupertino.dart';


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




