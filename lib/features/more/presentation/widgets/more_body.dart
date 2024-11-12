import 'package:flutter/material.dart';
import 'package:seyamy/core/utils/helper.dart';
import 'package:seyamy/features/more/presentation/widgets/them_widget.dart';
import 'package:seyamy/features/more/presentation/widgets/translate_widget.dart';
import 'package:seyamy/features/more/presentation/widgets/utils_widget.dart';
import 'package:seyamy/features/more/presentation/widgets/white_day_notifications_widget.dart';
import 'advantages_widget.dart';
import 'dev_widget.dart';
import 'notifications_widget.dart';

class MoreBody extends StatelessWidget {
  const MoreBody({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16.0),
        child: Column(
          children: [
            20.height,
            const AdvantagesWidget(),
            16.height,
            const NotificationsWidget(),
            16.height,
            const WhiteDayNotificationsWidget(),
            16.height,
            const ThemWidget(),
            16.height,
            const TranslateWidget(),
            16.height,
            const UtilsWidget(),
            16.height,
            const DevWidget(),
            30.height,
          ],
        ),
      ),
    );
  }
}
