import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:seyamy/core/utils/helper.dart';
import 'package:seyamy/features/more/presentation/widgets/container_widget.dart';

import '../../../../config/locale/app_localizations_setup.dart';
import '../../../../core/utils/app_assets.dart';
import '../../../../core/utils/app_colors.dart';
import '../../../../core/utils/app_prefs.dart';
import '../../../../core/utils/injection_container.dart';
import '../../../../core/utils/langauge_manager.dart';
import '../manger/theme_cubit/theme_cubit.dart';

class TranslateWidget extends StatefulWidget {
  const TranslateWidget({
    super.key,
  });

  @override
  State<TranslateWidget> createState() => _TranslateWidgetState();
}

class _TranslateWidgetState extends State<TranslateWidget> {
  final AppPreferences _appPreferences = sl<AppPreferences>();

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final themeCubit = BlocProvider.of<ThemeCubit>(context);
    String? dropdownNames = context.locale.languageCode;
    return ContainerWidget(
      body: Row(
        children: [
          Expanded(
            flex: 8,
            child: ListTile(
              leading: const Icon(
                Icons.translate,
              ),
              title: Text(
                context.textTr("Language"),
                style: context.subtitle2(),
              ),
            ),
          ),
          Expanded(
            flex: 4,
            child: DropdownButton(
              isExpanded: true,
              dropdownColor: themeCubit.them
                  ? AppColors.backgroundColor
                  : AppColors.backgroundDarkColor,
              padding: const EdgeInsets.symmetric(horizontal: 16),
              value: dropdownNames,
              style: context.subtitle2(),
              icon: Icon(
                Icons.keyboard_arrow_down,
                color: themeCubit.them
                    ? AppColors.labelColor
                    : AppColors.whiteColor,
              ),
              underline: 0.height,
              onChanged: (dynamic newValue) {
                setState(() {
                  dropdownNames = newValue;
                  _appPreferences.changeAppLanguage();
                  if (dropdownNames == 'ar') {
                    context.setLocale(const Locale('ar'));
                  } else if (dropdownNames != 'ar') {
                    context.setLocale(const Locale('en'));
                  }
                });
              },
              items: AppLocalizationsSetup.supportedLocales.map((category) {
                return DropdownMenuItem(
                  value: category.languageCode,
                  child: Text(
                    category.languageCode == 'ar' ? 'العربية' : 'English',
                    style: context.bodyText1(),
                  ),
                );
              }).toList(),
            ),
          ),
        ],
      ),
    );
  }

  bool rtl() {
    return context.locale == ARABIC_LOCAL;
  }
}
