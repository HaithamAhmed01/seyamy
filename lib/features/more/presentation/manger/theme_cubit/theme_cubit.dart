import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:seyamy/features/more/presentation/manger/theme_cubit/theme_state.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../../../../config/theme/dark_theme.dart';
import '../../../../../config/theme/light_theme.dart';

class ThemeCubit extends Cubit<AppTheme> {
  final SharedPreferences preferences;
  ThemeCubit({required this.preferences}) : super(AppTheme.light) {
    _initializeTheme();
  }

  static ThemeCubit get(context) => BlocProvider.of<ThemeCubit>(context);

  void _initializeTheme() {
    final savedTheme = preferences.getString('theme');
    if (savedTheme != null) {
      emit(AppTheme.values
          .firstWhere((theme) => theme.toString() == 'AppTheme.$savedTheme'));
    }
  }

  Future<void> setTheme(AppTheme theme) async {
    await preferences.setString('theme', theme.toString().split('.').last);
    emit(theme);
  }

  ThemeData _getCustomDarkTheme() {
    return dark;
  }

  ThemeData _getCustomLightTheme() {
    return light;
  }

  ThemeData? mapStateToThemeData(AppTheme state) {
    switch (state) {
      case AppTheme.light:
        return _getCustomLightTheme();
      case AppTheme.dark:
        return _getCustomDarkTheme();
      case AppTheme.system:
        final brightness = WidgetsBinding.instance.window.platformBrightness;
        return brightness == Brightness.light
            ? _getCustomLightTheme()
            : _getCustomDarkTheme();
    }
  }

  void toggleTheme() {
    final currentTheme = state;
    if (currentTheme == AppTheme.light) {
      setTheme(AppTheme.dark);
    } else {
      setTheme(AppTheme.light);
    }
  }
}
