import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:seyamy/core/utils/app_string.dart';
import 'package:seyamy/core/utils/helper.dart';
import 'package:seyamy/features/more/presentation/manger/notification_cubit/notification_cubit.dart';

import 'container_widget.dart';

class NotificationsWidget extends StatelessWidget {
  const NotificationsWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => NotificationCubit(),
      child: BlocBuilder<NotificationCubit, NotificationState>(
        builder: (context, state) {
          final notificationCubit = context.read<NotificationCubit>();
          return ContainerWidget(
            body: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                ListTile(
                  title: Text(
                    context.textTr(AppStrings.remindMe),
                    style: context
                        .subtitle2()
                        .copyWith(fontSize: 15.sp, height: 2),
                  ),
                  subtitle: Text(
                    context.textTr(AppStrings.remindMeContent),
                    style: context.caption().copyWith(height: 1.81),
                  ),
                  trailing: Switch(
                    value: state == NotificationState.enabled,
                    onChanged: (value) {
                      notificationCubit.toggleNotifications();
                    },
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
