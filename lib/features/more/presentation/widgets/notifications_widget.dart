import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:seyamy/core/utils/helper.dart';

import 'container_widget.dart';

class NotificationsWidget extends StatelessWidget {
  const NotificationsWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return ContainerWidget(
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ListTile(
            title: Text(
              context.textTr("Remind me of fasting on Mondays and Thursdays"),
              style: context.subtitle2().copyWith(fontSize: 15.sp, height: 2),
            ),
            subtitle: Text(
              context.textTr("Enable it if you want to receive notifications for fasting on Mondays and Thursdays every week"),
              style: context.caption().copyWith(height: 1.81),
            ),
            trailing: Switch(
              value: false,
              onChanged: (value) {},
            ),
          ),
        ],
      ),
    );
  }
}
