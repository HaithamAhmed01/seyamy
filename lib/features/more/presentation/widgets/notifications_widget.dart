import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:seyamy/core/utils/app_string.dart';
import 'package:seyamy/core/utils/helper.dart';
import 'package:seyamy/features/more/presentation/manger/notification_cubit/notification_cubit.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../../../core/utils/injection_container.dart';
import 'container_widget.dart';

class NotificationsWidget extends StatelessWidget {
  const NotificationsWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => NotificationCubit(
        preferences: sl.get<SharedPreferences>(),
      ),
      child: BlocBuilder<NotificationCubit, NotificationState>(
        builder: (context, state) {
          final notificationCubit = context.read<NotificationCubit>();
          return ContainerWidget(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                ListTile(
                  title: Text(
                    context.textTr(AppStrings.remindMe),
                    style: context.titleMedium().copyWith(
                          fontSize: 15.sp,
                          height: 1.4,
                        ),
                  ),
                  subtitle: Padding(
                    padding: const EdgeInsets.only(top: 8.0),
                    child: Text(
                      context.textTr(AppStrings.remindMeContent),
                      style: context.labelMedium().copyWith(height: 1.81),
                    ),
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
