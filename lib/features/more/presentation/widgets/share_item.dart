import 'package:flutter/material.dart';
import 'package:seyamy/core/utils/helper.dart';

import 'container_widget.dart';

class ShareItem extends StatelessWidget {
  final String text;
  final Widget icon;
  final GestureTapCallback onTab;

  const ShareItem({
    super.key,
    required this.icon,
    required this.text,
    required this.onTab,
  });

  @override
  Widget build(BuildContext context) {
    return ContainerWidget(
      body: ListTile(
        leading: icon,
        title: Text(
          text,
          style: context.subtitle2(),
        ),
        onTap: onTab,
      ),
    );
  }
}
