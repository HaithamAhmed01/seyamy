import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:seyamy/core/utils/helper.dart';
import 'package:seyamy/features/more/presentation/widgets/them_widget.dart';
import 'package:seyamy/features/more/presentation/widgets/utils_widget.dart';

import '../../../../core/utils/app_colors.dart';
import '../../../../core/utils/app_prefs.dart';
import '../../../../core/utils/injection_container.dart';
import '../../../../core/utils/langauge_manager.dart';
import 'advantages_widget.dart';
import 'dev_widget.dart';
import 'notifications_widget.dart';

class MoreBody extends StatefulWidget {
  const MoreBody({Key? key}) : super(key: key);

  @override
  State<MoreBody> createState() => _MoreBodyState();
}

class _MoreBodyState extends State<MoreBody> {
  final AppPreferences _appPreferences = sl<AppPreferences>();

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16.0),
        child: Column(
          children: [
            20.height,
            const AdvantagesWidget(),
            32.height,
            const NotificationsWidget(),
            32.height,
            const ThemWidget(),
            32.height,
            const UtilsWidget(),
            32.height,
            const DevWidget(),
            IconButton(
              icon: const Icon(
                Icons.translate_outlined,
                color: AppColors.yellow,
              ),
              onPressed: () {
                _appPreferences.changeAppLanguage();
                if (context.locale.languageCode == 'ar') {
                  context.setLocale(const Locale('en'));
                } else {
                  context.setLocale(const Locale('ar'));
                }
              },
            ),
            30.height,
          ],
        ),
      ),
    );
  }

  bool rtl() {
    return context.locale == ARABIC_LOCAL;
  }
}
