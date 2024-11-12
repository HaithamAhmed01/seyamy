import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:seyamy/core/utils/app_string.dart';
import 'package:seyamy/core/utils/helper.dart';
import 'package:seyamy/core/widgets/buildLoadingDialog.dart';
import 'package:seyamy/features/more/presentation/manger/white_day_notification_cubit/white_day_notification_cubit.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../../../core/utils/injection_container.dart';
import 'container_widget.dart';

class WhiteDayNotificationsWidget extends StatelessWidget {
  const WhiteDayNotificationsWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => WhiteDayNotificationCubit(
        preferences: sl.get<SharedPreferences>(),
      ),
      child: BlocConsumer<WhiteDayNotificationCubit, WhiteDayNotificationState>(
        listener: (context, state) {
          if (state == WhiteDayNotificationState.loading) {
            buildLoadingDialog(context);
          } else if (state == WhiteDayNotificationState.enabled) {
            context.pop();
          }
        },
        builder: (context, state) {
          final notificationCubit = context.read<WhiteDayNotificationCubit>();
          return ContainerWidget(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                ListTile(
                  title: Text(
                    context.textTr(AppStrings.whiteDayRemind),
                    style: context.titleMedium().copyWith(
                          fontSize: 15.sp,
                          height: 1.4,
                        ),
                  ),
                  subtitle: Padding(
                    padding: const EdgeInsets.only(top: 8.0),
                    child: Text(
                      context.textTr(AppStrings.whiteDayRemindContent),
                      style: context.labelMedium().copyWith(height: 1.81),
                    ),
                  ),
                  trailing: Switch(
                    value: state == WhiteDayNotificationState.enabled,
                    onChanged: (value) {
                      notificationCubit.toggleWhiteDayNotifications();
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
