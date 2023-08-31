import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:seyamy/core/utils/app_assets.dart';
import 'package:seyamy/core/utils/helper.dart';
import 'package:seyamy/features/more/presentation/widgets/container_widget.dart';

class AdvantagesBody extends StatelessWidget {
  const AdvantagesBody({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      physics: const BouncingScrollPhysics(),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            20.height,
            ContainerWidget(
              body: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16,vertical: 8),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        Image.asset(Assets.iconsIcLauncher),
                        8.width,
                        Text(
                          'نبذه عن التطبيق',
                          style: context.subtitle2(),
                        ),
                      ],
                    ),
                    8.height,
                    Text(
                      'تطبيق صيامي هو تطبيق بسيط وسهل الاستخدام تم تصميمه لمساعدة المسلمين في تتبع أيام الصيام المراد قضائها حيث يسمح التطبيق للمستخدمين بإدخال عدد الأيام التي يحتاجون إلى صيامها ويقوم بإرسال تذكيرات يومية لهم للصيام وتتوقف الاشعارات عند صيام جميع الايام.',
                      style: context.bodyText2(),
                    )
                  ],
                ),
              ),
            ),
            32.height,
            ContainerWidget(
              body: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16,vertical: 8),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        SvgPicture.asset(Assets.iconsMode),
                        8.width,
                        Text(
                          'الوضع الليلي / الداكن',
                          style: context.subtitle2(),
                        ),
                      ],
                    ),
                    8.height,
                    Text(
                      'قمنا باضافة الوضع الليلي في التطبيق حتي لا نؤثر علي تجربة المستخدمين الذين يفضلون هذا الوضع حفاظا علي راحة أعينهم.',
                      style: context.bodyText2(),
                    )
                  ],
                ),
              ),
            ),
            32.height,
            ContainerWidget(
              body: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16,vertical: 8),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        SvgPicture.asset(Assets.iconsSources),
                        8.width,
                        Text(
                          'المصادر',
                          style: context.subtitle2(),
                        ),
                      ],
                    ),
                    8.height,
                    Text(
                      'مصادر فضل الصيام المذكورة في التطبيق كلها مأخوذه من الكتاب والسنه.',
                      style: context.bodyText2(),
                    )
                  ],
                ),
              ),
            ),
            32.height,
            ContainerWidget(
              body: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16,vertical: 8),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        SvgPicture.asset(Assets.iconsStar),
                        8.width,
                        Text(
                          'تقييمك يهمنا',
                          style: context.subtitle2(),
                        ),
                      ],
                    ),
                    8.height,
                    Text(
                      'منذ بداية نشر التطبيق ونحن نعمل علي التحديث والتطوير المستمر حتي يتناسب مع كل الهواتف فلا تتردد وتتجاهل تقييم التطبيق لدعمنا.',
                      style: context.bodyText2(),
                    )
                  ],
                ),
              ),
            ),
            32.height,
            ContainerWidget(
              body: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16,vertical: 8),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        SvgPicture.asset(Assets.iconsCrown),
                        8.width,
                        Text(
                          'مزايا اكثر',
                          style: context.subtitle2(),
                        ),
                      ],
                    ),
                    8.height,
                    Text(
                      'يحتوي التطبيق علي مميزات كثير لا يمكن حصرها\nاستخدمه واكتشفها.',
                      style: context.bodyText2(),
                    )
                  ],
                ),
              ),
            ),
            30.height,
          ],
        ),
      ),
    );
  }
}
