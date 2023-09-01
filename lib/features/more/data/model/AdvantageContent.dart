import 'package:flutter/cupertino.dart';
import 'package:flutter_svg/svg.dart';

import '../../../../core/utils/app_assets.dart';

class AdvantageContent {
  AdvantageContent({
    required this.header,
    required this.body,
    required this.icon,
  });

  final String header;
  final String body;
  final Widget icon;
}

List<AdvantageContent> dataAdvantage = [
  AdvantageContent(
    header: 'نبذه عن التطبيق',
    body:
        'تطبيق صيامي هو تطبيق بسيط وسهل الاستخدام تم تصميمه لمساعدة المسلمين في تتبع أيام الصيام المراد قضائها حيث يسمح التطبيق للمستخدمين بإدخال عدد الأيام التي يحتاجون إلى صيامها ويقوم بإرسال تذكيرات يومية لهم للصيام وتتوقف الاشعارات عند صيام جميع الايام.',
    icon: Image.asset(Assets.iconsIcLauncher),
  ),
  AdvantageContent(
    header: 'الوضع الليلي / الداكن',
    body:
        'قمنا باضافة الوضع الليلي في التطبيق حتي لا نؤثر علي تجربة المستخدمين الذين يفضلون هذا الوضع حفاظا علي راحة أعينهم.',
    icon: SvgPicture.asset(Assets.iconsMode),
  ),
  AdvantageContent(
    header: 'المصادر',
    body: 'مصادر فضل الصيام المذكورة في التطبيق كلها مأخوذه من الكتاب والسنه.',
    icon: SvgPicture.asset(Assets.iconsSources),
  ),
  AdvantageContent(
    header: 'تقييمك يهمنا',
    body:
        'منذ بداية نشر التطبيق ونحن نعمل علي التحديث والتطوير المستمر حتي يتناسب مع كل الهواتف فلا تتردد وتتجاهل تقييم التطبيق لدعمنا.',
    icon: SvgPicture.asset(Assets.iconsStar),
  ),
  AdvantageContent(
    header: 'مزايا اكثر',
    body: 'يحتوي التطبيق علي مميزات كثير لا يمكن حصرها\nاستخدمه واكتشفها.',
    icon: SvgPicture.asset(Assets.iconsCrown),
  ),
];
