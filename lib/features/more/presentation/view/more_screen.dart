import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/utils/app_colors.dart';
import '../../../../core/utils/app_prefs.dart';
import '../../../../core/utils/injection_container.dart';
import '../../../../core/utils/langauge_manager.dart';
import '../manger/theme_cubit/theme_cubit.dart';
import '../manger/theme_cubit/theme_state.dart';

class MoreScreen extends StatefulWidget {
  const MoreScreen({Key? key}) : super(key: key);

  @override
  State<MoreScreen> createState() => _MoreScreenState();
}

class _MoreScreenState extends State<MoreScreen> {
  final AppPreferences _appPreferences = sl<AppPreferences>();

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ThemeCubit, AppTheme>(
      builder: (context, state) {
        final themeCubit = BlocProvider.of<ThemeCubit>(context);
        return Container(
          padding: const EdgeInsets.symmetric(vertical: 16.0),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              ListTile(
                title: const Text('Light Theme'),
                trailing: Switch(
                  value: themeCubit.state == AppTheme.light,
                  onChanged: (value) {
                    if (value) {
                      themeCubit.setTheme(AppTheme.light);
                    } else {
                      themeCubit.setTheme(AppTheme.dark);
                    }
                  },
                ),
              ),
              ListTile(
                title: const Text('Dark Theme'),
                trailing: Switch(
                  value: themeCubit.state == AppTheme.dark,
                  onChanged: (value) {
                    if (value) {
                      themeCubit.setTheme(AppTheme.dark);
                    } else {
                      themeCubit.setTheme(AppTheme.light);
                    }
                  },
                ),
              ),
              ListTile(
                title: const Text('System Theme'),
                trailing: Switch(
                  value: themeCubit.state == AppTheme.system,
                  onChanged: (value) {
                    if (value) {
                      themeCubit.setTheme(AppTheme.system);
                    } else {
                      themeCubit.setTheme(AppTheme.light);
                    }
                  },
                ),
              ),
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
              )
            ],
          ),
        );
      },
    );
  }

  bool rtl() {
    return context.locale == ARABIC_LOCAL;
  }
}
