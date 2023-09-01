import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:seyamy/core/utils/helper.dart';

import 'container_widget.dart';

class AdvantageItem extends StatelessWidget {
  final String header;
  final String body;
  final Widget icon;

  const AdvantageItem({
    super.key,
    required this.header,
    required this.body,
    required this.icon,
  });

  @override
  Widget build(BuildContext context) {
    return ContainerWidget(
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                icon,
                8.width,
                Text(
                  header,
                  style: context.subtitle2(),
                ),
              ],
            ),
            8.height,
            Text(
              body,
              style: context.bodyText2(),
            )
          ],
        ),
      ),
    );
  }
}
