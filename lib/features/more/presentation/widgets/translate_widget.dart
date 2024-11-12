import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:seyamy/core/utils/app_string.dart';
import 'package:seyamy/core/utils/helper.dart';
import 'package:seyamy/features/more/presentation/widgets/container_widget.dart';
import '../../../../core/utils/app_assets.dart';
import '../../../../core/utils/app_colors.dart';
import '../../../../core/utils/app_prefs.dart';
import '../../../../core/utils/app_values.dart';
import '../../../../core/utils/injection_container.dart';
import '../../../../core/utils/langauge_manager.dart';
import '../../../../core/widgets/buildBoxDecoration.dart';
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
    return ContainerWidget(
      child: ListTile(
        leading: const Icon(
          Icons.translate,
        ),
        title: Text(
          context.textTr(AppStrings.language),
          style: context.titleMedium(),
        ),
        onTap: () {
          showModalBottomSheet(
            context: context,
            isScrollControlled: true,
            backgroundColor: Colors.transparent,
            builder: (context) {
              return buildChooseLanguage();
            },
          );
        },
        trailing: const Icon(
          Icons.arrow_forward_ios,
          color: AppColors.labelColor,
        ),
      ),
    );
  }

  Widget buildChooseLanguage() {
    final themeCubit = BlocProvider.of<ThemeCubit>(context);
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(AppPadding.p16),
          topRight: Radius.circular(AppPadding.p16),
        ),
        color: themeCubit.them
            ? AppColors.backgroundColor
            : AppColors.backgroundDarkColor,
      ),
      child: Stack(
        children: [
          Padding(
            padding: const EdgeInsets.all(AppPadding.p16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              children: [
                Center(
                  child: Container(
                    width: 88,
                    height: 6,
                    decoration: ShapeDecoration(
                      color: themeCubit.them
                          ? AppColors.backgroundColor
                          : AppColors.backgroundDarkColor,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(100),
                      ),
                    ),
                  ),
                ),
                AppSize.s24.height,
                Text(
                  context.textTr(AppStrings.changeLanguage),
                  style: context.titleLarge(),
                ),
                AppSize.s16.height,
                _buildLanguageOption(
                  langCode: 'ar',
                  langName: 'العربية',
                  flagPath: Assets.iconsARFlag,
                ),
                AppSize.s16.height,
                _buildLanguageOption(
                  langCode: 'en',
                  langName: 'English',
                  flagPath: Assets.iconsENFlag,
                ),
                AppSize.s40.height,
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildLanguageOption({
    required String langCode,
    required String langName,
    required String flagPath,
  }) {
    final themeCubit = BlocProvider.of<ThemeCubit>(context);
    String selectedLanguage = context.locale.languageCode;
    return GestureDetector(
      onTap: () {
        setState(() {
          selectedLanguage = langCode;
          _appPreferences.changeAppLanguage();
          if (selectedLanguage == 'ar') {
            context.setLocale(const Locale('ar'));
          } else if (selectedLanguage != 'ar') {
            context.setLocale(const Locale('en'));
          }
        });
      },
      child: Container(
        padding: const EdgeInsets.symmetric(
          horizontal: AppPadding.p16,
          vertical: AppPadding.p16,
        ),
        decoration: buildShapeDecoration(themeCubit),
        child: Row(
          children: [
            SvgPicture.asset(
              flagPath,
              width: 40,
            ),
            AppSize.s8.width,
            Expanded(
              child: Text(langName, style: context.titleLarge()),
            ),
            SizedBox(
              width: 25,
              height: 25,
              child: SvgPicture.asset(
                langCode == selectedLanguage
                    ? Assets.iconsCheckCircle
                    : Assets.iconsRadioButtons,
                fit: BoxFit.fill,
                color: langCode == selectedLanguage
                    ? AppColors.primaryLightColor
                    : AppColors.subLightColor,
              ),
            ),
          ],
        ),
      ),
    );
  }

  bool rtl() {
    return context.locale == ARABIC_LOCAL;
  }
}
